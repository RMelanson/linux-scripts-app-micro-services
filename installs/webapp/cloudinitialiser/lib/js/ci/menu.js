function initMainMenu(mmenuId) {
	document.getElementById(mmenuId).click();
}

function setMainMenuButtonSelection(elmnt) {
	var elmt_ID = elmnt.id;
	var div_ID = elmt_ID.replace('_BTN', '_DIV');

	setButtonDivSelection(elmt_ID, div_ID);
}

function setCiPostmanButtonSelection(elmnt) {
	var postman_ID = "postman_ID";
	var elmt_ID = elmnt.id;
	var div_ID = "postman_DIV";

	setActiveIdColors(postman_ID);
	setButtonDivSelection(elmt_ID, div_ID);
}

function setButtonDivSelection(elmt_ID, div_ID) {
	setActiveIdColors(elmt_ID);
	resetClassColors(elmt_ID);
	setActiveIdColors(div_ID);
	setVisableIdSelection(div_ID);
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