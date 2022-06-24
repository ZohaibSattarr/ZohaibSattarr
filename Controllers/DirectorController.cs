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
    public class DirectorController : ApiController
    {
        BiitDBNewEntities4 db = new BiitDBNewEntities4();

        [HttpPost]
        [Route("api/Director/getAverage1")]
        public HttpResponseMessage getAverage1(Eval[] eval)
        {
            try
            {
                List<dynamic> lst = new List<dynamic>();
                foreach (var item in eval)
                {
                    var employees = db.Evals.Where(w => w.Emp_no == item.Emp_no && w.Course_no == item.Course_no && w.Semester_no == item.Semester_no)
                        .Select(x => new
                        {
                            x.Emp_no,
                            x.Reg_No,
                            x.Course_no,
                            x.Question_Desc,
                            x.Semester_no,
                            x.Answer_Marks,
                            x.Answer_Desc
                        });

                    var data = employees.GroupBy(m => m.Question_Desc).Select(x => new
                    {
                        Emp_no = x.FirstOrDefault().Emp_no,
                        Question_Desc = x.Key,
                        QuestionCount = x.Count(),
                        AverageMarks = x.Average(y => y.Answer_Marks)
                    }).ToList();
                    //if (data.Count() == 0)
                    //{
                    //    List<dynamic> emptyList = new List<dynamic>();
                    //    return Request.CreateResponse(HttpStatusCode.OK,emptyList );
                    //}
                    lst.Add(data);
                }

                return Request.CreateResponse(HttpStatusCode.OK, lst);
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex);
            }
        }

        [HttpGet]
        [Route("api/Director/getAverage")]
        public HttpResponseMessage getAverage()
        {
            try
            {
                var res = db.Evals.Where(w => w.Emp_no == "BIIT361" && w.Course_no == "CS-497" && w.Semester_no == "2021FM");
                var employees = db.Evals.Where(w => w.Emp_no == "BIIT361" && w.Course_no == "CS-497" && w.Semester_no == "2021FM")
                    .Select(x => new
                    {
                        x.Emp_no,
                        x.Reg_No,
                        x.Course_no,
                        x.Question_Desc,
                        x.Semester_no,
                        x.Answer_Marks,
                        x.Answer_Desc
                    });

                var data = employees.GroupBy(m => m.Question_Desc).Select(x => new
                {
                    Emp_no = x.FirstOrDefault().Emp_no,
                    Question_Desc = x.Key,
                    QuestionCount = x.Count(),
                    AverageMarks = x.Average(y => y.Answer_Marks)
                }).ToList();
                return Request.CreateResponse(HttpStatusCode.OK, data);
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex);
            }
        }

        [HttpGet]
        [Route("api/Director/get_Teachers_List")]
        public HttpResponseMessage get_Teachers_List()
        {
            try
            {
                var teachersList = db.EMPMTRs.Where(w => w.Emp_no != "").Select(s => new
                {
                    s.Emp_no,
                    Name = s.Emp_firstname + " " + s.Emp_middle + " " + s.Emp_lastname
                }).OrderBy(o => o.Name);
                return Request.CreateResponse(HttpStatusCode.OK, teachersList);
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex);
            }
        }

        [HttpGet]
        [Route("api/Director/get_Course_List")]
        public HttpResponseMessage get_Course_List()
        {
            try
            {

                var coursesList = db.CrsmtrShorts.Select(s => new
                {
                    s.Course_No,
                    s.Course_Desc,
                    s.Title
                }).OrderBy(o => o.Title).Distinct();
                return Request.CreateResponse(HttpStatusCode.OK, coursesList);
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex);
            }
        }

        [HttpGet]
        [Route("api/Director/get_Semester_List")]
        public HttpResponseMessage get_Semester_List()
        {
            try
            {
   
                var semesterList = db.SEMMTRs.Select(s => new
                {
                    s.Semester_no,
                    s.Semester_desc
                }).OrderByDescending(o => o.Semester_no);
                return Request.CreateResponse(HttpStatusCode.OK, semesterList);
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex);
            }
        }
    }
}
