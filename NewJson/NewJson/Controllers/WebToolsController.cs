﻿using CommonTool;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;

namespace NewJson.Controllers
{
    public class WebToolsController : Controller
    {
        // GET: WebTools
        public ActionResult ClientInfo()
        {
            return View();
        }
        public ActionResult HttpTest()
        {
            return View();
        }
        public ActionResult IPAddress()
        {
            switch (Request["method"])
            {
                case "address":
                    GetAddress();
                    break;
                default:
                    break;
            }
            return View();
        }
        public ActionResult Ips()
        {
            switch (Request["method"])
            {
                case "address":
                    GetAddress();
                    break;
 
                default:
                    break;
            }
            return View();
        }
        public ActionResult UserAgent()
        {
            return View();
        }
        private void GetAddress()
        {
            string ip = Request["ip"];
            string htm = HttpHelper.SendGet("http://www.ip138.com/ips138.asp?ip=" + ip + "&action=2");
            htm = htm.Replace("\t", "");

            string reg = "(<h1>(.*?)</h1>)";
            string reg1 = "(<ul class=\"ul1\">(.*?)</ul>)";
            StringBuilder result = new StringBuilder();
            result.Append(GetByReg(htm, reg, 0));
            result.Append(GetByReg(htm, reg1, 0));
            Response.Write(result);
            Response.End();

        }
        public string GetByReg(string html, string reg, int i)
        {

            string result = "";
            Regex r = new Regex(reg);
            if (r.IsMatch(html))
            {
                Match m = r.Match(html);
                result = m.Groups[i].Value;
            }
            return result;
        }
    }
}