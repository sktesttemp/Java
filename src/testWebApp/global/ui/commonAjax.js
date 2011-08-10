function getXMLHTTPObject()
{
	var xmlhttp = null;
	if(window.XMLHttpRequest)
	{
		xmlhttp=new XMLHttpRequest();
	}
	else
	{
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	return xmlhttp;
}

function submitDataToServer(strURL, strJsonDoc)
{	
	var isAssynchronus = true;	
	var oRetJSON = processForAjax(strURL, strJsonDoc, isAssynchronus);
}

function getDataFromServer(strURL, strJsonDoc)
{	
	var isAssynchronus = false;	
	var oRetJSON = processForAjax(strURL, strJsonDoc, isAssynchronus);	
		
	return oRetJSON;
}

function processForAjax(strURL, strJsonDoc, isAssynchronus)
{			
	var xmlhttp = getXMLHTTPObject();	
	var oJSON = null;
	xmlhttp.open("POST",strURL,isAssynchronus);
	xmlhttp.send(strJsonDoc);
	
	if(0 != (xmlhttp.responseText).length && xmlhttp.status == 200)
    {
        var strResultJSON = xmlhttp.responseText;      		
		return strResultJSON;
    }											
}