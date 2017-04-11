using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Text;
using System.Web;
using System.Net.Security;
using System.Security.Authentication;
using System.Security.Cryptography.X509Certificates;

namespace CommonTool
{
    /// <summary>
    /// 网络工具类。
    /// </summary>
    public sealed class WebUtils
    {
        private int _timeout = 100000;
     
        /// <summary>
        /// 请求与响应的超时时间
        /// </summary>
        public int Timeout
        {
            get { return this._timeout; }
            set { this._timeout = value; }
        }
        public StringBuilder headerStr = new StringBuilder();
        public Dictionary<string, string> headerDic;
         
        /// <summary>
        /// 执行HTTP POST请求。
        /// </summary>
        /// <param name="url">请求地址</param>
        /// <param name="parameters">请求参数</param>
        /// <returns>HTTP响应</returns>
        public string DoPost(string url, IDictionary<string, string> parameters)
        {
            //接口请求地址处理
            url = url.TrimEnd('/');
          
            HttpWebRequest req = GetWebRequest(url, "POST");
            req.ContentType = "application/x-www-form-urlencoded;charset=utf-8";

            byte[] postData = Encoding.UTF8.GetBytes(BuildQuery(parameters));
            System.IO.Stream reqStream = req.GetRequestStream();
            reqStream.Write(postData, 0, postData.Length);
            reqStream.Close();

            HttpWebResponse rsp = (HttpWebResponse)req.GetResponse();
            Encoding encoding = Encoding.GetEncoding(rsp.CharacterSet);
            return GetResponseAsString(rsp, encoding);
        }

        /// <summary>
        /// 执行HTTP GET请求。
        /// </summary>
        /// <param name="url">请求地址</param>
        /// <param name="parameters">请求参数</param>
        /// <returns>HTTP响应</returns>
        public string DoGet(string url, IDictionary<string, string> parameters)
        {
            //接口请求地址处理
            url = url.TrimEnd('/');
      
            
            if (parameters != null && parameters.Count > 0)
            {
                if (url.Contains("?"))
                {
                    url = url + "&" + BuildQuery(parameters);
                }
                else
                {
                    url = url + "?" + BuildQuery(parameters);
                }
            }

            HttpWebRequest req = GetWebRequest(url, "GET");
            req.ContentType = "application/x-www-form-urlencoded;charset=utf-8";

            HttpWebResponse rsp = (HttpWebResponse)req.GetResponse();
            Encoding encoding = Encoding.GetEncoding(rsp.CharacterSet);
            return GetResponseAsString(rsp, encoding);
        }

        /// <summary>
        /// 执行带文件上传的HTTP POST请求。
        /// </summary>
        /// <param name="url">请求地址</param>
        /// <param name="textParams">请求文本参数</param>
        /// <param name="fileParams">请求文件参数</param>
        /// <returns>HTTP响应</returns>
        //public string DoPost(string url, IDictionary<string, string> textParams, IDictionary<string, FileItem> fileParams)
        //{
        //    // 如果没有文件参数，则走普通POST请求
        //    if (fileParams == null || fileParams.Count == 0)
        //    {
        //        return DoPost(url, textParams);
        //    }

        //    string boundary = DateTime.Now.Ticks.ToString("X"); // 随机分隔线

        //    HttpWebRequest req = GetWebRequest(url, "POST");
        //    req.ContentType = "multipart/form-data;charset=utf-8;boundary=" + boundary;

        //    System.IO.Stream reqStream = req.GetRequestStream();
        //    byte[] itemBoundaryBytes = Encoding.UTF8.GetBytes("\r\n--" + boundary + "\r\n");
        //    byte[] endBoundaryBytes = Encoding.UTF8.GetBytes("\r\n--" + boundary + "--\r\n");

        //    // 组装文本请求参数
        //    string textTemplate = "Content-Disposition:form-data;name=\"{0}\"\r\nContent-Type:text/plain\r\n\r\n{1}";
        //    IEnumerator<KeyValuePair<string, string>> textEnum = textParams.GetEnumerator();
        //    while (textEnum.MoveNext())
        //    {
        //        string textEntry = string.Format(textTemplate, textEnum.Current.Key, textEnum.Current.Value);
        //        byte[] itemBytes = Encoding.UTF8.GetBytes(textEntry);
        //        reqStream.Write(itemBoundaryBytes, 0, itemBoundaryBytes.Length);
        //        reqStream.Write(itemBytes, 0, itemBytes.Length);
        //    }

        //    // 组装文件请求参数
        //    string fileTemplate = "Content-Disposition:form-data;name=\"{0}\";filename=\"{1}\"\r\nContent-Type:{2}\r\n\r\n";
        //    IEnumerator<KeyValuePair<string, FileItem>> fileEnum = fileParams.GetEnumerator();
        //    while (fileEnum.MoveNext())
        //    {
        //        string key = fileEnum.Current.Key;
        //        FileItem fileItem = fileEnum.Current.Value;
        //        string fileEntry = string.Format(fileTemplate, key, fileItem.GetFileName(), fileItem.GetMimeType());
        //        byte[] itemBytes = Encoding.UTF8.GetBytes(fileEntry);
        //        reqStream.Write(itemBoundaryBytes, 0, itemBoundaryBytes.Length);
        //        reqStream.Write(itemBytes, 0, itemBytes.Length);

        //        byte[] fileBytes = fileItem.GetContent();
        //        reqStream.Write(fileBytes, 0, fileBytes.Length);
        //    }

        //    reqStream.Write(endBoundaryBytes, 0, endBoundaryBytes.Length);
        //    reqStream.Close();

        //    HttpWebResponse rsp = (HttpWebResponse)req.GetResponse();
        //    Encoding encoding = Encoding.GetEncoding(rsp.CharacterSet);
        //    return GetResponseAsString(rsp, encoding);
        //}

        public bool CheckValidationResult(object sender, X509Certificate certificate, X509Chain chain, SslPolicyErrors errors)
        { //直接确认，否则打不开
            return true;
        }

        public HttpWebRequest GetWebRequest(string url, string method)
        {
            HttpWebRequest req = null;
            if (url.Contains("https"))
            {
                ServicePointManager.ServerCertificateValidationCallback = new RemoteCertificateValidationCallback(CheckValidationResult);
                req = (HttpWebRequest)WebRequest.CreateDefault(new Uri(url));
            }
            else
            {
                req = (HttpWebRequest)WebRequest.Create(url);
            }

            req.ServicePoint.Expect100Continue = false;
            req.Method = method;
            req.KeepAlive = true;
            req.UserAgent = "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.117 Safari/537.36";
            req.Timeout = this._timeout;
            if (headerDic != null && headerDic.Count > 0)
            {
                foreach (var item in headerDic)
                {
                    req.Headers[item.Key]= item.Value;
                }
            }
            //这样可以设置cookie
           // req.Headers["Cookie"] = "ASP.NET_SessionId=oo1mecy4brjrek3ehcvt2ab5; xk.passport=BD90917E9EA0A7BB15486104FDBBAB1911372301FCFAAF6CB6F14C1D43AC22E9DD432BE98D51A50E86E932FC71BBDF05A6A9B022C35AEC16C86491B526FCB6DDADEE009C2A874644D037BDFD77A84F01EE5FC349ED4DB8EA1ACEAAC35E0E6C46B9C07174E19456852AF6B7FDCFD22B71B57A7B92C68FA4686D409C288D7B4DA34863A61833769BB294C51FBDB58B3B2D8263C3AA20E9F3599D7DBCF894B0C728A89C5D34C840D4524057CBB6CB923AB85285573FE8696795948307AB4A294D83E1C46FACBFA51075D03AD58368D9903810A1007528757019FB91693260235B4087F784575B615A9ED138BC289E2E9BF9E2B6385E3F4603F8735D71746C8B201814AF07096D52BB5C9F56D00573A85DC65115A5AF397D65F86D24D6CD134F1060D3113C1B2774FFE8DE4580CBDCA47D6B5067C5CCF4A788F8A281818DFF837576871E846CE396E20B54F5F2D19D06096A8868F33489E0EE53B9666944CE777ACA28F2FA598CCE0CCEF5D6909D5AB230556CB94523E530C413782408A4CBE0BE0AE961361B1F0BDE17F844342FC259A893FE5CDD9FFD8E9F9D4D66D29CB4890409E59377E0D01822DAC2C539F64EEF2554FA53D3FF; xk.passport.uid=11314979; xk.passport.info=%7b%22UserId%22%3a11314979%2c%22UserName%22%3a%22carl110%22%2c%22Identity%22%3a3%2c%22UserGroupID%22%3a1%2c%22SchoolId%22%3a30%7d; Hm_lvt_0e522924b4bbb2ce3f663e505b2f1f9c=1491736033; Hm_lpvt_0e522924b4bbb2ce3f663e505b2f1f9c=1491739410; CNZZDATA1759807=cnzz_eid%3D927885042-1491731124-%26ntime%3D1491736524; cn_1759807_dplus=%7B%22distinct_id%22%3A%20%2215b5265764f90-0922ade3f-3b664008-100200-15b52657650ba%22%2C%22%24_sessionid%22%3A%200%2C%22%24_sessionTime%22%3A%201491739419%2C%22%24dp%22%3A%200%2C%22%24_sessionPVTime%22%3A%201491739419%7D; UM_distinctid=15b5265764f90-0922ade3f-3b664008-100200-15b52657650ba";
            return req;
        }
        private void setHeader(HttpWebRequest req)
        {
           
            if(headerDic.ContainsKey("accept")){
                req.Accept = headerDic["accept"];
            }
            if (headerDic.ContainsKey("connection"))
            {
                req.Connection = headerDic["connection"];
            }
            if (headerDic.ContainsKey("content-length"))
            {
                req.ContentLength = Convert.ToInt64(headerDic["content-length"]);
            }
            if (headerDic.ContainsKey("content-type"))
            {
                req.ContentType = headerDic["content-type"];
            }
            if (headerDic.ContainsKey("date"))
            {
                req.Date =Utils.GetDateTime( headerDic["date"]);
            }
            if (headerDic.ContainsKey("host"))
            {
                req.Host = headerDic["host"];
            }
            if (headerDic.ContainsKey("if-modified-since"))
            {
                req.IfModifiedSince = Utils.GetDateTime( headerDic["if-modified-since"]);
            }
            if (headerDic.ContainsKey("range"))
            {
                req.AddRange(Utils.GetInt( headerDic["range"]));
            }
            if (headerDic.ContainsKey("referer"))
            {
                req.Referer = headerDic["referer"];
            }
            if (headerDic.ContainsKey("transfer-encoding"))
            {
                req.TransferEncoding = headerDic["transfer-encoding"];
            }
            if (headerDic.ContainsKey("user-agent"))
            {
                req.UserAgent = headerDic["user-agent"];
            }
  
    
    
    
  
        }

        /// <summary>
        /// 把响应流转换为文本。
        /// </summary>
        /// <param name="rsp">响应流对象</param>
        /// <param name="encoding">编码方式</param>
        /// <returns>响应文本</returns>
        public string GetResponseAsString(HttpWebResponse rsp, Encoding encoding)
        {
            System.IO.Stream stream = null;
            StreamReader reader = null;

            try
            {
                
                headerStr.AppendLine("ResponseUri: " + rsp.ResponseUri);
                headerStr.AppendLine("StatusCode: " + rsp.StatusCode);
                headerStr.Append(rsp.Headers.ToString());
                // 以字符流的方式读取HTTP响应
                stream = rsp.GetResponseStream();
                reader = new StreamReader(stream, encoding);
                return reader.ReadToEnd();
            }
            finally
            {
                // 释放资源
                if (reader != null) reader.Close();
                if (stream != null) stream.Close();
                if (rsp != null) rsp.Close();
            }
        }

        /// <summary>
        /// 组装GET请求URL。
        /// </summary>
        /// <param name="url">请求地址</param>
        /// <param name="parameters">请求参数</param>
        /// <returns>带参数的GET请求URL</returns>
        public string BuildGetUrl(string url, IDictionary<string, string> parameters)
        {
            //接口请求地址处理
            url = url.TrimEnd('/');
            url = url + "/" + parameters["method"];
            
            //参数拼接
            if (parameters != null && parameters.Count > 0)
            {
                if (url.Contains("?"))
                {
                    url = url + "&" + BuildQuery(parameters);
                }
                else
                {
                    url = url + "?" + BuildQuery(parameters);
                }
            }


            return url;
        }

        /// <summary>
        /// 组装普通文本请求参数。
        /// </summary>
        /// <param name="parameters">Key-Value形式请求参数字典</param>
        /// <returns>URL编码后的请求数据</returns>
        public static string BuildQuery(IDictionary<string, string> parameters)
        {
            StringBuilder postData = new StringBuilder();
            bool hasParam = false;

            IEnumerator<KeyValuePair<string, string>> dem = parameters.GetEnumerator();
            while (dem.MoveNext())
            {
                string name = dem.Current.Key;
                string value = dem.Current.Value;
                // 忽略参数名或参数值为空的参数
                if (!string.IsNullOrEmpty(name) && !string.IsNullOrEmpty(value))
                {
                    if (hasParam)
                    {
                        postData.Append("&");
                    }

                    postData.Append(name);
                    postData.Append("=");
                    postData.Append(HttpUtility.UrlEncode(value, Encoding.UTF8));
                    hasParam = true;
                }
            }

            return postData.ToString();
        }
    }
}
