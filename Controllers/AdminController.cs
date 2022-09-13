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
using System.Xml.Linq;

namespace TeacherEvalutionV2.Controllers
{
    public class AdminController : ApiController
    {
        BiitDBNewEntities13 db = new BiitDBNewEntities13();
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
                using (var temp = new BiitDBNewEntities13())
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
        [HttpGet]
        [Route("api/Admin/getempno/{name}")]
        public HttpResponseMessage getempno(String name)
        {
            try
            {
                var AdminFound = db.EMPMTRs.FirstOrDefault(s => s.Emp_firstname+s.Emp_middle+s.Emp_lastname == name);
                if (AdminFound == null)
                    return Request.CreateResponse(HttpStatusCode.NotFound, "incorrect Creddiatenals");

                return Request.CreateResponse(HttpStatusCode.OK, new { AdminFound.Emp_no });
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message);
            }
        }
        [Route("api/admin/GetTemplate")]
        [HttpGet]
        public HttpResponseMessage GetTemplate()
        {
            try
            {
                var TemplateList = db.temples.Select(s => new
                {
                    TeacherName = s.TeacherName,
                    CourseName = s.CourseName,
                    SemesterNo = s.SemesterNo,
                    Templatename = s.Templatename
                }).ToList();
                return Request.CreateResponse(HttpStatusCode.OK, TemplateList);

            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }
        [Route("api/admin/AddTemplate")]
        [HttpPost]
        public HttpResponseMessage AddTemplate(temple[] tmp)
        {
            try
            {
                using (var te = new BiitDBNewEntities13())
                {
                    foreach (temple c in tmp)
                    {
                        te.temples.Add(c);
                    }
                    int n = te.SaveChanges();
                    return Request.CreateResponse(HttpStatusCode.OK, "Saved");
                }
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message);
            }
        }
        [Route("api/admin/UpdateSemester")]
        [HttpPost]
        public HttpResponseMessage UpdateSemester(temple id)
        {
            try
            {
                using (var db = new BiitDBNewEntities13())
                {
                    db.temples
                      .Where(x => id.Templatename.Contains(x.Templatename))
                      .ToList()
                      .ForEach(a => a.SemesterNo = id.SemesterNo);

                    db.SaveChanges();
                    return Request.CreateResponse(HttpStatusCode.OK, "Saved");
                }

            }
            catch(Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message);
            }
            
        }
        [Route("api/admin/UpdateCourse")]
        [HttpPost]
        public HttpResponseMessage UpdateCourse(temple id)
        {
            try
            {
                using (var db = new BiitDBNewEntities13())
                {
                    db.temples
                      .Where(x => id.Templatename.Contains(x.Templatename))
                      .ToList()
                      .ForEach(a => a.CourseName = id.CourseName);

                    db.SaveChanges();
                    return Request.CreateResponse(HttpStatusCode.OK, "Saved");
                }

            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message);
            }

        }
    } 
}
