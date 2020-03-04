using GSC.Models;
using System;
using System.Collections.Generic;

namespace Services
{
    public interface IService
    {
        IList<User> GetAllUsers();
        void SaveChanges();
        IList<Project> GetProjectsByUser(int UserId);
        UserProject GetUserProjectByIds(int UserId, int ProjectId);
    }
}
