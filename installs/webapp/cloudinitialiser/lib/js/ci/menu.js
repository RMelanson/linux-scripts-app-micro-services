/*var activeMenuColor = 'red';

function setActiveMenuColor(color) {
	activeMenuColor = color;
}

function openMenuTab(id, elmnt, color) {
	setActiveMenuColor(color);
	var pageDiv = id + "_DIV";

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
	var newTitle = "Cloud setActiveSelection ";
	switch (id) {
		case "http":
			newTitle += " HTTP ";
			break;
		case "jBoss":
			newTitle += " jBoss ";
			break;
		default:
			newTitle += " " + id + " ";
	}
	newTitle += " Postman Installer";
	//    alert("Before postTitle = "+postTitle.innerHTML);
	postTitle.innerHTML = newTitle;
	//    alert("After postTitle = "+postTitle.innerHTML);
}
*/

var active_fgColor = "#333";
var active_bgColor = "red";
var default_fgColor = "white";
var default_bgColor = "black";

var active_home_fgColor = active_fgColor;
var active_home_bgColor = active_bgColor;
var default_home_fgColor = default_fgColor;
var default_home_bgColor = default_bgColor;

var active_CI_fgColor = active_fgColor;
var active_CI_bgColor = "pink";
var default_CI_fgColor = default_fgColor;
var default_CI_bgColor = "pink";

var active_postman_fgColor = active_fgColor;
var active_postman_bgColor = "green";
var default_postman_fgColor = default_fgColor;
var default_postman_bgColor = "green";

var default_about_fgColor = active_fgColor;
var default_about_bgColor = "yellow";
var active_about_fgColor = default_fgColor;
var active_about_bgColor = "yellow";

var default_test_fgColor = active_fgColor;
var default_test_bgColor = "yellow";
var active_test_fgColor = default_fgColor;
var active_test_bgColor = "yellow";

var active_contact_fgColor = active_fgColor;
var active_contact_bgColor = "grey";
var default_contact_fgColor = default_fgColor;
var default_contact_bgColor = "grey";

const mainMenuSelection = new Map([
	["home_BTN_id", 'home_BTN'],
	["home_BTN_active_fgColor", active_home_fgColor],
	["home_BTN_active_bgColor", active_home_bgColor],
	["home_BTN_default_fgColor", 'default_home_fgColor'],
	["home_BTN_default_bgColor", 'default_home_bgColor'],

	["home_DIV_id", 'home_DIV'],

	["CI_BTN_id", "CI_BTN"],

	["CI_DIV_id", "CI_DIV"],

	["postman_BTN_test_id", 'postman_BTN_test'],
	["postman_BTN_test_active_fgColor", 'active_test_fgColor'],
	["postman_BTN_test_active_bgColor", 'active_test_bgColor'],
	["postman_BTN_test_default_fgColor", 'default_test_fgColor'],
	["postman_BTN_test_default_bgColor", 'default_test_bgColor'],

	["postman_DIV_test_id", 'postman_DIV_test'],
	["postman_DIV_test_active_fgColor", 'active_test_fgColor'],
	["postman_DIV_test_active_bgColor", 'active_test_bgColor'],
	["postman_DIV_test_default_fgColor", 'default_test_fgColor'],
	["postman_DIV_test_default_bgColor", 'default_test_bgColor'],
	["postman_DIV_test_URL", 'http://www.stockwidgets.com:9090/system?cmd=ls'],
	["postman_DIV_test_titleHeader_fgColor", 'default_test_fgColor'],
	["postman_DIV_test_titleHeader_bgColor", 'default_test_bgColor'],
	["postman_DIV_test_titleResponse_fgColor", 'default_test_fgColor'],
	["postman_DIV_test_titleResponse_bgColor", 'default_test_bgColor'],
	["postman_DIV_test_activeColumnSelection", 'default_test_fgColor'],

	["about_BTN_id", 'about_BTN'],

	["about_DIV_id", 'about_DIV'],

	["contact_BTN_id", 'contact_BTN'],

	["contact_DIV_id", 'contact_DIV']
]);

function setMainMenuButtonSelection(elmnt, color, bgColor) {
	var id_BTN = elmnt.id;
	var id_DIV = id_BTN.replace('_BTN', '_DIV');

	setActiveSelection(id_BTN, color, bgColor);
	//	alert("Found Class " + selectedClass);
	configureDivIdSelection(id_DIV, color, bgColor);
}

function setMainMenuMap(elmnt, color, bgColor) {
	var id_BTN = elmnt.id;
	var id_DIV = id_BTN.replace('_BTN', '_DIV');

	setActiveSelection(id_BTN, color, bgColor);
	//	alert("Found Class " + selectedClass);
	configureDivIdSelection(id_DIV, color, bgColor);
}

function configureDivIdSelection(id_DIV, color, bgColor) {
	var elmnt_DIV = document.getElementById(id_DIV);
	setActiveSelection(id_DIV, color, bgColor);
	if (id_DIV == "postman_DIV")
		configurePostMan(elmnt_DIV);
	setVisableSelection(id_DIV);
}

function configurePostMan(postMan_ELMT) {
//	alert("Configuring PostMan For " + postMan_ELMT.value);
}

function setVisableSelection(div_ID, color, bgColor) {
	var div_ELMT = document.getElementById(div_ID);
	var div_CLASS = div_ELMT.className;
	closeAllPageDivs(div_CLASS);
	div_ELMT.style.display = "block";
}

function closeAllPageDivs(divClass) {
	var i, pgDiv;
	pgDiv = document.getElementsByClassName(divClass);

	for (i = 0; i < pgDiv.length; i++) {
		pgDiv[i].style.display = "none";
	}
}

/////////////////////////////// CHECT BOXES CODE ///////////////////////////////////
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
	if (x.className === "main_MENU") {
		x.className += " responsive";
	} else {
		x.className = "main_MENU";
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