var activeColor = 'red';
var app = 'test';
var rightColClass = "rightColClass";
var leftColClass = "leftColClass";
var acvtiveBackGroundColor = "red";

var defaultColor = "lightGrey";
var defaultBackGroundColor = "purple";
var activeColor = "black";
var defaultClassColor = "white";
var defaultClassBackGroundColor = "#333";

const activeIdColors = new Map([
]);

const defaultIdColors = new Map([
]);

const activeClassColors = new Map([
]);

const defaultClassColors = new Map([
]);

const activeBackGroundClassColors = new Map([
]);

const defaultBackGroundClassColors = new Map([
]);

const activeBackGroundIdColors = new Map([
]);

const defaultBackGroundIdColors = new Map([
]);

//////////////////////////// START NEW STUFF ///////////////////////////////////

const selectionMap = new Map([
	"classMaps", new Map([]),
	"idMaps", new Map([
		"activeIdMaps", new Map([]),
		"defaultIdMaps", new Map([])
	]),
]);

// PROCESS CLASS MAPS
function getClassMaps() {
	var classMaps = selectionMap.get("classMaps");
	return classMaps;
}

function getClassMap(mapKey) {
	var classesMaps = getClassMaps();
	var classMaps = classesMap.get(mapKey);
	return classMap;
}

function addClassMap(mapKey) {
	var classMaps = getClassMaps();
	classMaps.set(mapKey, new Map([]));
	return classMap;
}

function getValidClassMap(mapKey) {
	var validClassMap = getClassMap(mapKey);
	if (typeof (validClassMap) == 'undefined' || validClassMap == null) {
		validClassMap = addClassMap(mapKey);
	}
	return validClassMap;
}

function getClassMapProperty(mapKey, propertyKey) {
	var validClassMap = getValidClassMap(mapKey);
	var classMapProperty = validClassMap.get(propertyKey);
	if (typeof (classMapProperty) == 'undefined' || classMapProperty == null)
		return classMapProperty;
	return classMap;
}

function addClassMapPropertyValue(mapKey, propertyKey, propertyValue) {
	var validClassMap = getValidClassMap(mapKey);
	var validClassMapProperty = validClassMap.get(propertyKey);
	validClassMapProperty.set(propertyKey, propertyValue);
	return validClassMapProperty;
}

function getValidClassMapProperty(mapKey, propertyKey, defaultValue) {
	var validClassMap = getValidClassMap(mapKey);
	var validClassProperty = validClassMap.get(propertyKey);
	if (typeof (validClassProperty) == 'undefined' || validClassProperty == null)
		validClassProperty = defaultValue;
	return validClassProperty;
}

// PROCESS ID MAPS
function getIdMaps() {
	var idMaps = selectionMap.get("idMaps");
	return idMaps;
}

// PROCESS ACTIVE ID MAPS

function getActiveIdMaps() {
	var idMaps = getIdMaps();
	var activeIdMaps = idMaps.get("activeIdMaps");
	return activeIdMaps;
}

function getActiveIdMap(mapKey) {
	var activeIdesMaps = getActiveIdMaps();
	var activeIdMaps = activeIdesMap.get(mapKey);
	return activeIdMap;
}

function addActiveIdMap(mapKey) {
	var activeIdMaps = getActiveIdMaps();
	activeIdMaps.set(mapKey, new Map([]));
	return activeIdMap;
}

function getValidActiveIdMap(mapKey) {
	var validActiveIdMap = getActiveIdMap(mapKey);
	if (typeof (validActiveIdMap) == 'undefined' || validActiveIdMap == null) {
		validActiveIdMap = addActiveIdMap(mapKey);
	}
	return validActiveIdMap;
}

function getActiveIdMapProperty(mapKey, propertyKey) {
	var validActiveIdMap = getValidActiveIdMap(mapKey);
	var activeIdMapProperty = validActiveIdMap.get(propertyKey);
	if (typeof (activeIdMapProperty) == 'undefined' || activeIdMapProperty == null)
		return activeIdMapProperty;
	return activeIdMap;
}

function addActiveIdMapPropertyValue(mapKey, propertyKey, propertyValue) {
	var validActiveIdMap = getValidActiveIdMap(mapKey);
	var validActiveIdMapProperty = validActiveIdMap.get(propertyKey);
	validActiveIdMapProperty.set(propertyKey, propertyValue);
	return validActiveIdMapProperty;
}

function getValidActiveIdMapProperty(mapKey, propertyKey, defaultValue) {
	var validActiveIdMap = getValidActiveIdMap(mapKey);
	var validActiveIdProperty = validActiveIdMap.get(propertyKey);
	if (typeof (validActiveIdProperty) == 'undefined' || validActiveIdProperty == null)
		validActiveIdProperty = defaultValue;
	return validActiveIdProperty;
}

// PROCESS DEFAULT ID MAPS

function getDefaultIdMaps() {
	var idMaps = getIdMaps();
	var defaultIdMaps = idMaps.get("defaultIdMaps");
	return defaultIdMaps;
}

function getDefaultIdMap(mapKey) {
	var defaultIdesMaps = getDefaultIdMaps();
	var defaultIdMaps = defaultIdesMap.get(mapKey);
	return defaultIdMap;
}

function addDefaultIdMap(mapKey) {
	var defaultIdMaps = getDefaultIdMaps();
	defaultIdMaps.set(mapKey, new Map([]));
	return defaultIdMap;
}

function getValidDefaultIdMap(mapKey) {
	var validDefaultIdMap = getDefaultIdMap(mapKey);
	if (typeof (validDefaultIdMap) == 'undefined' || validDefaultIdMap == null) {
		validDefaultIdMap = addDefaultIdMap(mapKey);
	}
	return validDefaultIdMap;
}

function getDefaultIdMapProperty(mapKey, propertyKey) {
	var validDefaultIdMap = getValidDefaultIdMap(mapKey);
	var defaultIdMapProperty = validDefaultIdMap.get(propertyKey);
	if (typeof (defaultIdMapProperty) == 'undefined' || defaultIdMapProperty == null)
		return defaultIdMapProperty;
	return defaultIdMap;
}

function addDefaultIdMapPropertyValue(mapKey, propertyKey, propertyValue) {
	var validDefaultIdMap = getValidDefaultIdMap(mapKey);
	var validDefaultIdMapProperty = validDefaultIdMap.get(propertyKey);
	validDefaultIdMapProperty.set(propertyKey, propertyValue);
	return validDefaultIdMapProperty;
}

function getValidDefaultIdMapProperty(mapKey, propertyKey, defaultValue) {
	var validDefaultIdMap = getValidDefaultIdMap(mapKey);
	var validDefaultIdProperty = validDefaultIdMap.get(propertyKey);
	if (typeof (validDefaultIdProperty) == 'undefined' || validDefaultIdProperty == null)
		validDefaultIdProperty = defaultValue;
	return validDefaultIdProperty;
}


//////////////////////////// END NEW STUFF

// OLD WORKING COLOR CODE
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

function setDefaultIdColors(id, color, backgroundColor) {
	setDefaultColorMaps(id, color, backgroundColor);
	var elmnt = document.getElementById(id);
	elmnt.style.backgroundColor = getDefaultBackGroundIdColor(id);
	elmnt.style.color = getDefaultIdColor(id);
}

function initializer(id, color, backgroundColor) {
	elmnt = document.getElementById(id);
	var className = elmnt.className;
	resetClassMemberColors(className);
	setActiveIdColors(id, color, backgroundColor);
}

function setActiveIdColors(id, color, backgroundColor) {
	setActiveColorMaps(id, color, backgroundColor);
	var elmnt = document.getElementById(id);
	elmnt.style.backgroundColor = getActiveBackGroundIdColor(id);
	elmnt.style.color = getActiveIdColor(id);
}

function resetClassMemberColors(className, color, backgroundColor) {
	var i, tablinks;
	var tablinks = document.getElementsByClassName(className);
	var fgDefaultClassColor = getDefaultClassColor(className);
	var bgDefaultClassColor = getDefaultBackGroundClassColor
	for (i = 0; i < tablinks.length; i++) {
		var id = tablinks[i].id;
		setDefaultIdColors(id, fgDefaultClassColor, bgDefaultClassColor);
	}
}

function setActiveColorMaps(id, color, backgroundColor) {
	setColorMap(activeIdColors, id, color)
	setColorMap(activeBackGroundIdColors, id, backgroundColor)
}

function setDefaultColorMaps(id, color, backgroundColor) {

	setColorMap(defaultIdColors, id, color)
	setColorMap(defaultBackGroundIdColors, id, backgroundColor)
}

function setColorMap(colorMap, id, color) {
	if (typeof (color) != 'undefined' && typeof (id) != 'undefined') {
		colorMap.set(id, color);
	}
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