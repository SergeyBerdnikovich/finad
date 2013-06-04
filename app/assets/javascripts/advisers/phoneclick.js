function hidespan(pass) {
var spans = document.getElementsByTagName('span');
for(i=0;i<spans.length;i++){
if(spans[i].id.match(pass)){//if they are 'see' spans
if (document.getElementById) // DOM3 = IE5, NS6
spans[i].style.display="none";// show/hide
else
if (document.layers) // Netscape 4
document.layers[spans[i]].display = 'none';
else // IE 4
document.all.hideshow.spans[i].display = 'none';
}
}
}

function showspan(pass, from) {
hidespan(from);
if (document.getElementById) { // DOM3 = IE5, NS6
document.getElementById(pass).style.display = 'inline';
}
else {
if (document.layers) { // Netscape 4
document.hideshow.display = 'inline';
}
else { // IE 4
document.all.hideshow.style.display = 'inline';
}
}
}
