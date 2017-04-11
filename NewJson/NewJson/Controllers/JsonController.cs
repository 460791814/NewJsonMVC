using CommonTool;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Xamasoft.JsonClassGenerator;
using Xamasoft.JsonClassGenerator.CodeWriters;

namespace NewJson.Controllers
{
    public class JsonController : Controller
    {
        //
        // GET: /Json/
        public ActionResult JsonCheck()
        {
            switch (Request["method"])
            {
                case "url":
                    GetJson();
                    break;
                default:
                    break;
            }
            return View();
        }
        public ActionResult Excel2Json()
        {
            return View();
        }
        public ActionResult GetPostJson()
        {
            return View();
        }

        public ActionResult JsonCode()
        {
            return View();
        }
 
        public ActionResult JsonHandle()
        {
            return View();

        }

        public ActionResult JsonModel()
        {
            switch (Request["method"])
            {
                case "model":
                    CreateModel();
                    break;
                default:
                    break;
            }
            return View();
        }
        public ActionResult JsonView()
        {
            return View();
        }
        public ActionResult Xml2Json()
        {
            return View();
        }
        public ActionResult AboutJson() {
            return View();
        }
        public ActionResult Json2Model()
        {
            return View();
        }
        private void GetJson()
        {
            string url = Request["url"];
            string htmlcontent = new WebUtils().DoGet(url,null); 
            string result = JsonConvert.SerializeObject(new { content = htmlcontent });
            Response.Write(result);
            Response.End();
        }
        private void CreateModel()
        {
            var gen = Prepare();
            if (gen == null) return;
            try
            {
                gen.TargetFolder = null;
                gen.SingleFile = true;
                using (var sw = new StringWriter())
                {
                    gen.OutputStream = sw;
                    gen.GenerateClasses();
                    sw.Flush();
                    string lastGeneratedString = sw.ToString();
                    string result = JsonConvert.SerializeObject(new { content = lastGeneratedString });
                    Response.Write(result);
                    Response.End();
                }

            }
            catch (Exception ex)
            {
                //  MessageBox.Show(this, "Unable to generate the code: " + ex.Message, this.Text, MessageBoxButtons.OK, MessageBoxIcon.Error);
                //  string result = JsonConvert.SerializeObject(new { content = ex.Message });
                //   Response.Write(result);
                //  Response.End();
            }
        }
        private JsonClassGenerator Prepare()
        {
            string namespacestr = Request["namespacestr"];
            string mainclass = Request["mainclass"];
            int type = Utils.GetInt(Request["type"]);
            string jsonstr = Request["jsonstr"];

            int internalVis = Utils.GetInt(Request["xsf"]);
            int useField = Utils.GetInt(Request["pf"]);
            int usePascalCase = 1;// Utils.GetInt(Request["mm"]);
            var gen = new JsonClassGenerator();
            //json字符串
            gen.Example = jsonstr;
            //类修饰符 internal=true,public =false
            gen.InternalVisibility = internalVis == 0 ? false : true;
            //具体的处理类 c# vb.net typescript
            switch (type)
            {
                case 1:
                    gen.CodeWriter = new VisualBasicCodeWriter();
                    break;
                case 2:
                    gen.CodeWriter = new TypeScriptCodeWriter();
                    break;
                case 3:
                    //java
                    gen.CodeWriter = new JavaCodeWriter();
                    break;
                default:
                    gen.CodeWriter = new CSharpCodeWriter();
                    break;
            }


            //明确饭序列化
            gen.ExplicitDeserialization = false;
            //命名空间
            gen.Namespace = namespacestr;
            //ExplicitDeserialization=true才能使用
            gen.NoHelperClass = false;
            gen.SecondaryNamespace = null;
            gen.TargetFolder = null;
            //使用属性写法 false=字段写法
            gen.UseProperties = useField == 0 ? true : false;

            gen.MainClass = string.IsNullOrEmpty(mainclass) ? "Root" : mainclass;
            //首字母大写Code   false=骆驼式命名 首字母小写 后面首字母大写twoFeet
            gen.UsePascalCase = usePascalCase == 0 ? true : false;
            //使用嵌套类
            gen.UseNestedClasses = false;
            //使用模糊属性
            gen.ApplyObfuscationAttributes = false;
            gen.SingleFile = true;
            //生成文档范例
            gen.ExamplesInDocumentation = false;

            return gen;
        }
    }
}