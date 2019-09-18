function setActiveDiv(elmnt) {
	resetClassDefaults(elmnt);
	setActiveColumns(elmnt);
}

//		  alert("SHOW " + divId)
function setActiveColumns(elmnt) {
	var cbId = elmnt.id;
	var divId = cbId + "_Right_Div";
	divElement = document.getElementById(divId);

	var divClass = divElement.className;
	closeClassMembers(divClass);

	//	elmnt.style.backgroundColor = activeColor;
	divElement.style.display = "block";

	divId = cbId + "_Left_Div";
	divElement = document.getElementById(divId);
	divElement.style.display = "block";
}

function closeClassMembers(divClass) {
	var i, classList;
	classList = document.getElementsByClassName(divClass);

	for (i = 0; i < classList.length; i++) {
		classList[i].style.display = "none";
	}
}
