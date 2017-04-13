using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace NewJson.Controllers
{
    /// <summary>
    /// 站长工具
    /// </summary>
    public class AdminController : Controller
    {
        //
        // GET: /Admin/
        public ActionResult Meta()
        {
            return View();
        }
        public ActionResult Robots() {
            return View();
        }
	}
}