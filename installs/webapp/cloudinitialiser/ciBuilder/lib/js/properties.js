var activeColor = 'red';
var app = 'test';
var rightColClass = "rightColClass";
var leftColClass = "leftColClass";
var acvtiveBackGroundColor = "red";

var defaultColor = "lightGrey";
var defaultBackGroundColor = "purple";
var activeColor = "black";

//////////////////////////// START NEW STUFF ///////////////////////////////////
function isValidType(obj) {
	if (typeof (obj) == 'undefined' || obj == null) {
		return false;
	}
	return true;
}

const classMaps = new Map([]); // Map of Class maps
const idMaps = new Map([]);    // Map of Id maps
const selectionMap = new Map([ // Map for Cookie store and retreival (Not Yet Implemented)
	["classMaps", classMaps],
	["idMaps", idMaps]
]);

// GENERAL MAP FUNCTIONS

getMapValue(map, key) {
	return map.get(key);
}

function addNewMap(map, mapKey) {
	var newMap;
	if (!isValidType(mapKey)) {
		newMap = new Map([]);
		map.set(mapKey, newMap);
	}
	return newMap;
}

function getValidMapValue(map, mapKey) {
	var validClassMap = getMapValue(map, mapKey);
	if (!isValidType(validClassMap)) {
		validClassMap = addNewMap(map, mapKey);
	}
	return validClassMap;
}

function getMapMapProperty(map, mapKey, propertyKey) {
	var property;
	var validMapValue = getMapValue(map, mapKey);
	if (isValidType(validMapValue))
		property = validMapValue.get(propertyKey);
	return property;
}

function setMapMapPropertyValue(map, mapKey, propertyValue) {
	var validMap = getValidMapValue(mapKey);
	if (!isValidType(validMap))
		validClassMap.set(propertyKey, propertyValue);
	return propertyValue;
}

function getValidMapMapProperty(map, mapKey, propertyKey, defaultPropertyValue) {
	var validMapValue = getValidMapValue(map, mapKey);
	var property = validMapValue.get(propertyKey);
	if (!isValidType(property)) {
		property = defaultPropertyValue;
		validMapValue.set(propertyKey, property);
	}
	return property;
}

/*
function setValidMapValue(map, key, value) {
	if (isValidType(key) && isvalid(value))
		map.set(key, value);
	return value;
}
*/

// PROCESS CLASS MAPS
function getClassMap(mapKey) {
	return getMapValue(classMaps, mapKey);
}

function addClassMap(mapKey) {
	return addNewMap(classMaps, mapKey);
}

function getValidClassMap(mapKey) {
	return getValidMapValue(classMaps, mapKey);
}

function getClassMapProperty(mapKey, propertyKey) {
	return getMapMapProperty(classMaps, mapKey, propertyKey);
}

function setClassMapPropertyValue(mapKey, propertyValue) {
	return setMapMapPropertyValue(classMaps, mapKey, propertyValue);
}

function getValidClassMapProperty(mapKey, propertyKey, defaultValue) {
	return getValidMapMapProperty(classMaps, mapKey, propertyKey, defaultPropertyValue);
}

// PROCESS ID MAPS

function getIdMap(mapKey) {
	return getMapValue(idMaps, mapKey);
}

function addIdMap(mapKey) {
	return addNewMap(idMaps, mapKey);
}

function getValidIdMap(mapKey) {
	return getValidMapValue(idMaps, mapKey);
}

function getIdMapProperty(mapKey, propertyKey) {
	return getMapMapProperty(idMaps, mapKey, propertyKey);
}

function setIdMapPropertyValue(mapKey, propertyValue) {
	return setMapMapPropertyValue(idMaps, mapKey, propertyValue);
}

function getValidIdMapProperty(mapKey, propertyKey, defaultValue) {
	return getValidMapMapProperty(idMaps, mapKey, propertyKey, defaultPropertyValue);
}

// Color Methods

function isValidColor(strColor) {
	if (isValidType(strColor))
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

function putActiveIdColors(idName, fgColor, bgColor) {
	setIdMapPropertyValue(idName, "fgColor", fgColor);
	setIdMapPropertyValue(idName, "bgColor", bgColor);
}

function setActiveIdColors(idName, fgColor, bgColor) {
	putActiveIdColors(idName, fgColor, bgColor);
	var validFgClassColor = getValidFgIdColor(idName, fgColor);
	var validBgClassColor = getValidBgIdColor(idName, bgColor);
	var elmnt = document.getElementById(idName);
	elmnt.style.color = validFgClassColor;
	elmnt.style.backgroundColor = validBgClassColor;
}

function setActiveSelectionColors(idName, fgColor, bgColor) {
	elmnt = document.getElementById(idName);
	var className = elmnt.className;
	setDefaultClassColors(className);
	setActiveIdColors(idName, fgColor, bgColor);
}

function setActiveClassElement(elmnt, fgColor, bgColor) {
	var idName = elmnt.id;
	var className = elmnt.className;
	setDefaultClassColors(className);
	setActiveIdColors(idName, fgColor, bgColor);
};

function putDefaultClassColors(className, fgColor, bgColor) {
	setClassMapPropertyValue(className, "fgColor", fgColor);
	setClassMapPropertyValue(className, "bgColor", bgColor);
}

function setDefaultClassColors(className, fgColor, bgColor) {
	putDefaultClassColors(className, fgColor, bgColor)
	var i, tablinks;
	var tablinks = document.getElementsByClassName(className);
	if (!isValidType(tablinks)) {
		var validFgClassColor = getValidFgClassColor(className, fgColor);
		var validBgClassColor = getValidBgClassColor(className, bgColor);
		for (i = 0; i < tablinks.length; i++) {
			var elmnt = tablinks[i];
			elmnt.style.color = validFgClassColor;
			elmnt.style.backgroundColor = validBgClassColor;
		}
	}
}