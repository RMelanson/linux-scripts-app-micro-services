function openMenuTab(id, elmnt, color) {
	var menuTab = id + "_Div";
//    alert ("openMenuTab");
	var i, pgDiv, tablinks;
	pgDiv = document.getElementsByClassName("page_Div");

 	for (i = 0; i < pgDiv.length; i++) {
// 		alert("Hiding page_Div id " + pgDiv[i].id)
 		pgDiv[i].style.display = "none";
	}
	
	tablinks = document.getElementsByClassName("topnav");
	for (i = 0; i < tablinks.length; i++) {
		tablinks[i].style.backgroundColor = "";
	}

	var elementId = document.getElementById(menuTab);
	elementId.style.display = "block";
	elmnt.style.backgroundColor = color;
}

function checkBoxDivToggle(checkBox) {
	var cbId = checkBox.id;
	var divPageId = cbId+"_Div";
//	  alert("checkBox = " + checkBox+ " checkBox Id = " + cbId+ " divPageId = " + divPageId);
	divElement = document.getElementById(divPageId);
	if (checkBox.checked == true){
//		  alert("SHOW " + divPageId)
		divElement.style.display = "block";
	} else {
//		  alert("HIDE " + divPageId)
		divElement.style.display = "none";
	}
}

function checkBoxMenuToggle(checkBox) {
	var cbId = checkBox.id;
	var divTabId = cbId+"Tab";
//	  alert("checkBox = " + checkBox+ " checkBox Id = " + cbId+ " divTabId = " + divTabId);
	divElement = document.getElementById(divTabId);
	if (checkBox.checked == true){
//		  alert("SHOW " + divTabId)
		divElement.style.display = "block";
	} else {
//		  alert("HIDE " + divTabId)
		divElement.style.display = "none";
	}
}

//		  alert("SHOW " + divId)
function checkBoxDivOpen(checkBox) {
	checkBox.checked = true;
	var cbId = checkBox.id;
	var divId = cbId+"_Div";
	divElement = document.getElementById(divId);
		divElement.style.display = "block";
}

//		  alert("HIDE " + divId)
function checkBoxDivClose(checkBox) {
	checkBox.checked = false;
	var cbId = checkBox.id;
	var divId = cbId+"_Div";
	divElement = document.getElementById(divId);
		divElement.style.display = "block";
}

function showVerticleNavMenu() {
 	var x = document.getElementById("myTopnav");
    if (x.className === "topnav") {
    	x.className += " responsive";
    } else {
    	x.className = "topnav";
    }
}

function checkOpenWindow(winObj) {
//	alert("window.obj = " + winObj.obj+ " window.url = " + winObj.url);
	if (winObj.obj == null) {
		obj = window.open(winObj.url, winObj.target,winObj.features);
		winObj.obj = obj;
	}
	else {
		alert("Page " + page + " winObj.url");
	}
}