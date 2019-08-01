function callRestApi() {
	var url = document.getElementById("urlTextBox").value;
	var method = document.getElementById("jsonMethod").value.toUpperCase();
	var response = document.getElementById("response");
	response.innetHTML = "";
	var data;

	switch (method) {
		case "GET":
			ajaxGetJson(url, response, data);
			break;
		case "POST":
			ajaxPostJson(url, response, data);
			break;
		default:
			response.innetHTML = "UNKNOWN METHOD " + method;
	}
	return data;
}

function ajaxGetJson(url, response, data) {
	var status;

	alert("EXECUTING: GET@" + url)

	$.support.cors = true;
	$.getJSON(url, data, function (data, status) {
		if (status === "success") {
			var response = document.getElementById("response"); if (status === "success") {
				var beautifiedData = JSON.stringify(data, null, 4.);
				console.log("data = " + data);
				console.log("beautifiedData = " + beautifiedData);
				console.log("GetJSON \ajaxGetJson(" + url + ")\n" + url + "\nWORKS status = " + status + "\ndata = \n" + data);

				response.innerHTML = beautifiedData;
			}
			else {
				console.log("GetJSON ERROR \ajaxGetJson(" + url + ")\n" + url + "\nWORKS status = " + status + "\ndata = \n" + data);
				alert("GetJSON ERROR \ajaxGetJson(" + url + ")\n" + url + "\nWORKS status = " + status + "\ndata = \n" + data);
			}
			console.log(data);
		}
	});
}

function ajaxPostJson(url, response, data) {
	var status;

	alert("EXECUTING: POST@" + url)

	$.support.cors = true;
	$.post(url, data, function (data, status) {
		if (status === "success") {
			var response = document.getElementById("response"); if (status === "success") {
				var beautifiedData = JSON.stringify(data, null, 4.);
				console.log("data = " + data);
				console.log("beautifiedData = " + beautifiedData);
				console.log("PostJSON \ajaxPostJson(" + url + ")\n" + url + "\nWORKS status = " + status + "\ndata = \n" + data);

				response.innerHTML = beautifiedData;
			}
			else {
				console.log("PostJSON ERROR \ajaxPostJson(" + url + ")\n" + url + "\nWORKS status = " + status + "\ndata = \n" + data);
				alert("PostJSON ERROR \ajaxPostJson(" + url + ")\n" + url + "\nWORKS status = " + status + "\ndata = \n" + data);
			}
			console.log(data);
		}
	},
		'json');
}

/*
function ajaxGet(restURL) {
	var response;
	$.ajax({
		url: restURL,
		type: "GET",
		dataType: 'json',
		contentType: "application/json",
		success: function (data, status, jqXHR) {
			response = data;
			alert("SUCCESS \ajaxGet(" + restURL + ")\n" + restURL + "\nWORKS status = " + status + "\ndata = \n" + data);
		},
		error: function (xhr, ajaxOptions, errorThrown) {
			response = "ERROR \ajaxGet(" + restURL + ")\n" + restURL + "\nFAILED status = " + xhr.status;
			alert("ERROR response\n" + response);
			console.log(errorThrown);
		}
	});
	return response;
}


function ajaxPost(restURL) {
	var response;
	$.ajax({
		url: 'users.php',
		dataType: 'json',
		type: 'POST',
		contentType: 'application/json',
		data: JSON.stringify({ "first-name": $('#first-name').val(), "last-name": $('#last-name').val() }),
		processData: false,
		success: function (data, textStatus, jQxhr) {
			$('#response pre').html(JSON.stringify(data));
		},
		error: function (jqXhr, textStatus, errorThrown) {
			console.log(errorThrown);
		}
	});
	return response;
}
*/