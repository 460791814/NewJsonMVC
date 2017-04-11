using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace NewJson.Controllers
{
    public class ValidateController : Controller
    {
        //
        // GET: /Validate/
        public ActionResult Regex()
        {
            
            ViewBag.email = @"[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?";
            return View();
        }
	}
}