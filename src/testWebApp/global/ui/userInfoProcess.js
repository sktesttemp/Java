function callOnBodyLoad()
{
	document.getElementById('selEmps').onchange=function(){callOnChangeEmps(1);};
	document.getElementById('selEmps').onkeyup=function(event){callOnChangeEmps(2,event);};
	refreshEmpCombo();
	modifyColor();	
	
	/*settings = {
				tl: { radius: 10 },
				tr: { radius: 10 },
				bl: { radius: 10 },
				br: { radius: 10 },
				antiAlias: true						
			}							
			$('.tabs').corner(settings);		
	*/
}

function modifyColor(){
	if(document.getElementById('tblData').style.display != 'block'){
		document.getElementById('mainProcessTBL').style.backgroundColor='lightblue';
		document.getElementById('mainProcessTBL').style.border='0px';		
	}	
	else{
		document.getElementById('mainProcessTBL').style.backgroundColor='#F9F9F9';
		document.getElementById('mainProcessTBL').style.border='0px solid black';		
	}
}
	
function showInfo(strMode)
{
	document.getElementById('tblData').style.display='block';
	document.getElementById('selEmps').style.display='block';
	
	document.getElementById('txtEmpName').disabled=false;
	document.getElementById('txtEmpAddress').disabled=false;
	document.getElementById('txtEmpDOB').disabled=false;
	if(strMode == 'Add'){
		document.getElementById('txtEmpID').disabled=false;		
		document.getElementById('selEmps').style.display='none';				
	}
	else{
		document.getElementById('txtEmpID').disabled=true;		
	}			
	document.getElementById('txtEmpUN').disabled=false;	
	document.getElementById('btnSave').style.display='inline';
	document.getElementById('btnSave').value='Save';
	document.getElementById('btnCancel').style.display='inline';
	document.getElementById('btnCancel').value='Cancel';
	clearInfo();
	modifyColor();	
}

function showInfoView(strMode)
{	
	document.getElementById('tblData').style.display='block';
	document.getElementById('selEmps').style.display='block';
	
	document.getElementById('txtEmpName').disabled=true;
	document.getElementById('txtEmpAddress').disabled=true;
	document.getElementById('txtEmpDOB').disabled=true;
	document.getElementById('txtEmpID').disabled=true;			
	document.getElementById('txtEmpUN').disabled=true;	
	
	document.getElementById('btnCancel').style.display='inline';
	
	if(strMode == 'Delete'){				
		document.getElementById('btnSave').style.display='inline';
		document.getElementById('btnSave').value='Delete';
		document.getElementById('btnCancel').value='Cancel';	
					
	}
	else{
		document.getElementById('btnCancel').value='OK';		
		document.getElementById('btnSave').style.display='none';
	}
	clearInfo();	
	modifyColor();	
}

function btnSaveOnClick()
{
	var strEmpId= document.getElementById('txtEmpID').value;	
	
	if(strEmpId == null || strEmpId == "")return false;
	
	if(document.getElementById('btnSave').style.display != "none" && document.getElementById('btnSave').value == "Delete")
	{
		var strStatus = confirm("Are you sure to delete the selected record...???");
		if(!strStatus)return false;
		
		var strURL    = "userInfoProcessData.jsp?mode=deleteEmpInfo&EmpID="+strEmpId;	        	
	    var retData = getDataFromServer(strURL, null);	
	    if(typeof retData != 'undefined' && retData != null && retData != "")
	    {
		 	alert("Record Deletedd...! "+retData); 
		 	refreshEmpCombo();  
	    }
	    btnCancelOnClick();	
	    if(document.getElementById('selEmps') != null)document.getElementById('selEmps').options[0].selected = true;	
	}
	else
	{	
		var sName 	= document.getElementById('txtEmpName').value;
		var sAdd  	= document.getElementById('txtEmpAddress').value;
		var sDOB  	= document.getElementById('txtEmpDOB').value;
		var sEUN  	= document.getElementById('txtEmpUN').value;	
		
		var strValToSave = sEUN+"|"+sName+"|"+sAdd+"|"+sDOB;
	
		var strURL    = "userInfoProcessData.jsp?mode=saveEmpInfo&EmpID="+strEmpId+"&EmpName="+sName+"&EmpDOB="+sDOB+"&EmpAdd="+sAdd+"&EmpUserName="+sEUN;	        	
	    var retData = getDataFromServer(strURL, null);	
	    if(typeof retData != 'undefined' && retData != null && retData != "")
	    {
		 	alert("Data Savedd...! "+retData);  
		 	refreshEmpCombo(); 
	    }  
	    btnCancelOnClick();  
    }    
    modifyColor();
}

function callOnChangeEmps(option, e)
{	
	if(option != null && option==2)
	{
		if(!e)e = window.event;
    	var nChkKeyCode = e.keyCode;
	    
	    if(38 == nChkKeyCode || 40 == nChkKeyCode)
	    {
			var oSel = document.getElementById('selEmps');		
			var strURL    = "userInfoProcessData.jsp?mode=getEmpInfo&EmpUserName="+oSel.options[oSel.selectedIndex].text;	        
			if(oSel.options[oSel.selectedIndex].text == ""){clearInfo();return false;}
		    var retData = getDataFromServer(strURL, "");	
			
			var arr = retData.split("|");
			populateInfo(arr);		        
	    }
    }
    else if(option != null && option == 1)
    {
		var oSel = document.getElementById('selEmps');			
		var strURL    = "userInfoProcessData.jsp?mode=getEmpInfo&EmpUserName="+oSel.options[oSel.selectedIndex].text;	        
		if(oSel.options[oSel.selectedIndex].text == ""){clearInfo();return false;}	
	    var retData = getDataFromServer(strURL, "");	
	
		var arr = retData.split("|");
		populateInfo(arr);		
	}
}

function populateInfo(arr)
{
	document.getElementById('txtEmpID').value 		= arr[0]; 
	document.getElementById('txtEmpUN').value		= arr[1];
	document.getElementById('txtEmpName').value		= arr[2];	
	document.getElementById('txtEmpAddress').value	= arr[3];
	document.getElementById('txtEmpDOB').value		= arr[4];		
}

function btnCancelOnClick()
{
	document.getElementById('tblData').style.display='none';
	document.getElementById('btnSave').style.display='none';	
	document.getElementById('selEmps').style.display='none';
	document.getElementById('btnCancel').style.display='none';
	modifyColor();
}

function refreshEmpCombo()
{
	var objSelBox = document.getElementById('selEmps');	
	var strURL    = "userInfoProcessData.jsp?mode=getEmps";	        
    
    var retData = getDataFromServer(strURL, "");	
    
	var arr = retData.split(",");
	populateCombo(objSelBox, arr, false, true);	
}

function populateCombo(strComboId, arrComboVal, nSelectedInd, bClear)
{	
	var Lists = arrComboVal;	
	var combobox = strComboId;
	if(typeof strComboId == 'string')combobox = document.getElementById(strComboId);	

	if (bClear != undefined && bClear != null && bClear != "" && true == bClear)
    {
        if (combobox.options.length != 0)
	    {
	        while (combobox.options.length != 0)
	        {
	            combobox.options.remove(0);
	        }
	    }
    } 
    combobox.options[0] = new Option("","");   
	for (var i = 0; i < Lists.length;i++)
	{
		try
		{			
			var OptionName = Lists[i];
			var OptionId = Lists[i];
			
			combobox.options[i+1] = new Option(OptionName,OptionId);			
		}
		catch(error)
		{
			continue;
		}		
	}
	if(nSelectedInd != undefined && nSelectedInd != "" && nSelectedInd < combobox.options.length && nSelectedInd >= 0)
		combobox.options[nSelectedInd].selected = true;
	else
		combobox.options[0].selected = true;
}

function clearInfo()
{
	document.getElementById('txtEmpID').value 		= ""; 
	document.getElementById('txtEmpUN').value		= "";
	document.getElementById('txtEmpName').value		= "";	
	document.getElementById('txtEmpAddress').value	= "";
	document.getElementById('txtEmpDOB').value		= "";
	if(document.getElementById('selEmps') != null)document.getElementById('selEmps').options[0].selected = true;			
}