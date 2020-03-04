using GSC.WebUI.DTO;
using Microsoft.AspNetCore.Mvc;
using Services;
using System;
using System.Linq;
using GSC.WebUI.Constants;

namespace GSC.WebUI.Controllers
{
    public class UserProjectController : Controller
    {
        private readonly IService _service;

        public UserProjectController(IService service)
        {
            _service = service;
        }

        // GET: UserProject
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult GetUsers()
        {
            var Users = _service.GetAllUsers();
            return Json(Users); ;
        }

        [HttpGet]
        public ActionResult GetProjectsByUser(int UserId)
        {
            var ProjectDTOList =  _service.GetProjectsByUser(UserId).Select(P => new ProjectDTO {
                Id = P.Id,
                StartDate = P.StartDate.ToString("yyyy-MM-dd"),
                EndDate = P.EndDate.ToString("yyyy-MM-dd"),
                Credits = P.Credits,
                Status = _service.GetUserProjectByIds(UserId, P.Id).IsActive ? Status.Active : Status.Inactive,
                TimeToStart = GetTimeToStart(P.StartDate, _service.GetUserProjectByIds(UserId, P.Id).AssignedDate)
            });

            return Json(ProjectDTOList);
        }

        private string GetTimeToStart(DateTime StartDate, DateTime AssignedDate)
        {
            double difDays = (StartDate - AssignedDate).TotalDays;
            string result = string.Empty;
            if (difDays < 0)
            {
                result = "Started";
            }
            else if(difDays == 1) 
            {
                result = $"{difDays} Day";
            }
            else
            {
                result = $"{difDays} Days";
            }
            return result;            
        }
    }
}