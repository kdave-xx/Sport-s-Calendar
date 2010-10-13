// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function numbersonly(e){
var unicode=e.charCode? e.charCode : e.keyCode
if (unicode!=8){ //if the key isn't the backspace key (which we should allow)
if (unicode<48||unicode>57) //if not a number
return false
//alert("Sorry, Enter Only Numeric Values!");
//disable key press
}
}

 function PrintThisPage()
{
   var sOption="toolbar=yes,location=yes,directories=yes,menubar=yes,";
       sOption+="scrollbars=yes,width = 700 ,height=550,left=100,top=25";

   var sWinHTML = document.getElementById('ordercontainer123').innerHTML;
   var winprint = window.open("","",sOption);
       winprint.document.open();
       winprint.document.write('<html><head><LINK href=/stylesheets/blueprint/screen.css rel=Stylesheet></head><body><div class="prepend-top">');
       winprint.document.write(sWinHTML);
       winprint.document.write('</div></body></html>');
       winprint.document.close();
       winprint.focus();
}
