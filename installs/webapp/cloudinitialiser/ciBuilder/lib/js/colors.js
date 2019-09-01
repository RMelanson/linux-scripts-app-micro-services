var activeColor = 'red';
var app = 'test';
var rightColClass = "rightColClass";
var leftColClass = "leftColClass";
var acvtiveBackGroundColor = "red";

var defaultColor = "lightGrey";
var defaultBackGroundColor = "purple";
var defaultActiveColor = "black";
var defaultClassColor = "white";
var defaultClassBackGroundColor = "#333";

const activeIdColors = new Map([
	["Home", 'red'],
	["CI", 'green'],
	["Postman", 'Orange'],
	["About", 'pink'],
	["Contact", 'yellow']
]);

const defaultIdColors = new Map([
	["Home", 'red'],
	["CI", 'green'],
	["Postman", 'Orange'],
	["About", 'pink'],
	["Contact", 'yellow']
]);

const activeClassColors = new Map([
	["topNav_BTN", 'red'],
	["rightColClass", 'green'],
	["leftColClass", 'Orange'],
	["About", 'pink'],
	["Contact", 'yellow']
]);

const defaultClassColors = new Map([
	["TopNav", 'black'],
	["rightColClass", 'green'],
	["leftColClass", 'Orange'],
	["About", 'pink'],
	["Contact", 'yellow']
]);

const activeBackGroundClassColors = new Map([
	["TopNav", 'red'],
	["rightColClass", 'green'],
	["leftColClass", 'Orange'],
	["About", 'pink'],
	["Contact", 'yellow']
]);

const defaultBackGroundClassColors = new Map([
	["TopNav", 'black'],
	["rightColClass", 'green'],
	["leftColClass", 'Orange'],
	["About", 'pink'],
	["Contact", 'yellow']
]);

const activeBackGroundIdColors = new Map([
	["Home", 'red'],
	["CI", 'green'],
	["Postman", 'Orange'],
	["About", 'pink'],
	["Contact", 'yellow']
]);

const defaultBackGroundIdColors = new Map([
	["Home", 'red'],
	["CI", 'green'],
	["Postman", 'Orange'],
	["About", 'pink'],
	["Contact", 'yellow']
]);

function getActiveIdColor(id) {
	var color = activeIdColors.get(id);
	if (typeof (color) == 'undefined' || color == null) {
		var clazz = document.getElementById(id);
		color = getActiveClassColor(clazz);
	}
	return color;
}

function getActiveClassColor(clazz) {
	color = activeClassColors.get(clazz);
	if (typeof (color) == 'undefined' || color == null) {
		color = defaultClassBackGroundColor;
	}
	return color;
}

function getDefaultIdColor(id) {
	var color = defaultIdColors.get(id);
	if (typeof (color) == 'undefined' || color == null) {
		var clazz = document.getElementById(id);
		color = getDefaultClassColor(clazz);
	}
	return color;
}

function getDefaultClassColor(clazz) {
	color = defaultBackGroundClassColors.get(clazz);
	if (typeof (color) == 'undefined' || color == null) {
		color = defaultClassColor;
	}
	return color;
}

function getActiveBackGroundIdColor(id) {
	var color = activeBackGroundIdColors.get(id);
	if (typeof (color) == 'undefined' || color == null) {
		var elmnt = document.getElementById(id);
		var clazz = elmnt.className;
		color = getActiveBackGroundClassColor(clazz);
	}
	return color;
}

function getActiveBackGroundClassColor(clazz) {
	var color = activeBackGroundClassColors.get(clazz);
	if (typeof (color) == 'undefined' || color == null) {
		color = acvtiveBackGroundColor;
	}
	return color;
}

function getDefaultBackGroundIdColor(id) {
	var color = defaultBackGroundIdColors.get(id);
	if (typeof (color) == 'undefined' || color == null) {
		var elmnt = document.getElementById(id);
		var clazz = elmnt.className;
		color = getDefaultBackGroundClassColor(clazz);
	}
	return color;
}

function getDefaultBackGroundClassColor(clazz) {
	var color = defaultBackGroundClassColors.get(clazz);
	if (typeof (color) == 'undefined' || color == null) {
		color = defaultClassBackGroundColor;
	}
	return color;
}

function setDefaultIdColors(id) {
	var elmnt = document.getElementById(id);
	elmnt.style.backgroundColor = getDefaultBackGroundIdColor(id);
	elmnt.style.color = getDefaultIdColor(id);
}

function setActiveColors(id) {
	var elmnt = document.getElementById(id);
	elmnt.style.backgroundColor = getActiveBackGroundIdColor(id);
	elmnt.style.color = getActiveIdColor(id);
}

function resetClassMemberColors(className) {
	var i, tablinks;
	tablinks = document.getElementsByClassName(className);
	for (i = 0; i < tablinks.length; i++) {
		var id = tablinks[i].id;
		setDefaultIdColors(id);
	}
}

function setActiveColorSelection(id) {
	elmnt = document.getElementById(id);
	var className = elmnt.className;
	resetClassMemberColors(className);
	setActiveColors(id);
}

/*
function setActiveApp(app) {
	setApp("test");
	setActiveClassId(elmnt.id);
	setActiveColumn(elmnt.id);
}

function setActiveColor(activeColor) {
	this.activeColor = activeColor;
}

function setActiveDiv(elmnt) {
	id = elmnt.id;
	setActiveClassId(id);
	setActiveColumn(id);
}


//		  alert("SHOW " + divId)
function setActiveColumn(id) {
	var divId = id + "_Right_Div";
	divElement = document.getElementById(divId);

	var divClass = divElement.className;
	closeAllPageDivs(divClass);

	divElement.style.display = "block";

	divId = id + "_Left_Div";
	divElement = document.getElementById(divId);
	divElement.style.display = "block";
}

function closeAllPageDivs(divClass) {
	var i, classList;
	classList = document.getElementsByClassName(divClass);

	for (i = 0; i < classList.length; i++) {
		classList[i].style.display = "none";
	}
}

function prepRestApi(urlElmt, restMethod, respID) {
	var respDivApp = initRightCol(respID);
	callRestApi(urlElmt, restMethod, respDivApp.id);
}

function initRightCol(id) {
	setActiveDiv(id);

	var respDivApp = getValidAppDiv(id + "_Right_Div", rightColClass);
	return respDivApp;
}

function getValidAppDiv(respID, divClass) {
	var appId = app + "_Div";
	var element = document.getElementById(appId);
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

function setApp(app) {
	this.app = app;
}
*/