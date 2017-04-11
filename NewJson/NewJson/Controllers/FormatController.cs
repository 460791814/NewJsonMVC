using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace NewJson.Controllers
{
    public class FormatController : Controller
    {
        //
        // GET: /Format/
        public ActionResult CssFormat()
        {
            return View();
        }
        public ActionResult JsHtmlFormat()
        {
            return View();
        }
        public ActionResult SqlFormat()
        {
            return View();
        }
        public ActionResult XmlFormat()
        {
            return View();
        }
	}
}