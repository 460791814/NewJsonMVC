var  regextool={
 
    languageCode: {
            js: "var pattern = /{0}/,\n\tstr = '{1}';\nconsole.log(pattern.test(str));",
            php: "$str = '{1}';\n$isMatched = preg_match('/{0}/', $str, $matches);\nvar_dump($isMatched, $matches);",
            go: "package main\n\nimport (\n\t\"fmt\"\n\t\"regexp\"\n)\n\nfunc main() {\n\tstr := \"{1}\"\n\tmatched, err := regexp.MatchString(\"{0}\", str)\n\tfmt.Println(matched, err)\n}",
            rb: "pattern = /{0}/\nstr = '{1}'\np pattern.match(str)",
            py: "import re\npattern = re.compile(ur'{0}')\nstr = u'{1}'\nprint(pattern.search(str))",
            java: "import java.util.regex.Matcher;\nimport java.util.regex.Pattern;\n\npublic class RegexMatches {\n\t\n\tpublic static void main(String args[]) {\n\t\tString str = \"{1}\";\n\t\tString pattern = \"{0}\";\n\n\t\tPattern r = Pattern.compile(pattern);\n\t\tMatcher m = r.matcher(str);\n\t\tSystem.out.println(m.matches());\n\t}\n\n}",
            csharp: "Regex reg = new Regex(@\"{0}\");\n\tstring str = \"newjson.com\";\n\tConsole.WriteLine(reg.Match(str));"
    },
    initgenerate: function () {
        var _this = this;
 
        var pattern = $("#textPattern").val();
            if (!pattern) return;
            var textarealist = $("#languagelist textarea");
            for (var i = 0; i < textarealist.length; i++) {
                var textarea = $(textarealist[i]);
                var language = textarea.attr("id");
                if (language == 'go' || language == 'java') pattern.replace(/\\/gi, "\\");
                textarea.val(_this.languageCode[language].format(pattern, ""));
            }
            $("#languagelist").show();
      
            return false;

    }
}