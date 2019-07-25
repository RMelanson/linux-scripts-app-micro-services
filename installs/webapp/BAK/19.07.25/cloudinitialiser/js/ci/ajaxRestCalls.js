function ajaxRestGet(restURL) {
    $.support.cors = true;
    var response = ajaxGet(restURL);
	alert("TESTING \ajaxRestGet(" + restURL +")\n status = "+status+"\nresponse = \n"+response);
}

function ajaxGet(restURL) {
	var response;
	jQuery.ajax({
		type : "GET",
		url : restURL,
		dataType: "text",
		success : function(data, status, jqXHR) {
			response = data;
//			alert("TESTING \ajaxRestGet(" + restURL +")\n" + restURL +"\nWORKS status = "+status+"\ndata = \n"+data);
//			return data;
		},
		error : function(xhr, ajaxOptions, thrownError) {
//			alert("TESTING \ajaxRestGet(" + restURL +")\n" + restURL +"\nFAILED status = "+xhr.status);
			alert(thrownError);
		}
	});
	return response;
}