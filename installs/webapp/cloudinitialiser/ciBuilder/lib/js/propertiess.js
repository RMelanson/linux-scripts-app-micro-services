var activeColor = 'red';
var app = 'test';
var rightColClass = "rightColClass";
var leftColClass = "leftColClass";
var acvtiveBackGroundColor = "red";

var defaultColor = "lightGrey";
var defaultBackGroundColor = "purple";
var activeColor = "black";

//////////////////////////// START NEW STUFF ///////////////////////////////////

const selectionMap = new Map([
	["classMaps", new Map([])],
	["idMaps", new Map([])]
]);

// PROCESS CLASS MAPS
function getClassMaps() {
	var classMaps = selectionMap.get("classMaps");
	return classMaps;
}

function getClassMap(mapKey) {
	var classMaps = getClassMaps();
	var classMap = classMaps.get(mapKey);
	return classMap;
}

function addClassMap(mapKey) {
	var classMaps = getClassMaps();
	var newMap = new Map([]);
	classMaps.set(mapKey, newMap);
	return newMap;
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

function setClassMapPropertyValue(mapKey, propertyKey, propertyValue) {
	var validClassMap = getValidClassMap(mapKey);
	validClassMap.set(propertyKey, propertyValue);
	return propertyValue;
}

function getValidClassMapProperty(mapKey, propertyKey, defaultValue) {
	var validClassMap = getValidClassMap(mapKey);
	var validClassProperty = validClassMap.get(propertyKey);
	if (typeof (validClassProperty) == 'undefined' || validClassProperty == null) {
		validClassProperty = defaultValue;
		validClassMap.set(propertyKey, validClassProperty);
	}

	return validClassProperty;
}

// PROCESS ID MAPS
function getIdMaps() {
	var idMaps = selectionMap.get("idMaps");
	return idMaps;
}

function getIdMap(mapKey) {
	var idMaps = getIdMaps();
	var idMap = idMaps.get(mapKey);
	return idMap;
}

function addIdMap(mapKey) {
	var idMaps = getIdMaps();
	var newMap = new Map([]);
	idMaps.set(mapKey, newMap);
	return newMap;
}

function getValidIdMap(mapKey) {
	var validIdMap = getIdMap(mapKey);
	if (typeof (validIdMap) == 'undefined' || validIdMap == null) {
		validIdMap = addIdMap(mapKey);
	}
	return validIdMap;
}

function getIdMapProperty(mapKey, propertyKey) {
	var validIdMap = getValidIdMap(mapKey);
	var idMapProperty = validIdMap.get(propertyKey);
	if (typeof (idMapProperty) == 'undefined' || idMapProperty == null)
		return idMapProperty;
	return idMap;
}

function setIdMapPropertyValue(mapKey, propertyKey, propertyValue) {
	var validIdMap = getValidIdMap(mapKey);
	validIdMap.set(propertyKey, propertyValue);
	return propertyValue;
}

function getValidIdMapProperty(mapKey, propertyKey, defaultValue) {
	var validIdMap = getValidIdMap(mapKey);
	var validIdProperty = validIdMap.get(propertyKey);
	if (typeof (validIdProperty) == 'undefined' || validIdProperty == null)
		validIdProperty = defaultValue;
	{
		validIdProperty = defaultValue;
		validIdMap.set(propertyKey, defaultValue);
	}
	return validIdProperty;
}

// Color Methods

function isValidColor(strColor) {
	if (typeof (strColor) == 'undefined' || strColor == null)
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

function resetClassMemberColors(className, fgColor, bgColor) {
	var i, tablinks;
	var tablinks = document.getElementsByClassName(className);
	if (typeof (tablinks) != 'undefined' && tablinks != null) {
		var validFgClassColor = getValidFgClassColor(className, fgColor);
		var validBgClassColor = getValidBgClassColor(className, bgColor);
		for (i = 0; i < tablinks.length; i++) {
			var elmnt = tablinks[i];
			elmnt.style.color = validFgClassColor;
			elmnt.style.backgroundColor = validBgClassColor;
		}
	}
}

function setActiveIdColors(idName, fgColor, bgColor) {
	var i, tablinks;
	setIdMapPropertyValue(idName, "fgColor", fgColor);
	setIdMapPropertyValue(idName, "bgColor", bgColor);
	var validFgClassColor = getValidFgIdColor(idName, fgColor);
	var validBgClassColor = getValidBgIdColor(idName, bgColor);
	var elmnt = document.getElementById(idName);
	elmnt.style.color = validFgClassColor;
	elmnt.style.backgroundColor = validBgClassColor;
}

function setActiveSelectionColors(idName, fgColor, bgColor) {
	elmnt = document.getElementById(idName);
	var className = elmnt.className;
	resetClassMemberColors(className);
	setActiveIdColors(idName, fgColor, bgColor);
}

function setActiveClassElement(elmnt,  fgColor, bgColor) {
	var idName = elmnt.id;
	var className = elmnt.className;
	resetClassMemberColors(className);
	setActiveIdColors(idName,  fgColor, bgColor);
};
