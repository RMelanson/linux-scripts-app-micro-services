var activeMenuColor = 'red';

function setActiveMenuColor(color) {
	activeMenuColor = color;
}

function openMenuTab(id, elmnt, color) {
	setActiveMenuColor(color);
	var pageDiv = id + "_Div";

	var menuNavClass = elmnt.className;
	var menuPage = document.getElementById(pageDiv);
	var divClass = menuPage.className;

	closeAllPageDivs(divClass);
	resetAllNavMenus(elmnt);

	menuPage.style.display = "block";
}

function openPostScripDiv(id, elmnt, color) {
	openMenuTab("postman", elmnt, color);
	setPostScripTitle(id, elmnt, color);
}

function setPostScripTitle(id, elmnt, color) {
	var postTitle = document.getElementById("postTitle");
	var newTitle = "Cloud Initialiser ";
	switch(id) {
		case "html":
			newTitle += " HTTP ";
		  break;
		case "jBoss":
			newTitle += " jBoss ";
		  break;
		default:
			newTitle += " ** UNKNOWN ** ";
	  } 
	  newTitle += " Postman Installer";
	  //    alert("Before postTitle = "+postTitle.innerHTML);
	  postTitle.innerHTML = newTitle;
//    alert("After postTitle = "+postTitle.innerHTML);
}

function closeAllPageDivs(divClass) {
	var i, pgDiv;
	pgDiv = document.getElementsByClassName(divClass);

	for (i = 0; i < pgDiv.length; i++) {
		pgDiv[i].style.display = "none";
	}
}

function resetAllNavMenus(elmnt) {
	var i, tablinks;
	var navMenuClass = elmnt.className;
	tablinks = document.getElementsByClassName(navMenuClass);
	for (i = 0; i < tablinks.length; i++) {
		tablinks[i].style.backgroundColor = "";
	}
	elmnt.style.backgroundColor = activeMenuColor;
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