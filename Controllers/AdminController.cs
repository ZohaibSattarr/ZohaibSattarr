using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using TeacherEvalutionV2.DB;
using TeacherEvalutionV2;
using System.Data.SqlClient;
using System.Data;

namespace TeacherEvalutionV2.Controllers
{
    public class AdminController : ApiController
    {
        BiitDBNewEntities4 db = new BiitDBNewEntities4();
        [Route("api/admin/addsinglequestion")]
        [HttpPost]
        public HttpResponseMessage AddSingleQuestion(Question quest)
        {
            try
            {

                db.Questions.Add(quest);
                db.SaveChanges();
                return Request.CreateResponse(HttpStatusCode.OK, "success");
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message);
            }
        }
        [Route("api/admin/AddQuestions")]
        [HttpPost]
        public HttpResponseMessage AddQuestions(Question[] quest)
        {
            try
            {
                using (var temp = new BiitDBNewEntities4())
                {
                    foreach (Question c in quest)
                    {
                        temp.Questions.Add(c);
                    }
                    int n = temp.SaveChanges();
                    return Request.CreateResponse(HttpStatusCode.OK, "Saved");
                }
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message);
            }
        }
        [HttpGet]
        [Route("api/Admin/AdminLogin/{usertype}/{userid}/{password}")]
        public HttpResponseMessage AdminLogin(String usertype,String userid,String password)
        {
            try
            {
                var AdminFound = db.Log_In.FirstOrDefault(s => s.User_type == usertype && s.User_id == userid && s.User_password ==password);
                if (AdminFound == null)
                    return Request.CreateResponse(HttpStatusCode.NotFound, "incorrect Creddiatenals");

                return Request.CreateResponse(HttpStatusCode.OK, new { AdminFound.User_type, AdminFound.User_name });
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message);
            }
        }
    }
}
