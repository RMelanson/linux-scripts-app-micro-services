function callRestApi() {
	var url = document.getElementById("urlTextBox").value;
	var method = document.getElementById("jsonMethod").value.toUpperCase();
	switch(method) {
		case "GET":
		  ajaxGetJson(url);
		  break;
		case "POST":
			ajaxPostJson(url);
		  break;
		default:
		  alert("UNKNOWN METHOD "+method)
	  } 
}

function ajaxGetJson(url) {
	var response;
	var status;
	var data;

	$.support.cors = true;
	$.getJSON(url, data, function (data, status) {
		if (status === "success") {
			console.log("data = "+data);
			console.log("GetJSON \ajaxGetJson(" + url + ")\n" + url + "\nWORKS status = " + status + "\ndata = \n" + data);
			alert ("getJSON 1 " + data);
			alert ("getJSON 2 " + JSON.stringify(data));
			var response = document.getElementById("response");
			response.innerHTML = JSON.stringify(data);
		}
		else {
		    console.log("GetJSON ERROR \ajaxGetJson(" + url + ")\n" + url + "\nWORKS status = " + status + "\ndata = \n" + data);
            alert("GetJSON ERROR \ajaxGetJson(" + url + ")\n" + url + "\nWORKS status = " + status + "\ndata = \n" + data);
		}
	    console.log(data);
	    }
	);
}

function ajaxPostJson(url) {
	var response;
	var status;
	var data;

	$.support.cors = true;
	$.postJSON(url, data, function (data, status) {
		if (status === "success") {
			console.log("data = "+data);
			console.log("PostJSON \ajaxPostJson(" + url + ")\n" + url + "\nWORKS status = " + status + "\ndata = \n" + data);
			alert ("1 " + data);
			alert ("2 " + JSON.stringify(data));
			var response = document.getElementById("response");
			response.innerHTML = JSON.stringify(data);
		}
		else {
		    console.log("PostJSON ERROR \ajaxPostJson(" + url + ")\n" + url + "\nWORKS status = " + status + "\ndata = \n" + data);
            alert("GetJSON ERROR \ajaxGetJson(" + url + ")\n" + url + "\nWORKS status = " + status + "\ndata = \n" + data);
		}
	    console.log(data);
	    }
	);
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