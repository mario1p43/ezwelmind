var filter = "win16|win32|win64|mac";

 
$(document).ready(function(){

	if(navigator.platform){

		if(0 > filter.indexOf(navigator.platform.toLowerCase())){
			$(".mobile").css("display","block");
			$(".web").css("display","none");

		}else{

			$(".mobile").css("display","none");
			$(".web").css("display","block");
		}

	}

});

 

document.onkeydown = function () {
    var backspace = 8;
    var t = document.activeElement;

    if (event.keyCode == backspace) {

    	if (t != null) {
	        if (t.tagName == "SELECT")
	            return false;

	        if ((t.tagName == "INPUT" || t.tagName == "TEXTAREA") && window.event.srcElement.readOnly) {
	        	return false;
	        }
    	}

    }
}

function strCut(value, exp, limit) {
	if (value.length <= limit) return value;
	return value.substring(0, limit) + exp;
}

function escapeXml(value) {
	return value.replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;');
}

function LPAD(s, c, n) {    
    if (! s || ! c || s.length >= n) {
        return s;
    }
    var max = (n - s.length)/c.length;
    for (var i = 0; i < max; i++) {
        s = c + s;
    }
    return s;
}

function replaceAll(value, before, after) {
	return value.split(before).join(after);
}

function onlyNumber(event){
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9 || keyID == 16) 
		return;
	else
		return false;
}

function removeChar(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9 || keyID == 16) 
		return;
	else
		event.target.value = event.target.value.replace(/[^0-9]/g, "");
}