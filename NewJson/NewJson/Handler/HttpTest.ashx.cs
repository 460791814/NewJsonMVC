using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.IO.Compression;
using System.IO;
using System.Text;
using System.Net.Security;
using System.Text.RegularExpressions;
using Newtonsoft.Json;
using System.Security.Cryptography.X509Certificates;
using CommonTool;

namespace NewJson.WebTools.Handler
{
    /// <summary>
    /// HttpTest 的摘要说明
    /// </summary>
    public class HttpTest : IHttpHandler
    {


        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            switch (context.Request["method"])
            {
                case "send":
                    SendRequest(context);
                    break;
                default:
                    context.Response.Clear();
                    context.Response.Write(HttpHelper.SendGet(context.Request["url"]));
                    break;
            }
        }
        private void SendRequest(HttpContext context)
        {
            string headerStr = "";
            string html = "";
            try
            {

 
                Dictionary<string, string> headerDic = new Dictionary<string, string>();
                Dictionary<string, string> dicParam = new Dictionary<string, string>();
             
                string type = context.Request["type"];
                string url = context.Request["url"];
 

                var formData = context.Request.Form;
                if (formData != null)
                {
                    foreach (var key in formData.AllKeys)
                    {
                        if (!string.IsNullOrEmpty(key))
                        {
                            if (key.Contains("pn"))
                            {
                                string p = context.Request[key];
                                string v = context.Request[key.Replace("n", "v")];

                                dicParam.Add(p, v);
                            }
                            if (key.Contains("hn"))
                            {
                                string p = context.Request[key];
                                string v = context.Request[key.Replace("n", "v")];
                                headerDic.Add(p, v);
                            }
                        }
                    }
                }
                WebUtils webUtils = new WebUtils();
                webUtils.headerDic = headerDic;
                switch (type)
                {
                    case "GET":
                        html = webUtils.DoGet(url, dicParam);
                        break;

                    default:


                        html = webUtils.DoPost(url, dicParam);

                        break;
                }

                headerStr = webUtils.headerStr.ToString();
                string result = JsonConvert.SerializeObject(new { content = html.Trim(), header = headerStr });
                context.Response.Clear();
                context.Response.Write(result);


            }
            catch (Exception e)
            {

                string result = JsonConvert.SerializeObject(new { content = e.Message, header = headerStr.ToString() });
                context.Response.Clear();
                context.Response.Write(result);


            }
        }


        public bool IsReusable
        {
            get { return true; }
        }
    }
}