var activeColor='yellow';

function setActiveDiv(elmnt) {
	resetAllNavMenus(elmnt);
	closeAllPageDivs();
	openColumnDivs(elmnt);
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

function closeAllPageDivs() {
	var i, pgDiv;
	pgDiv = document.getElementsByClassName("page_Div");

	for (i = 0; i < pgDiv.length; i++) {
		pgDiv[i].style.display = "none";
	}
}

//		  alert("SHOW " + divId)
function openColumnDivs(elmnt) {
	var cbId = elmnt.id;
	var divId = cbId + "_Right_Div";
	divElement = document.getElementById(divId);
	divElement.style.display = "block";
	divId = cbId + "_Left_Div";
	divElement = document.getElementById(divId);
	divElement.style.display = "block";
}

function prepRestApi(urlElmt, restMethod, respID) {
	elmnt = document.getElementById(respID);
	setActiveDiv(elmnt);
	resp_Right_Div = respID + "_Right_Div";
	callRestApi(urlElmt, restMethod, resp_Right_Div);
}