using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GSC.WebUI.DTO
{
    public class ProjectDTO
    {
        public int Id { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public int Credits { get; set; }
        public string Status { get; set; }
        public string TimeToStart { get; set; }
        
    }
}
