﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace NewJson.Controllers
{
    public class ToolsController : Controller
    {
        // GET: Tools

        public ActionResult FuHao()
        {
            return View();
        }
        public ActionResult QRDeCode()
        {
            return View();
        }
        public ActionResult TextEditor()
        {
            return View();
        }
        public ActionResult WordCounter()
        {
            return View();
        }

    }
}