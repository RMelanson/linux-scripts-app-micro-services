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

function initMainMenu(mmenuId) {
	document.getElementById(mmenuId).click();
}

function setMainMenuButtonSelection(elmnt) {
	var elmt_ID = elmnt.id;
	var fgColor = getValidFgIdColor(elmt_ID);
	var bgColor = getValidBgIdColor(elmt_ID);
	var idName = elmt_ID.replace('_BTN', '');
	setActiveClassElement(elmnt, fgColor, bgColor);
	var elmt_DIV = "";
	if (elmnt.classList.contains("postman")) {
		var innerHTML = "CLOUD_INITIALIZER " + idName.toUpperCase() + " POSTMAN";
		document.getElementById("postmanTitle").innerHTML = innerHTML;
		setIdColors("postmanTitle");
		setIdColors("restMethod");
		setIdColors("urlTextBox");
		elmt_DIV = "postman_DIV";
		document.getElementById("postman_BTN").click();
	}
	else {
		elmt_DIV = idName + '_DIV';
	}

	setActiveIdColors(elmt_DIV, fgColor, bgColor);
	//	alert("Found Class " + selectedClass);
	configureDivIdSelection(elmt_DIV, fgColor, bgColor);
}

function setMainMenuMap(elmnt, fgColor, bgColor) {
	var elmt_ID = elmnt.id;
	var elmt_DIV = elmt_ID.replace('_BTN', '_DIV');

	setActiveIdColors(elmt_DIV, fgColor, bgColor);
	//	alert("Found Class " + selectedClass);
	configureDivIdSelection(elmt_DIV, fgColor, bgColor);
}

function configureDivIdSelection(id_DIV, fgColor, bgColor) {
	var elmnt = document.getElementById(id_DIV);
	setActiveIdColors(id_DIV, fgColor, bgColor);

	if (elmnt.classList.contains("postman"))
		configurePostMan(elmnt_DIV);
	setVisableIdSelection(id_DIV);
}

function configurePostMan(postMan_ELMT) {
	//	alert("Configuring PostMan For " + postMan_ELMT.value);
}

function setVisableIdSelection(elmt_ID) {
	var elmt = document.getElementById(elmt_ID);
	var elmt_CLASS = elmt.className;
	closeAllPageDivs(elmt_CLASS);
	elmt.style.display = "block";
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

function showVerticleNavMenu() {
	var x = document.getElementById("myTopnav");
	if (x.className === "main_MENU") {
		x.className += " responsive";
	} else {
		x.className = "main_MENU";
	}
}