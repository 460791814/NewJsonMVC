String.prototype.format = function () {
    var args = arguments;
    return this.replace(/\{(\d+)\}/g,
				function (m, i) {
				    return args[i];
				});
}

String.prototype.trim = function () {
    return this.replace(/(^\s*)|(\s*$)/g, "");
}
json2model = {
    JSON2CSharp: {
        _allClass: [],
        _genClassCode: function (obj, name) {
            var clas = "public class {0}\r\n{\r\n".format(name || "Root");
            for (var n in obj) {
                var v = obj[n];
                n = n.trim();
                clas += "    {0}    public {1} {2} { get; set; }\r\n".format(this._genComment(v, n), this._genTypeByProp(n, v), n);
            }
            clas += "}\r\n";
            this._allClass.push(clas);
            return this._allClass.join("\r\n");
        },
        _genTypeByProp: function (name, val) {
            try {
                if (typeof val == "string") {
                    var regdt = /^(\d{4})(-|\/|年)(\d{2})(-|\/|月)(\d{2})(日)?(\s((\d{1,2}):)?((\d{1,2}):)?(\d{1,2})?)?$/
                    if (regdt.test(val.trim()))
                        val = new Date(val);
                }
            } catch (e) {

            }
            switch (Object.prototype.toString.apply(val)) {
                case "[object Number]":
                    {
                        return val.toString().indexOf(".") > -1 ? "double" : "int";
                    }
                case "[object Date]":
                    {
                        return "DateTime";
                    }
                case "[object Object]":
                    {
                        name = name.substring(0, 1).toUpperCase() + name.substring(1);
                        this._genClassCode(val, name);
                        return name;
                    }
                case "[object Array]":
                    {
                        return "List<{0}>".format(this._genTypeByProp(name, val[0]));
                    }
                case "[object Boolean]":
                    {
                        return "bool";
                    }
                default:
                    {
                        return "string";
                    }
            }
        },
        _genComment: function (val, n) {
            //var commm = typeof (val) == "string" && /.*[\u4e00-\u9fa5]+.*$/.test(val) ? val : "";
            var s = Object.prototype.toString.apply(val);
            var commm = typeof (val) == "string" ? val : n.substring(0, 1).toUpperCase() + n.substring(1);;
            return "/// <summary>\r\n    /// " + commm + "\r\n    /// </summary>\r\n";
        },
        convert: function (jsonObj) {
            this._allClass = [];
            return this._genClassCode(jsonObj);
        }
    },
    JSON2POJO: {
        _allClass: [],
        _genClassCode: function (obj, name) {
            var packageval = $("#packageval").val(), isfill = $("#isfill").prop("checked");
            var clas = "";
            var str = "";
            var privateAttr = "", publicAttr = "", fill = "", filllist = "";
            if (isfill) {
                fill += "    public static {0} fill(JSONObject jsonobj){\r\n".format(name || "Root");
                fill += "        {0} entity = new {0}();\r\n".format(name || "Root");

                filllist += "    public static List<{0}> fillList(JSONArray jsonarray) {\r\n";
                filllist += "        if (jsonarray == null || jsonarray.size() == 0)\r\n";
                filllist += "            return null;\r\n";
                filllist += "        List<{0}> olist = new ArrayList<{0}>();\r\n";
                filllist += "        for (int i = 0; i < jsonarray.size(); i++) {\r\n";
                filllist += "            olist.add(fill(jsonarray.getJSONObject(i)));\r\n";
                filllist += "        }\r\n";
                filllist += "        return olist;\r\n";
                filllist += "    }\r\n";
                filllist = filllist.format(name || "Root");
            }
            for (var n in obj) {
                var v = obj[n];
                n = n.trim();
                var tp = this._genTypeByProp(n, v);
                var _type = tp.type;
                if (tp.islist) {
                    if (isfill)
                        str = "package {1};\r\nimport java.util.ArrayList;\r\nimport java.util.List;\r\nimport net.sf.json.JSONObject;\r\nimport net.sf.json.JSONArray;\r\npublic class {0}\r\n{\r\n".format(name || "Root", packageval);
                    else
                        str = "package {1};\r\nimport java.util.ArrayList;\r\nimport java.util.List;\r\npublic class {0}\r\n{\r\n".format(name || "Root", packageval, "\r\nimport java.util.List;");
                }
                privateAttr += "    private {0} {1};\r\n\r\n".format(_type, n);
                var firstChar = n.substring(0, 1).toUpperCase() + n.substring(1);
                publicAttr += "    public void set{2}({0} {1}){\r\n        this.{1} = {1};\r\n    }\r\n".format(_type, n, firstChar);
                publicAttr += "    public {0} get{2}(){\r\n        return this.{1};\r\n    }\r\n".format(_type, n, firstChar);

                if (isfill) {
                    fill += "        if (jsonobj.containsKey(\"{0}\")) {\r\n".format(n);
                    var _typefirstChartoUpper = _type.substring(0, 1).toUpperCase() + _type.substring(1);
                    fill += "            entity.set{1}(jsonobj.get{2}(\"{0}\"));        \r\n        }\r\n".format(n, n.substring(0, 1).toUpperCase() + n.substring(1), _typefirstChartoUpper.indexOf("List") >= 0 ? "JSONArray" : _typefirstChartoUpper);
                }
            }
            clas += "==================================\r\n"
            if (!str) {
                if (isfill)
                    clas += "package {1};\r\nimport net.sf.json.JSONObject;\r\nimport net.sf.json.JSONArray;\r\npublic class {0}\r\n{\r\n".format(name || "Root", packageval);
                else
                    clas += "package {1};\r\npublic class {0}\r\n{\r\n".format(name || "Root", packageval);
            }
            else
                clas += str;
            if (isfill) {
                fill += "        return entity;\r\n    }\r\n";
            }
            clas += privateAttr;
            clas += publicAttr;
            clas += fill;
            clas += filllist;
            clas += "}\r\n";
            this._allClass.push(clas);
            return this._allClass.join("\r\n");
        },
        _genTypeByProp: function (name, val) {
            try {
                if (typeof val == "string") {
                    //xxxx(-|/|年)xx(-|/|月)xx(-|/|日) xx:xx:xx
                    var regdt = /^(\d{4})(-|\/|年)(\d{2})(-|\/|月)(\d{2})(日)?(\s((\d{1,2}):)?((\d{1,2}):)?(\d{1,2})?)?$/
                    if (regdt.test(val.trim()))
                        val = new Date(val);
                }
            } catch (e) {

            }
            switch (Object.prototype.toString.apply(val)) {
                case "[object Number]":
                    {
                        return { type: val.toString().indexOf(".") > -1 ? "double" : "int" };
                    }
                case "[object Date]":
                    {
                        return { type: "DateTime" };
                    }
                case "[object Object]":
                    {
                        name = name.substring(0, 1).toUpperCase() + name.substring(1);
                        this._genClassCode(val, name);
                        return { type: name };
                    }
                case "[object Array]":
                    {
                        return { type: "List<{0}>".format(this._genTypeByProp(name, val[0]).type), islist: true };
                    }
                case "[object Boolean]":
                    {
                        return { type: "boolean" };
                    }
                default:
                    {
                        return { type: "String" };
                    }
            }
        },
        convert: function (jsonObj) {
            this._allClass = [];
            return this._genClassCode(jsonObj);
        }
    }
}