function openMenuTab(id, elmnt, color) {
	var pageDiv = id + "_Div";

	var menuNavClass = elmnt.className;

	closeAllPageDivs();
	resetAllNavMenus(elmnt, color);

	var elementId = document.getElementById(pageDiv);
	elementId.style.display = "block";
}

function resetAllNavMenus(elmnt, activeColor) {
	var i, tablinks;
	var navMenuClass = elmnt.className;
	tablinks = document.getElementsByClassName(navMenuClass);
	for (i = 0; i < tablinks.length; i++) {
		tablinks[i].style.backgroundColor = "";
	}
	elmnt.style.backgroundColor = activeColor;
}

function checkBoxDivToggle(checkBox) {
	var cbId = checkBox.id;
	var divPageId = cbId + "_Div";
	//	  alert("checkBox = " + checkBox+ " checkBox Id = " + cbId+ " divPageId = " + divPageId);
	divElement = document.getElementById(divPageId);
	if (checkBox.checked == true) {
		//		  alert("SHOW " + divPageId)
		divElement.style.display = "block";
	} else {
		//		  alert("HIDE " + divPageId)
		divElement.style.display = "none";
	}
}

function checkBoxMenuToggle(checkBox) {
	var cbId = checkBox.id;
	var divTabId = cbId + "Tab";
	//	  alert("checkBox = " + checkBox+ " checkBox Id = " + cbId+ " divTabId = " + divTabId);
	divElement = document.getElementById(divTabId);
	if (checkBox.checked == true) {
		//		  alert("SHOW " + divTabId)
		divElement.style.display = "block";
	} else {
		//		  alert("HIDE " + divTabId)
		divElement.style.display = "none";
	}
}

//		  alert("HIDE " + divId)
function checkBoxDivClose(checkBox) {
	checkBox.checked = false;
	var cbId = checkBox.id;
	var divId = cbId + "_Div";
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
		obj = window.open(winObj.url, winObj.target, winObj.features);
		winObj.obj = obj;
	}
	else {
		alert("Page " + page + " winObj.url");
	}
}