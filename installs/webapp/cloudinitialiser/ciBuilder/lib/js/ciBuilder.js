var activeColor='yellow';

function setActiveColor(color) {
	activeColor = color;
}

function setActiveDiv(elmnt) {
	resetAllNavMenus(elmnt);
	setActiveColumns(elmnt);
}

function resetAllNavMenus(elmnt) {
	var i, tablinks;
	var navMenuClass = elmnt.className;
	tablinks = document.getElementsByClassName(navMenuClass);
	for (i = 0; i < tablinks.length; i++) {
		tablinks[i].style.backgroundColor = "";
	}
	elmnt.style.backgroundColor = activeColor;
}

//		  alert("SHOW " + divId)
function setActiveColumns(elmnt) {
	var cbId = elmnt.id;
	var divId = cbId + "_Right_Div";
	divElement = document.getElementById(divId);

	var divClass = divElement.className;
	closeAllPageDivs(divClass);

	divElement.style.display = "block";

	divId = cbId + "_Left_Div";
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
	elmnt = document.getElementById(respID);
	setActiveDiv(elmnt);
	resp_Right_Div = respID + "_Right_Div";
	callRestApi(urlElmt, restMethod, resp_Right_Div);
}