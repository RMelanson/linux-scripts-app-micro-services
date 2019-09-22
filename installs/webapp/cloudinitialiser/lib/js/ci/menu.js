function initMainMenu(mmenuId) {
	document.getElementById(mmenuId).click();
}

function setMainMenuButtonSelection(elmnt) {
	var elmnt_CLASS = elmnt.className;
	paintActiveClassId(elmnt);

	var elmnt_ID = elmnt.id;
	var div_ID = elmnt_ID.replace('_BTN', '_DIV');
	elmnt_DIV = document.getElementById(div_ID);

	displayActiveClassId(elmnt_DIV);
}
