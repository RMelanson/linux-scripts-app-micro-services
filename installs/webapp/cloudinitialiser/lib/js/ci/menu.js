function initMainMenu(mmenuId) {
	document.getElementById(mmenuId).click();
}

function setMainMenuButtonSelection(elmnt) {
	var elmnt_ID = elmnt.id;
	var div_ID = elmnt_ID.replace('_BTN', '_DIV');

	paintIdDivSelection(elmnt_ID, div_ID);
}