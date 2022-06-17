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
    public class StudentController : ApiController
    {
        bool isAdmin = false;
        BiitDBNewEntities4 db = new BiitDBNewEntities4();

        
        [Route("api/student/login/{userName}/{password}")]
        [HttpGet]
        public HttpResponseMessage login(string userName, int password)
        {
            try
            {
                var Userfound = db.STMTRs.FirstOrDefault(s => s.Reg_No == userName && s.PASSWORD == password);
                if (Userfound == null)
                    return Request.CreateResponse(HttpStatusCode.NotFound, "incorrect Creddiatenals");

                return Request.CreateResponse(HttpStatusCode.OK, Userfound.Semester_no);
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message);
            }
        }
        [Route("api/student/GetCourses/{regno}/{year}")]
        [HttpGet]
        public IHttpActionResult GetCourses(string regno, string year)
        {
            try
            {
                var course = (from c in db.Crsdtls
                              join d in db.CRSMTRs on c.SOS equals d.SOS
                              join e in db.EMPMTRs on c.Emp_no equals e.Emp_no
                              where c.REG_NO == regno && c.SEMESTER_NO == year && c.DISCIPLINE == d.Discipline && c.Course_no == d.Course_no
                              select new
                              {
                                  c.Course_no,
                                  d.Course_desc,
                                  c.DISCIPLINE,
                                  c.SECTION,
                                  c.SEMESTER_NO,
                                  e.Emp_firstname,
                                  e.Emp_lastname,
                                  e.Emp_no
                              });
                return Json(course);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [Route("api/student/GetQuestions")]
        [HttpGet]
        public HttpResponseMessage GetQuestions()
        {
            try
            {
                var questionList = db.Questions.Select(s => new
                {
                    Question_ID = s.Question_ID,
                    Question1 = s.Question1,
                    Description = s.Description,


                }).Take(15).ToList(); 
                return Request.CreateResponse(HttpStatusCode.OK, questionList);

            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }
        [Route("api/student/NavBar/{regno}/{year}")]
        [HttpGet]

        public IHttpActionResult NavBar(string regno, string year)
        {
            try
            {
                var getStd = (from c in db.Crsdtls
                              join d in db.STMTRs on c.REG_NO equals d.Reg_No
                              join e in db.SEMMTRs on c.SEMESTER_NO equals e.Semester_no
                              where c.REG_NO == regno && d.Reg_No == regno && c.SEMESTER_NO == year && e.Semester_no == year
                              select new
                              {
                                  c.SECTION,
                                  c.DISCIPLINE,
                                  d.St_firstname,
                                  d.St_middlename,
                                  d.St_lastname,
                                  d.Reg_No,
                                  e.Semester_no,
                                  e.Semester_desc
                              }).Distinct();
                return Json(getStd);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [Route("api/student/addStdEvaluation")]
        [HttpPost]
        public HttpResponseMessage addStdEvaluation(Eval obj)
        {
            try
            {
                db.Evals.Add(obj);
                db.SaveChanges();
                return Request.CreateResponse(HttpStatusCode.OK, "Submitted Successfully!");
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message);
            }
        }
    }
}
