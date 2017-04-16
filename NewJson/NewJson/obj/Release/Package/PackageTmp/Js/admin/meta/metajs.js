function create(form) {

    form.story.value = "";
    if (form.title.value != "") {
        form.story.value += "<META NAME=\"Title\" CONTENT=\"" +
 form.title.value + "\">\n";
    }
    if (form.author.value != "") {
        form.story.value += "<META NAME=\"Author\" CONTENT=\"" +
 form.author.value + "\">\n";
    }
    if (form.subject.value != "") {
        form.story.value += "<META NAME=\"Subject\" CONTENT=\"" +
 form.subject.value + "\">\n";
    }
    if (form.descript.value != "") {
        form.story.value += "<META NAME=\"Description\" CONTENT=\"" +
 form.descript.value + "\">\n";
    }
    if (form.keyword.value != "") {
        form.story.value += "<META NAME=\"Keywords\" CONTENT=\"" +
 form.keyword.value + "\">\n";
    }
    if (form.gen.value != "") {
        form.story.value += "<META NAME=\"Generator\" CONTENT=\"" +
 form.gen.value + "\">\n";
    }
    if (form.input7.value != "") {
        form.story.value += "<META NAME=\"Language\" CONTENT=\"" +
 form.input7.value + "\">\n";
    }
    if (form.input8.value != "") {
        form.story.value += "<META NAME=\"Expires\" CONTENT=\"" +
 form.input8.value + "\">\n";
    }
    if (form.input9.value != "") {
        form.story.value += "<META NAME=\"Abstract\" CONTENT=\"" +
 form.input9.value + "\">\n";
    }
    if (form.input10.value != "") {
        form.story.value += "<META NAME=\"Copyright\" CONTENT=\"?" +
 form.input10.value + "\">\n";
    }
    if (form.input11.value != "") {
        form.story.value += "<META NAME=\"Designer\" CONTENT=\"" +
 form.input11.value + "\">\n";
    }
    if (form.input12.value != "") {
        form.story.value += "<META NAME=\"Publisher\" CONTENT=\"" +
 form.input12.value + "\">\n";
    }
    if (form.input13.value != "") {
        form.story.value += "<META NAME=\"Revisit-After\" CONTENT=\"" +
 form.input13.value + " \Days\">\n";
    }
    if (form.input14.value != "") {
        form.story.value += "<META NAME=\"Distribution\" CONTENT=\"" +
 form.input14.options[form.input14.selectedIndex].value + "\">\n";
    }
    if (form.input15.value != "") {
        form.story.value += "<META NAME=\"Robots\" CONTENT=\"" +
 form.input15.options[form.input15.selectedIndex].value + "\">\n";
    }
}
//End -->
function Empty() {
    $("input").val("");
    document.getElementById("story").value = "";
    document.getElementById("title").select();
}