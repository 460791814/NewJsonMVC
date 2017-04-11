﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Json_ZH.aspx.cs" Inherits="NewJson.Docs.Json.Json_ZH" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<title>JSON</title>
<style>
body {
    background-color: linen;
    padding-left: 5%;
    padding-right: 5%;
}
ul ul {
    list-style: disc;
}
hr {
    background-color: black;
    border: 0px;
    color: black;
    height: 2px;
    padding: 0px;
}
a {
    text-decoration: none;
}
a:link {
    color: navy;
}
a:visited {
    color: maroon;
}
a:hover {
    color: blue;
    text-decoration: underline;
}
a:active {
    color: red;
}
tt {
    font-family: monospace;
    font-weight: bold;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">

<table border="0" width="100%">
  <tbody><tr>
    <td align="center" valign="middle" width="160"><img src="picture/docs/json160.gif"
        alt="json logo" align="left" border="0" height="160" width="160"></td>
    <td align="center" valign="middle">
      <div style="border: 2px solid black; padding: 10px; background-color: white; margin-left: 40px; margin-right: 40px; font-family: serif;">
        <h1 align="center">介绍 JSON</h1>
      </div>
    </td>
  </tr>
</tbody></table>
<hr>
<div align="center"><small>
<a href="json-ar.html">العربية</a>
<a href="json-bg.html">Български</a>
<a href="json-zh.html">中文</a>
<a href="json-cz.html">Český</a>
<a href="json-da.html">Dansk</a>
<a href="json-nl.html">Nederlands</a>
<a href="index.html">English</a>
<a href="json-eo.html">Esperanto</a>
<a href="json-fr.html">Français</a>
<a href="json-de.html">Deutsch</a>
<a href="json-el.html">Ελληνικά</a>
<a href="json-he.html">עברית</a>
<a href="json-hu.html">Magyar</a>
<a href="json-id.html">Indonesia</a>
<br>
<a href="json-it.html">Italiano</a>
<a href="json-ja.html">日本</a>
<a href="json-ko.html">한국어</a>
<a href="json-fa.html">فارسی</a>
<a href="json-pl.html">Polski</a>
<a href="json-pt.html">Português</a>
<a href="json-ro.html">Română</a>
<a href="json-ru.html">Русский</a>
<a href="json-sr.html">Српско-хрватски</a>
<a href="json-sl.html">Slovenščina</a>
<a href="json-es.html">Español</a>
<a href="json-sv.html">Svenska</a>
<a href="json-tr.html">Türkçe</a>
<a href="json-vi.html">Tiếng Việt</a>
</small></div>
<hr>
<div align="center"><a href="http://www.ecma-international.org/publications/files/ECMA-ST/ECMA-404.pdf">ECMA-404 The JSON Data Interchange Standard</a>.</div>
<hr>
<div style="float: right; border: 2px solid black; margin: 10px; padding: 10px; background-color: white;">
  <dl>
    <dt><i>object</i></dt>
    <dd><tt>{}</tt><br>
      <tt>{</tt> <i>members</i> <tt>}</tt> </dd>
    <dt><i>members</i></dt>
    <dd><i>pair</i><br>
        <i>pair</i> <tt>,</tt> <i>members</i></dd>
    <dt><i>pair</i></dt>
    <dd><i>string</i> <tt>:</tt> <i>value</i></dd>
    <dt><i>array</i></dt>
    <dd><tt>[]</tt><br>
      <tt>[</tt> <i>elements</i> <tt>]</tt></dd>
    <dt><i>elements</i></dt>
    <dd><i>value</i> <br>
        <i>value</i> <tt>,</tt> <i>elements</i></dd>
    <dt><i>value</i></dt>
    <dd><i>string</i><br>
      <i>number</i><br>
      <i>object</i><br>
      <i>array</i><br>
      <tt>true</tt><br>
      <tt>false</tt><br>
      <tt>null</tt></dd>
  </dl>
  <hr align=center width=144>
  <dl>
    <dt><i>string</i></dt>
    <dd><tt>""</tt><br>
      <tt>"</tt> <i>chars</i> <tt>"</tt></dd>
    <dt><i>chars</i></dt>
    <dd><i>char</i><br>
      <i>char chars</i></dd>
    <dt><i>char</i></dt>
    <dd><small><i>any-Unicode-character-</i></small><br>
        <small>&nbsp;&nbsp;&nbsp;&nbsp;<i>except-</i></small><b><tt>"</tt></b><small><i>-or-</i></small><b><tt>\</tt></b><small><i>-or-</i></small><br>
        <small>&nbsp;&nbsp;&nbsp;&nbsp;<i>control-character</i></small><br>
      <tt>\"</tt><br>
      <tt>\\</tt><br>
      <tt>\/</tt><br>
      <tt>\b</tt><br>
      <tt>\f</tt><br>
      <tt>\n</tt><br>
      <tt>\r</tt><br>
      <tt>\t</tt><br>
    <tt>\u</tt> <i>four-hex-digits</i> </dd>
    <dt><i>number</i></dt>
    <dd><i>int</i><br>
        <i>int frac</i><br>
        <i>int exp</i><br>
        <i>int frac exp</i>
    </dd>
    <dt><i>int</i></dt>
    <dd><i>digit</i><br>
      <i>digit1-9 digits</i>
    <br><tt>-</tt> <i>digit</i><br>
      <tt>-</tt> <i>digit1-9 digits</i>
    </dd>
    <dt><i>frac</i></dt>
    <dd><b><tt>.</tt></b> <i>digits</i></dd>
    <dt><i>exp</i></dt>
    <dd><i>e</i> <i>digits</i></dd>
    <dt><i>digits</i></dt>
    <dd><i>digit</i><br>
        <i>digit</i> <i>digits</i></dd>
    <dt><i>e</i></dt>
    <dd><b><tt>e</tt></b><br>
<b><tt>e+</tt></b><br>
<b><tt>e-</tt></b><br>
<b><tt>E</tt></b><br>
<b><tt>E+</tt></b><br>
<b><tt>E-</tt></b></dd>
  </dl>
</div>

<p><b>JSON</b>(JavaScript Object Notation) 是一种轻量级的数据交换格式。
易于人阅读和编写。同时也易于机器解析和生成。
它基于<a href="http://www.crockford.com/javascript">JavaScript Programming Language</a>, 
<a href="http://www.ecma-international.org/publications/files/ecma-st/ECMA-262.pdf">Standard 
ECMA-262 3rd Edition - December 1999</a>的一个子集。
JSON采用完全独立于语言的文本格式，但是也使用了类似于C语言家族的习惯（包括C, C++, C#, Java, JavaScript, Perl, Python等）。
这些特性使JSON成为理想的数据交换语言。</p>
<p>JSON建构于两种结构：<br /></p>
<ul>
    <li>&ldquo;名称/值&rdquo;对的集合（A collection of name/value pairs）。不同的语言中，它被理解为<em>对象（object）</em>，纪录（record），结构（struct），字典（dictionary），哈希表（hash table），有键列表（keyed list），或者关联数组 （associative array）。 </li>
    <li>值的有序列表（An ordered list of values）。在大部分语言中，它被理解为数组（array）。 </li>
</ul>
<p>这些都是常见的数据结构。事实上大部分现代计算机语言都以某种形式支持它们。这使得一种数据格式在同样基于这些结构的编程语言之间交换成为可能。</p>
<p>JSON具有以下这些形式：</p>
<p>对象是一个无序的&ldquo;&lsquo;名称/值&rsquo;对&rdquo;集合。一个对象以&ldquo;{&rdquo;（左括号）开始，&ldquo;}&rdquo;（右括号）结束。每个&ldquo;名称&rdquo;后跟一个&ldquo;:&rdquo;（冒号）；&ldquo;&lsquo;名称/值&rsquo; 对&rdquo;之间使用&ldquo;,&rdquo;（逗号）分隔。 </p>
<p><img src="picture/docs/object.gif" width="598" height="113"></p>
    
<p>数组是值（value）的有序集合。一个数组以&ldquo;[&rdquo;（左中括号）开始，&ldquo;]&rdquo;（右中括号）结束。值之间使用&ldquo;,&rdquo;（逗号）分隔。 </p>
<p><img src="picture/docs/array.gif" width="598" height="113"></p>

<p>值（<em>value</em>）可以是双引号括起来的字符串（<em>string</em>）、数值(number)、<code>true</code>、<code>false</code>、 <code>null</code>、对象（object）或者数组（array）。这些结构可以嵌套。 </p>
<p><img src="picture/docs/value.gif" width="598" height="278"></p>

<p>字符串（<em>string</em>）是由双引号包围的任意数量Unicode字符的集合，使用反斜线转义。一个字符（character）即一个单独的字符串（character string）。 </p>
<p>字符串（<em>string</em>）与C或者Java的字符串非常相似。
<p><img src="picture/docs/string.gif" width="598" height="413"></p>

<p>数值（<em>number</em>）也与C或者Java的数值非常相似。除去未曾使用的八进制与十六进制格式。除去一些编码细节。</p>
<p><img src="picture/docs/number.gif" height="266" width="598"></p>

<p>空白可以加入到任何符号之间。 以下描述了完整的语言。</p>


<hr>
<div style="float: left">
  <ul>
    <li>ABAP:<ul>
        <li><a href="http://www.epoconsulting.com/index.php/en/solution/sap-integration">EPO Connector</a>.</li>
    </ul></li>
    <li>ActionScript:<ul>
        <li><a href="http://github.com/mikechambers/as3corelib">ActionScript3</a>.</li>
        <li><a href="http://www.adobe.com/cfusion/exchange/index.cfm?event=extensionDetail&extid=1078469">JSONConnector</a>.</li>
    </ul></li>
    <li>Ada:<ul>
        <li><a href="http://docs.adacore.com/gnatcoll-docs/json.html">GNATCOLL.JSON</a>.</li>
    </ul></li>
    <li>AdvPL:<ul>
        <li><a href="https://github.com/imsys/JSON-ADVPL">JSON-ADVPL</a>.</li>
    </ul></li>
    <li>ASP:<ul>
        <li><a href="https://github.com/tugrul/aspjson">JSON for ASP</a>.</li>
        <li><a href="http://www.webdevbros.net/2007/04/26/generate-json-from-asp-datatypes/">JSON ASP utility class</a>.</li>
      </ul>
    </li>
    <li>AWK:<ul>
        <li><a href="https://github.com/step-/JSON.awk">JSON.awk</a>.</li>
        <li><a href="https://github.com/Andy753421/rhawk/blob/master/json.awk">rhawk</a>.</li>
    </ul></li>
    <li>Bash:<ul>
        <li><a href="http://kmkeen.com/jshon/">Jshon</a>.</li>
        <li><a href="https://github.com/dominictarr/JSON.sh">JSON.sh</a>.</li>
    </ul></li>
    <li>BlitzMax:<ul>
        <li><a href="https://github.com/Trylobot/bmx-rjson">bmx-rjson</a>.</li>
    </ul></li>
    <li>C:<ul>
        <li><a href="http://www.JSON.org/JSON_checker/">JSON_checker</a>.</li>
        <li><a href="http://lloyd.github.com/yajl/">YAJL</a>.</li>
        <li><a href="http://github.com/quartzjer/js0n/blob/master/js0n.c">js0n</a>.</li>
        <li><a href="http://github.com/koanlogic/libu/blob/master/srcs/toolbox/json.c">LibU</a>.</li>
        <li><a href="https://github.com/jehiah/json-c">json-c</a>.</li>
        <li><a href="https://github.com/udp/json-parser">json-parser</a>.</li>
        <li><a href="https://github.com/mnunberg/jsonsl">jsonsl</a>.</li>
        <li><a href="https://github.com/netmail-open/wjelement">WJElement</a>.</li>
        <li><a href="http://sourceforge.net/projects/mjson/">M's JSON parser</a>.</li>
        <li><a href="https://sourceforge.net/projects/cjson/">cJSON</a>.</li>
        <li><a href="http://www.digip.org/jansson/">Jansson</a>.</li>
        <li><a href="https://bitbucket.org/zserge/jsmn/wiki/Home">jsmn</a>.</li>
        <li><a href="http://fossil.wanderinghorse.net/wikis/cson/?page=cson">cson</a>.</li>
        <li><a href="http://kgabis.github.com/parson/">parson</a>.</li>
        <li><a href="https://github.com/esnme/ujson4c/">ujson4c</a>.</li>
        <li><a href="https://bitbucket.org/yarosla/nxjson/src">nxjson</a>.</li>
        <li><a href="https://github.com/cesanta/frozen">frozen</a>.</li>
        <li><a href="http://www.catb.org/esr/microjson/">microjson</a>.</li>
      </ul>
    </li>
    <li>C++:<ul>
        <li><a href="https://github.com/johnezang/JSONKit">JSONKit</a>.</li>
        <li><a href="https://github.com/pibara/jsonme--">jsonme--</a>.</li>
        <li><a href="https://github.com/Loki-Astari/ThorsSerializer">ThorsSerializer</a>.</li>
        <li><a href="https://github.com/anhero/JsonBox">JsonBox</a>.</li>
        <li><a href="https://github.com/YasserAsmi/jvar">jvar</a>.</li>
        <li><a href="https://github.com/miloyip/rapidjson">rapidjson</a>.</li>
        <li><a href="http://danielaparker.github.io/jsoncons/">jsoncons</a>.</li>
        <li> <a href="https://github.com/nlohmann/json">json</a>.</li>
        <li> <a href="http://doc.qt.io/qt-5/json.html">JSON Support in Qt</a>.</li>
        <li><a href="http://qjson.sourceforge.net/">QJson</a>.</li>
        <li> <a href="https://github.com/QtMark/qmjson">qmjson</a>.</li>
        <li><a href="http://sourceforge.net/projects/jsoncpp/">jsoncpp</a>.</li>
        <li><a href="http://www.zoolib.org/doc/">zoolib</a>.</li>
        <li><a href="http://ddsbench.svn.sourceforge.net/viewvc/ddsbench/trunk/jost/">JOST</a>.</li>
        <li><a href="http://cajun-jsonapi.sourceforge.net/">CAJUN</a>.</li>
        <li><a href="http://sourceforge.net/projects/libjson/">libjson</a>.</li>
        <li><a href="http://fossil.wanderinghorse.net/repos/nosjob/index.cgi/index">nosjob</a>.</li>
        <li><a href="https://bitbucket.org/tunnuz/json">JSON++</a>.</li>
        <li><a href="http://sourceforge.net/projects/supereasyjson/">SuperEasyJSON</a>.</li>
        <li><a href="https://casablanca.codeplex.com/">Casablanca</a>.</li>
        <li><a href="https://realtimelogic.com/products/json/">JSON library for IoT</a>.</li>
        <li><a href="https://giacomodrago.github.io/minijson/">minijson</a>.</li>
      </ul>
    </li>
    <li>C#:<ul>
        <li><a href="http://www.codeproject.com/KB/IP/fastJSON.aspx">fastJSON</a>.</li>
        <li><a href="http://www.raboof.com/projects/jsonchecker/">JSON_checker</a>.</li>
        <li><a href="https://bitbucket.org/raboof/jayrock/wiki/Home">Jayrock</a>.</li>
        <li> <a href="http://james.newtonking.com/projects/json-net.aspx">Json.NET - LINQ to JSON</a>.</li>
        <li> <a href="http://lbv.github.io/litjson/">LitJSON</a>.</li>
        <li> <a href="http://sourceforge.net/projects/csjson">JSON for .NET</a>.</li>
        <li> <a href="http://jsonfx.net/download/">JsonFx</a>.</li>
        <li> <a href="http://codetitans.codeplex.com/">JSON@CodeTitans</a>.</li>
        <li> <a href="http://techblog.procurios.nl/k/618/news/view/14605/14863/How-do-I-write-my-own-parser-for-JSON.html">How do I write my own parser?</a>.</li>
        <li> <a href="http://code.google.com/p/jsonsharp/">JSONSharp</a>.</li>
        <li> <a href="http://code.google.com/p/jsonexserializer/">JsonExSerializer</a>.</li>
        <li> <a href="http://code.google.com/p/fluent-json/">fluent-json</a>.</li>
        <li> <a href="http://sourceforge.net/projects/manateejson/">Manatee Json</a>.</li>
        <li> <a href="https://github.com/ysharplanguage/FastJsonParser">FastJsonParser</a>.</li>
      </ul>
    </li>
    <li>Ciao:
      <ul>
        <li><a href="http://ciaohome.org/docs/ciao/json.html">Ciao JSON encoder and decoder</a>.</li>
      </ul>
    </li>
    <li>Clojure:
      <ul>
        <li><a href="http://clojure.github.com/data.json/">data.json</a>. </li>
      </ul>
    </li>
    <li>Cobol:
      <ul>
        <li><a href="http://www.xmlthunder.com/">XML Thunder</a>.</li>
      </ul>
    </li>
  </ul>
</div>
<div style="float: left;">
  <ul>
    <li>ColdFusion:
      <ul>
        <li><a href="http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-79fa.html">SerializeJSON</a>. </li>
        <li><a href="http://tojson.riaforge.org/">toJSON</a>.</li>
      </ul>
    </li>
    <li>D:
     <ul>
      <li><a href="http://www.dsource.org/projects/cashew/wiki/WikiStart">Cashew</a>.</li>
      <li><a href="https://256.makerslocal.org/wiki/index.php/Libdjson">Libdjson</a>.</li>
     </ul>
   </li>
   <li>Dart:
      <ul>
        <li><a href="http://api.dartlang.org/json.html">json library</a>.</li>
      </ul>
    </li>
    <li>Delphi:
      <ul>
        <li><a href="https://sourceforge.net/projects/is-webstart/">Delphi Web Utils</a>.</li>
        <li><a href="http://sourceforge.net/projects/lkjson">JSON Delphi Library</a>.</li>
        <li><a href="http://code.google.com/p/tiny-json/">tiny-json</a>.</li>
      </ul>
    </li>
    <li>E:<ul><li><a href="http://erights.org/data/terml/embeddings.html">JSON in TermL</a>.</li></ul></li>
    <li>Erlang:<ul>
        <li><a href="http://code.google.com/p/mochiweb/source/browse/trunk/src/mochijson2.erl">mochijson2</a>.</li>
    </ul></li>
    <li>Fantom:<ul><li><a href="http://fantom.org/doc/docLib/Json.html">Json</a>.</li></ul></li>
    <li>FileMaker:<ul><li><a href="http://www.modularfilemaker.org/module/json/">JSON</a>.</li></ul></li>
    <li>Fortran:<ul>
        <li><a href="https://github.com/jacobwilliams/json-fortran">json-fortran</a>.</li>
        <li><a href="http://sourceforge.net/projects/yajl-fort/">YAJL-Fort</a>.</li>
    </ul></li>
    <li>Go:<ul><li><a href="http://golang.org/pkg/encoding/json/">package json</a>.</li></ul></li>
    <li>Groovy:
      <ul>
        <li><a href="https://github.com/jdereg/groovy-io">groovy-io</a>.</li>
      </ul>
    </li>
    <li>Haskell:
      <ul>
        <li><a href="http://hackage.haskell.org/cgi-bin/hackage-scripts/package/RJson">RJson package</a>.</li>
        <li><a href="http://hackage.haskell.org/cgi-bin/hackage-scripts/package/json">json package</a>.</li>
      </ul>
    </li>
    <li>Java:
      <ul>
        <li><a href="https://github.com/stleary/JSON-java">JSON-java</a>.</li>
        <li><a href="https://github.com/billdavidson/JSONUtil">JSONUtil</a>.</li>
        <li><a href="http://jackson.codehaus.org/">Jackson JSON Processor</a>.</li>
        <li><a href="https://java.net/projects/jsonp/">jsonp</a>.</li>
        <li><a href="http://json-lib.sourceforge.net/">Json-lib</a>.</li>
        <li><a href="http://developer.berlios.de/projects/jsontools/">JSON Tools</a>.</li>
        <li><a href="http://www.stringtree.org/stringtree-json.html">Stringtree</a>.</li>
        <li><a href="http://sojo.sourceforge.net/">SOJO</a>.</li>
        <li><a href="http://jettison.codehaus.org/">Jettison</a>.</li>
        <li><a href="http://json-taglib.sourceforge.net/">json-taglib</a>.</li>
        <li><a href="http://xstream.codehaus.org/">XStream</a>.</li>
        <li><a href="http://flexjson.sourceforge.net/">Flexjson</a>.</li>
        <li><a href="http://sourceforge.net/projects/jontools/">JON tools</a>.</li>
        <li><a href="http://argo.sourceforge.net/">Argo</a>.</li>
        <li><a href="https://bitbucket.org/jmarsden/jsonij">jsonij</a>.</li>
        <li><a href="http://sourceforge.net/projects/fastjson/">fastjson</a>.</li>
        <li><a href="http://bolerio.github.io/mjson/">mjson</a>.</li>
        <li><a href="https://github.com/grobmeier/jjson">jjson</a>.</li>
        <li><a href="http://code.google.com/p/json-simple/">json-simple</a>.</li>
        <li><a href="https://github.com/jdereg/json-io">json-io</a>.</li>
        <li><a href="http://code.google.com/p/jsonmarshaller/">JsonMarshaller</a>.</li>
        <li><a href="http://code.google.com/p/google-gson/">google-gson</a>.</li>
        <li><a href="http://code.google.com/p/json-smart/">Json-smart</a>.</li>
        <li><a href="https://github.com/fossnova/json">FOSS Nova JSON</a>.</li>
        <li><a href="https://sites.google.com/site/javacornproject/corn-converter">Corn CONVERTER</a>.</li>
        <li><a href="http://johnzon.incubator.apache.org/">Apache johnzon</a>.</li>
      </ul>
    </li>
    <li>
      JavaScript:
      <ul>
        <li><a href="http://www.ecma-international.org/publications/standards/Ecma-262.htm">JSON</a>.</li>
        <li><a href="https://github.com/douglascrockford/JSON-js">json2.js</a>.</li>
        <li><a href="https://github.com/dscape/clarinet">clarinet</a>.</li>
        <li><a href="http://oboejs.com/">Oboe.js</a>.</li>
      </ul>
    </li>
    <li>LabVIEW:<ul>
      <li><a href="https://decibel.ni.com/content/groups/interactive-internet-interface-json-toolkit-for-labview">i3-JSON</a>.</li>
      <li><a href="http://lavag.org/files/file/216-json-labview/">LAVA JSON</a>.</li>
    </ul></li>
    <li>Lisp:<ul>
        <li><a href="http://common-lisp.net/project/cl-json/">Common Lisp JSON</a>.
        <li><a href="http://common-lisp.net/project/yason/">Yason</a>.</li>
        <li><a href="http://edward.oconnor.cx/elisp/json.el">Emacs Lisp</a>.</li>
      </ul>
    </li>
    <li>LiveCode:<ul>
        <li><a href="https://github.com/montegoulding/mergJSON">mergJSON</a>.</li>
      </ul>
    </li>
    <li>LotusScript:<ul>
        <li><a href="http://www.openntf.org/Projects/pmt.nsf/ProjectHome?ReadForm&Query=JSON%20LS">JSON LS</a>.</li>
      </ul>
    </li>
    <li>LPC:<ul>
      <li><a href="http://lostsouls.org/grimoire_json">Grimoire: LPC JSON</a>.</li>
    </ul></li>
    <li>Lua:<ul>
        <li><a href="http://lua-users.org/wiki/JsonModules">JSON Modules</a>.</li>
      </ul>
    </li>
    <li>M:<ul>
      <li><a href="https://github.com/lparenteau/DataBallet/blob/master/r/json.m">DataBallet</a>.</li>
    </ul></li>
    <li>Matlab:
      <ul>
      <li><a href="http://iso2mesh.sourceforge.net/cgi-bin/index.cgi?jsonlab">JSONlab</a>.</li>
      <li><a href="http://www.mathworks.com/matlabcentral/fileexchange/20565">20565</a>.</li>
      <li><a href="http://www.mathworks.com/matlabcentral/fileexchange/23393">23393</a>.</li>
      </ul>
    </li>
  </ul>
</div>
<div style="float: left">
  <ul>
    <li>Net.Data:<ul>
      <li><a href="https://github.com/blackchair/netdata-json">netdata-json</a>.</li>
    </ul></li>
    <li>Objective C:
      <ul>
      <li><a href="https://developer.apple.com/library/ios/documentation/foundation/reference/nsjsonserialization_class/Reference/Reference.html">NSJSONSerialization</a>.</li>
      <li><a href="https://github.com/stig/json-framework/">json-framework</a>.</li>
      <li><a href="https://github.com/johnezang/JSONKit">JSONKit</a>.</li>
      <li><a href="https://github.com/gabriel/yajl-objc">yajl-objc</a>.</li>
      <li><a href="https://github.com/TouchCode/TouchJSON">TouchJSON</a>.</li>
      <li><a href="https://webkeks.org/objfw/docs/latest/protocol_o_f_j_s_o_n_representation-p.html">ObjFW</a>.</li>
      </ul>
    </li>
    <li>OCaml:
      <ul>
        <li><a href="http://martin.jambon.free.fr/yojson.html">Yojson</a>.</li>
        <li><a href="http://erratique.ch/software/jsonm">jsonm</a>.</li>
      </ul>
    </li>
    <li>OpenLaszlo:
      <ul>
        <li><a href="http://osteele.com/sources/openlaszlo/json/">JSON</a>.</li>
      </ul>
    </li>
    <li>PascalScript:
      <ul>
        <li><a href="https://github.com/koldev/JsonParser">JsonParser</a>.</li>
      </ul>
    </li>
    <li>Perl:<ul>
        <li><a href="http://search.cpan.org/search?query=JSON">CPAN</a>.</li>
        <li><a href="https://github.com/mnunberg/perl-JSON-SL">perl-JSON-SL</a>.</li>
    </ul></li>
    <li>Photoshop:<ul><li><a href="http://www.tonton-pixel.com/blog/json-photoshop-scripting/">JSON Photoshop Scripting</a>.</li></ul></li>
    <li>PHP:<ul>
      <li><a href="http://www.php.net/releases/5_2_0.php">PHP 5.2</a>.</li>
      <li><a href="http://pecl.php.net/package/json">json</a>.</li>
      <li><a href="http://pear.php.net/pepr/pepr-proposal-show.php?id=198">Services_JSON</a>.</li>
      <li><a href="http://framework.zend.com/manual/en/zend.json.html">Zend_JSON</a>.</li>
      <li><a href="http://gggeek.altervista.org/sw/article_20061113.html">Comparison of php json libraries</a>.</li>
    </ul></li>
    <li>PicoLisp:<ul>
      <li><a href="https://github.com/aw/picolisp-json">picolisp-json</a>.</li>
    </ul></li>
    <li>Pike:<ul>
      <li><a href="http://modules.gotpike.org/module_info.html?module_id=33">Public.Parser.JSON</a>.</li>
      <li><a href="http://modules.gotpike.org/module_info.html?select=0.2&module_id=43">Public.Parser.JSON2</a>.</li>
    </ul></li>
    <li>PL/SQL</a>:<ul>
    <li><a href="http://sourceforge.net/projects/pljson">pljson</a>:
    <li><a href="http://reseau.erasme.org/Librairie-JSON">Librairie-JSON</a>.</li></ul>
    </li>
    <li>PowerShell:<ul><li><a href="http://www.codeplex.com/PowerShellJSON">PowerShell</a>.</li></ul></li>
    <li>Prolog:<ul>
        <li><a href="http://www.swi-prolog.org/">SWI-Prolog HTTP support</a>.</li>
      </ul>
    </li>
     <li>Puredata:<ul>
        <li><a href="https://github.com/residuum/PuRestJson">PuRestJson</a>.</li>
      </ul>
    </li>
    <li>Python:<ul>
        <li><a href="http://docs.python.org/library/json.html">The Python Standard Library</a>.</li>
        <li><a href="http://pypi.python.org/pypi/simplejson/">simplejson</a>.</li>
        <li><a href="http://jyson.xhaus.com/">pyson</a>.</li>
        <li><a href="http://pykler.github.com/yajl-py/">Yajl-Py</a>.</li>
         <li><a href="https://github.com/esnme/ultrajson">ultrajson</a>.</li>
         <li><a href="http://pypi.python.org/pypi/metamagic.json/">metamagic.json</a>.</li>
      </ul>
    </li>
    <li>R:<ul>
      <li><a href="http://cran.r-project.org/web/packages/rjson/index.html">rjson</a>.</li>
      <li><a href="http://cran.r-project.org/web/packages/jsonlite/index.html">jsonlite</a>.</li>
    </ul></li>
    <li>Racket:<ul><li><a href="http://www.neilvandyke.org/racket-json-parsing/">json-parsing</a>.</li></ul></li>
    <li>Rebol:<ul><li><a href="http://www.rebol.org/view-script.r?script=json.r">json.r</a>.</li></ul></li>
    <li>RPG:<ul><li><a href="http://rpgnextgen.com/index.php?content=json">JSON Utilities</a>.</li></ul></li>
    <li>Ruby:<ul>
        <li><a href="http://json.rubyforge.org/">json</a>.</li>
        <li><a href="http://github.com/brianmario/yajl-ruby">yajl-ruby</a>.</li>
        <li><a href="https://github.com/dgraham/json-stream">json-stream</a>.</li>
        <li><a href="https://github.com/dgraham/yajl-ffi/tree/master/lib/yajl/ffi">yajl-ffi</a>.</li>
      </ul>
    </li>
    <li>Scala:<ul>
        <li><a href="http://www.scala-lang.org/api/current/index.html#scala.util.parsing.json.package">package json</a>.</li>
      </ul>
    </li>
    <li>Scheme:<ul>
        <li><a href="http://www.lshift.net/blog/2005/08/22/json-for-mzscheme-and-a-portable-packrat-parsing-combinator-library">MZScheme</a>.</li>
        <li><a href="http://planet.plt-scheme.org/display.ss?package=json.plt&owner=dherman">PLT Scheme</a>.</li>
      </ul>
    </li>
    <li>Squeak:<ul><li><a href="http://map1.squeakfoundation.org/sm/package/d38bdc2d-e52a-4167-ae73-2cf438c65c2f">Squeak</a>.</li></ul></li>
    <li>Symbian:<ul><li><a href="http://code.google.com/p/s60-json-library/">s60-json-library</a>.</li></ul></li>
    <li>Tcl:<ul><li><a href="http://wiki.tcl.tk/13419">JSON</a>.</li></ul></li>
    <li>Visual Basic:<ul>
      <li><a href="http://www.ediy.co.nz/vbjson-json-parser-library-in-vb6-xidc55680.html">VB-JSON</a>.</li>
      <li><a href="http://www.pozzware.com/pozzware/Corsi/Programmazione/VB.NET/JSON%20Library.aspx">PW.JSON</a>.</li>
     </ul>
    <li>Visual FoxPro:<ul>
      <li><a href="http://www.foxweb.com/document/index.htm?page=/document/fwJSONObject.htm">fwJSON</a>.</li>
      <li><a href="http://www.sweetpotatosoftware.com/SPSBlog/PermaLink,guid,5f96efd7-f350-4bc8-86c5-caffd9e833eb.aspx">JSON</a>.</li>
      <li><a href="https://github.com/sait/vfpjson">vfpjson</a>.</li>
    </ul></li>
  </ul>
</div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Right" runat="server">
</asp:Content>
