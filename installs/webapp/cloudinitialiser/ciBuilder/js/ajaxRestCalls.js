function ajaxGetJson(url) {
	var response;
	var status;
	var data;

	$.support.cors = true;
	$.getJSON(url, data, function (data, status) {
		if (status === "success") {
			console.log("data = "+data);
			console.log("GetJSON \ajaxGetJson(" + url + ")\n" + url + "\nWORKS status = " + status + "\ndata = \n" + data);
			alert ("1 " + data);
			alert ("2 " + JSON.stringify(data));
		}
		else {
		    console.log("GetJSON ERROR \ajaxGetJson(" + url + ")\n" + url + "\nWORKS status = " + status + "\ndata = \n" + data);
		}
	    console.log(data);
	    }
	);
}

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

function loadW3Doc(restURL) {
	alert("loadW3Doc(restURL)");
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function () {
		if (this.readyState == 4 && this.status == 200) {
			alert(this.responseText);
			//      document.getElementById("demo").innerHTML =
			this.responseText;
		}
	};
	xhttp.open("GET", restURL, true);
	xhttp.send();
}
