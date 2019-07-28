function ajaxRestGet(restURL) {
	alert("ajaxRestGet(" + restURL + ")");
	$.support.cors = true;
	var response = ajaxGet(restURL);
	alert("TESTING \ajaxRestGet(" + restURL + ")\n status = " + status + "\nresponse = \n" + response);
}

function ajaxGet(restURL) {
	var response;
	jQuery.ajax({
		type: "GET",
		url: restURL,
		dataType: "text",
		success: function (data, status, jqXHR) {
			response = data;
			alert("TESTING \ajaxRestGet(" + restURL + ")\n" + restURL + "\nWORKS status = " + status + "\ndata = \n" + data);
		},
		error: function (xhr, ajaxOptions, thrownError) {
			response = "ERROR \ajaxRestGet(" + restURL + ")\n" + restURL + "\nFAILED status = " + xhr.status;
			alert("response\n"+thrownError);
		}
	});
	return response;
}

function tutorialTest(restURL) {
	$(document).ready(function () {
		$.ajax({
			url: "http://rest-service.guides.spring.io/greeting"
		}).then(function (data) {
			$('.greeting-id').append(data.id);
			$('.greeting-content').append(data.content);
		});
	});
}
