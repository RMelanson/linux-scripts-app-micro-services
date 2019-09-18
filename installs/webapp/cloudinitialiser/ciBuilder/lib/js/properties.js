//////////////////////////// START NEW STUFF ///////////////////////////////////

// Set ~ store values in Hash map
// Valid ~ use existing value in hash map or use default and store in Map (Like CASH)
// Active ~ apply properties to a particular element id or class

class ciPostmanAppSettings {
	constructor(app) {
		this.app = app;
		this.idMaps = new Map([]);    // Map of Id maps
		this.classMaps = new Map([]);    // Map of Id maps
	}
	// cookieMap = new Map([ // Map for Cookie store and retreival (Not Yet Implemented)
	// 	["classMaps", classMaps],
	// 	["idMaps", idMaps]
	// ]);
}

// Initialize a constructor from a class
var postmanAppSettings = setNewPostmanApp("test");

function setNewPostmanApp(app) {
	newPostmanAppSettings = new ciPostmanAppSettings("Test");
	//	alert("postmanAppSettings" = postmanAppSettings);
//	console.log("postmanAppSettings" = newPostmanAppSettings);
	alert("ZZZZ");
	return newPostmanAppSettings;
}

function isValidType(obj) {
	if (typeof (obj) == 'undefined' || obj == null) {
		return false;
	}
	return true;
}

// GENERAL MAP FUNCTIONS

function getcookieMap() {
	return postmanAppSettings.cookieMap;
}
function getClassMaps() {
	return postmanAppSettings.classMaps;
}
function getIdMaps() {
	return postmanAppSettings.idMaps;
}

function getMapValue(map, key) {
	if (!isValidType(key))
		return null;
	return map.get(key);
}

function setValidMap(map, mapKey) {
	var newMap;
	if (isValidType(mapKey)) {
		newMap = new Map([]);
		map.set(mapKey, newMap);
	}
	return newMap;
}

function getValidMap(map, mapKey) {
	var validMap = getMapValue(map, mapKey);
	if (!isValidType(validMap)) {
		validMap = setValidMap(map, mapKey);
	}
	return validMap;
}

function getMapMapProperty(map, mapKey, propertyKey) {
	var property;
	var validMapValue = getMapValue(map, mapKey);
	if (isValidType(validMapValue))
		property = validMapValue.get(propertyKey);
	return property;
}

function setMapMapPropertyValue(map, mapKey, propertyKey, propertyValue) {
	var validMap = getValidMap(map, mapKey);
	if (isValidType(validMap))
		validMap.set(propertyKey, propertyValue);
	return propertyValue;
}

function getValidMapMapProperty(map, mapKey, propertyKey, defaultPropertyValue) {
	var validMapValue = getValidMap(map, mapKey);
	var property = validMapValue.get(propertyKey);
	if (!isValidType(property)) {
		property = defaultPropertyValue;
		validMapValue.set(propertyKey, property);
	}
	return property;
}

// PROCESS CLASS MAPS
function getClassMap(mapKey) {
	return getMapValue(postmanAppSettings.classMaps, mapKey);
}

function set(mapKey) {
	return setValidMap(postmanAppSettings.classMaps, mapKey);
}

function getValidClassMap(mapKey) {
	return getValidMap(postmanAppSettings.classMaps, mapKey);
}

function getClassMapProperty(mapKey, propertyKey) {
	return getMapMapProperty(postmanAppSettings.classMaps, mapKey, propertyKey);
}

function setClassMapPropertyValue(mapKey, propertyKey, propertyValue) {
	return setMapMapPropertyValue(postmanAppSettings.classMaps, mapKey, propertyKey, propertyValue);
}

function getValidClassMapProperty(mapKey, propertyKey, defaultValue) {
	return getValidMapMapProperty(postmanAppSettings.classMaps, mapKey, propertyKey, defaultPropertyValue);
}

// PROCESS ID MAPS

function getIdMap(mapKey) {
	return getMapValue(postmanAppSettings.idMaps, mapKey);
}

function setIdMap(mapKey) {
	return setValidMap(postmanAppSettings.idMaps, mapKey);
}

function getValidIdMap(mapKey) {
	return getValidMap(postmanAppSettings.idMaps, mapKey);
}

function getIdMapProperty(mapKey, propertyKey) {
	return getMapMapProperty(postmanAppSettings.idMaps, mapKey, propertyKey);
}

function setIdMapPropertyValue(mapKey, propertyKey, propertyValue) {
	return setMapMapPropertyValue(postmanAppSettings.idMaps, mapKey, propertyKey, propertyValue);
}

function getValidIdMapProperty(mapKey, propertyKey, defaultValue) {
	return getValidMapMapProperty(postmanAppSettings.idMaps, mapKey, propertyKey, defaultValue);
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

function setClassColors(idName, fgColor, bgColor) {
	setClassMapPropertyValue(idName, "fgColor", fgColor);
	setClassMapPropertyValue(idName, "bgColor", bgColor);
}

function setClassBtnColors(idName, fgColor, bgColor) {
	setClassColors(idName + "_BTN", fgColor, bgColor);
}

function setClassDivColors(idName, fgColor, bgColor) {
	setClassColors(idName + "_DIV", fgColor, bgColor);
}

function setActiveIdColors(idName, fgColor, bgColor) {
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
	setActiveIdColors(idName, fgColor, bgColor);
}

function setClassColors(className, fgColor, bgColor) {
	setClassMapPropertyValue(className, "fgColor", fgColor);
	setClassMapPropertyValue(className, "bgColor", bgColor);
}

function resetClassColors(className, fgColor, bgColor) {
	setClassColors(className, fgColor, bgColor)
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