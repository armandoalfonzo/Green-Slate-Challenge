using GSC.DataAcces;
using GSC.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Services
{
    public class Service : IService
    {
        private GreenSlateDBContext DbContext;

        public Service()
        {
            DbContext = new GreenSlateDBContext();
        }

        public IList<User> GetAllUsers()
        {
            return DbContext.User.ToList();
        }

        public IList<Project> GetProjectsByUser(int UserId)
        {
            return DbContext.Project.Where(x => x.UserProject.Any(y => y.UserId == UserId)).ToList();
        }

        public UserProject GetUserProjectByIds(int UserId, int ProjectId)
        {
            return DbContext.UserProject.FirstOrDefault(x => x.ProjectId == ProjectId && x.UserId == UserId);
        }

        public void SaveChanges()
        {
            DbContext.SaveChanges();
        }
    }
}
