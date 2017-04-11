using CommonTool;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace NewJson.Controllers
{
    public class ChangeController : Controller
    {
        //
        // GET: /Change/

        public ActionResult FullHalf()
        {
            return View();
        }
        public ActionResult Hex2Str()
        {
            return View();
        }
        public ActionResult HexConvert()
        {
            return View();
        }
        public ActionResult Html2MarkDown()
        {
            return View();
        }
        public ActionResult HtmlUBB()
        {
            return View();
        }
        public ActionResult Image2Base64()
        {
        var xx=    Request.Files["files[]"]; 
            switch (Request["method"])
            {
                case "base64":

                    GetBase64();
                    break;
                default:
                    break;
            }
            return View();
        }
        public ActionResult J2F()
        {
            return View();
        }
        public ActionResult NativeAscii()
        {
            return View();
        }

        public ActionResult RgbHex()
        {
            return View();
        }
        public ActionResult ShortUrl()
        {
            switch (Request["method"])
            {
                case "encode":
                    Encode();
                    break;
                case "decode":
                    Decode();
                    break;
                default:
                    break;
            }
            return View();
        }
        public ActionResult ToPinYing()
        {
            return View();
        }
        public ActionResult ToUpperToLower()
        {
            return View();
        }

        public ActionResult Unix()
        {
            return View();
        }
        public ActionResult UrlConvert()
        {
            return View();
        }

        private void Encode()
        {
            string strUrl = Request["url"];
            if (!strUrl.Contains("http://") && !strUrl.Contains("https://"))
            {
                strUrl = "http://" + strUrl;
            }
            string json = Utils.SendWebRequest("http://api.t.sina.com.cn/short_url/shorten.json?source=1681459862&url_long=" + System.Web.HttpUtility.UrlEncode(strUrl));
            Response.Write(json);
            Response.End();
        }
        private void Decode()
        {
            HttpWebResponse response = HttpTool.GetHttpWebResponse(Request["url"], new System.Net.CookieContainer());
            string result = JsonConvert.SerializeObject(new { content = response.ResponseUri });
            Response.Write(result);
            Response.End();
        }


        private void GetBase64()
        {
            Stream stream = Request.Files["files[]"].InputStream;

            string result = JsonConvert.SerializeObject(new { content = ImgToBase64String(stream) });
            Response.Write(result);
            Response.End();

        }


        //图片 转为    base64编码的文本
        private string ImgToBase64String(Stream ms)
        {
            try
            {


                byte[] arr = new byte[ms.Length];
                ms.Position = 0;
                ms.Read(arr, 0, (int)ms.Length);
                ms.Close();

                String strbaser64 = Convert.ToBase64String(arr);

                return strbaser64;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
    }
}