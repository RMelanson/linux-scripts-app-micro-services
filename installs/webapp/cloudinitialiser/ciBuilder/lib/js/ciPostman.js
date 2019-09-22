var rightColClass = "rightColClass";
var leftColClass = "leftColClass";

function getValidAppDiv(respID, divClass) {
	var element = document.getElementById(respID);
	closeAllPageDivs(rightColClass);

	//If it isn't "undefined" and it isn't "null", then it exists.
	if (typeof (element) == 'undefined' || element == null) {
		var mainDiv = document.getElementById(respID);
		var divElmt = document.createElement('div');
		divElmt.class = divClass;
		divElmt.id = appId;
		divElmt.innerHTML = "New Div Element class " + divClass;
		mainDiv.appendChild(divElmt);
	}
	return element;
}

////////////////////////////////////// FROM OLD ///////////////////////////////
function setActiveDivId(elmnt_ID) {
	elmnt = document.getElementById(elmnt_ID);
	var elmnt_CLASS = elmnt.className;
	setActiveDiv(elmnt);
}

function setActiveDiv(elmnt) {
	var elmnt_CLASS = elmnt.className;
	var elmnt_ID = elmnt.id;
	paintClassDefaults(elmnt_CLASS);
	paintIdColors(elmnt_ID);
	setActiveColumns(elmnt);
}

function displayActiveDiv(elmnt) {
	setActiveColumns(elmnt);
}

//		  alert("SHOW " + divId)
function setActiveColumns(elmnt) {
	var cbId = elmnt.id;
	var divId = cbId + "_Right_Div";
	elmnt_DIV = document.getElementById(divId);
	closeClassMembers(elmnt_DIV);

	//	elmnt.style.backgroundColor = activeColor;
	elmnt_DIV.style.display = "block";

	divId = cbId + "_Left_Div";
	elmnt_DIV = document.getElementById(divId);
	elmnt_DIV.style.display = "block";
}

function closeClassMembers(elmnt) {
	var className = elmnt.className;
	var classList = document.getElementsByClassName(className);

	for (var i = 0; i < classList.length; i++) {
		classList[i].style.display = "none";
	}
}

function paintPostmanButtonSelection(elmnt) {
	var postman_ID = "postman_BTN";
	var elmnt_CLASS = elmnt.className;
	var elmnt_ID = elmnt.id;
	var div_ID = "postman_DIV";

	paintClassDefaults(elmnt_CLASS);
	paintIdColors(elmnt_ID);
	paintIdDivSelection(postman_ID, div_ID);
}

function paintIdDivSelection(elmnt_ID, div_ID) {
	var elmnt = document.getElementById(elmnt_ID);
	var elmnt_CLASS = elmnt.className;

	paintClassDefaults(elmnt_CLASS);
	paintIdColors(elmnt_ID);
	paintIdColors(div_ID);
	displayIdSelection(div_ID);
}

function paintClassDefaults(className) {
	repaintClassColors(className);
}

function repaintClassColors(className) {
	var i, tablinks;
	var tablinks = document.getElementsByClassName(className);
	if (isValidType(tablinks)) {
		var validFgClassColor = getValidFgClassColor(className);
		var validBgClassColor = getValidBgClassColor(className);
		for (i = 0; i < tablinks.length; i++) {
			var elmnt = tablinks[i];
			elmnt.style.color = validFgClassColor;
			elmnt.style.backgroundColor = validBgClassColor;
		}
	}
}

function displayIdSelection(elmnt_ID) {
	var elmnt = document.getElementById(elmnt_ID);
	var elmnt_CLASS = elmnt.className;
	closeAllPageDivs(elmnt_CLASS);
	elmnt.style.display = "block";
}

function closeAllPageDivs(divClass) {
	var i, pgDiv;
	pgDiv = document.getElementsByClassName(divClass);

	for (i = 0; i < pgDiv.length; i++) {
		pgDiv[i].style.display = "none";
	}
}

/////////////////////////////////// API CODE ///////////////////////////////////////
function prepRestApi(urlElmt, restMethod, respID) {
	var respDivApp = initRightCol(respID);
	callRestApi(urlElmt, restMethod, respDivApp.id);
}

function initRightCol(id) {
	setActiveDivId(id);

	var respDivApp = getValidAppDiv(id + "_Right_Div", rightColClass);
	return respDivApp;
}

/////////////////////////////// CHECK BOXES CODE ///////////////////////////////////
function checkBoxDivToggle(checkBox) {
	var cbId = checkBox.id;
	var divPageId = cbId + "_Div";
	//	  alert("checkBox = " + checkBox+ " checkBox Id = " + cbId+ " divPageId = " + divPageId);
	elmnt_DIV = document.getElementById(divPageId);
	if (checkBox.checked == true) {
		//		  alert("SHOW " + divPageId)
		elmnt_DIV.style.display = "block";
	} else {
		//		  alert("HIDE " + divPageId)
		elmnt_DIV.style.display = "none";
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

// Color Methods

function isValidColor(strColor) {
	if (!isValidType(strColor))
		return false;
	var s = new Option().style;
	s.color = strColor;

	// return 'false' if color wasn't assigned
	return s.color == strColor.toLowerCase();
}

function getValidFgClassColor(className, color) {
	var defaultColor = isValidColor(color) ? color : "white";
	var retColor = getValidClassMapProperty(className, "fgColor", defaultColor);
	return retColor;
}

function getValidBgClassColor(className, color) {
	var defaultColor = isValidColor(color) ? color : "#333";
	var retColor = getValidClassMapProperty(className, "bgColor", defaultColor);
	return retColor;
}

function getValidFgIdColor(idName, color) {
	var defaultColor = isValidColor(color) ? color : "black";
	var retColor = getValidIdMapProperty(idName, "fgColor", defaultColor);
	return retColor;
}

function getValidBgIdColor(idName, color) {
	var defaultColor = isValidColor(color) ? color : "red";
	var retColor = getValidIdMapProperty(idName, "bgColor", defaultColor);
	return retColor;
}

function setIdColors(idName, fgColor, bgColor) {
	setIdMapPropertyValue(idName, "fgColor", fgColor);
	setIdMapPropertyValue(idName, "bgColor", bgColor);
}

function setIdBtnColors(idName, fgColor, bgColor) {
	setIdColors(idName + "_BTN", fgColor, bgColor);
}

function setIdDivColors(idName, fgColor, bgColor) {
	setIdColors(idName + "_DIV", fgColor, bgColor);
}

function setClassBtnColors(idName, fgColor, bgColor) {
	setClassColors(idName + "_BTN", fgColor, bgColor);
}

function setClassDivColors(idName, fgColor, bgColor) {
	setClassColors(idName + "_DIV", fgColor, bgColor);
}

function paintIdColors(idName, fgColor, bgColor) {
	setIdColors(idName, fgColor, bgColor);
	var validFgClassColor = getValidFgIdColor(idName, fgColor);
	var validBgClassColor = getValidBgIdColor(idName, bgColor);
	var elmnt = document.getElementById(idName);
	elmnt.style.color = validFgClassColor;
	elmnt.style.backgroundColor = validBgClassColor;
}

function setActiveSelectionColors(idName, fgColor, bgColor) {
	elmnt = document.getElementById(idName);
	var className = elmnt.className;
	setClassMapPropertyValue(className);
	paintIdColors(idName, fgColor, bgColor);
}

function setClassColors(className, fgColor, bgColor) {
	setClassMapPropertyValue(className, "fgColor", fgColor);
	setClassMapPropertyValue(className, "bgColor", bgColor);
}

/////// CUSTOM PROPERTIES METHODS

function setPostmanTitle(idName, key, value) {
	setIdMapPropertyValue(idName, key, value);
}
