using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace NewJson.Controllers
{
    public class EncDecController : Controller
    {
        //
        // GET: /EncDec/
        public ActionResult Base64()
        {
            return View();
        }
        public ActionResult Escape()
        {
            return View();
        }
        public ActionResult Htpasswd()
        {
            return View();
        }
        public ActionResult JsEval()
        {
            return View();
        }
        public ActionResult MD5()
        {
            return View();
        }
        public ActionResult Morse()
        {
            return View();
        }
        public ActionResult SHA()
        {
            return View();
        }
        public ActionResult UrlEncode()
        {
            return View();
        }
        public ActionResult Utf8()
        {
            return View();
        }
        public ActionResult UnicodeToChinese()
        {
            return View();
        }
        /// <summary>
        /// 对称加密
        /// </summary>
        /// <returns></returns>
        public ActionResult AESDES()
        {
            return View();
        }
        public ActionResult RandomPassword()
        {
            ViewBag.randomcharset = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ~!@#$%^&*()_+";
            ViewBag.symbols = "~!@#$%^&*()_+";
            return View();
        }
        public ActionResult CreateUUID()
        {

            return View();
        }
    }
}