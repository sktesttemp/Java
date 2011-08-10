<!DOCTYPE HTML "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml-strict.dtd">
<html>
	<head>
		<title>Process Beans Data...</title>	
		<script type="text/javascript" src="./common/jQuery/jquery.js"></script> 
		<script type="text/JavaScript" src="./common/jQuery/jquery.curvycorners.source.js"></script>
		<script type='text/javascript' src='./userInfoProcess.js'></script>	
		<script type='text/javascript' src='./commonAjax.js'></script>	
		<style type='text/css'>	
			.tabs{background-color:#008080;color:white;border:1px solid black;}		
			.tabs:hover{color:pink;border:1px solid black;}
			.tabs:visited{color:red;border:1px solid black;}
		</style>
		<script type='text/javascript'>			
		</script>
	</head>
	<body bgcolor='lightblue' onload='callOnBodyLoad();'> 
		<br/><br/>
		
		<table id='mainProcessTBL'>
			<colgroup>
				<col></col>
				<col></col>
			</colgroup>
			<tr>				
				<td colspan='2'>
					<input type='button' class='tabs' id='btnInfoView' name='btnInfoView' onclick='showInfoView("View");' value='View'/>					
					<input type='button' class='tabs' id='btnInfo' name='btnInfo' onclick='showInfo("Edit");' value='Edit'/>					
					<input type='button' class='tabs' id='btnInfoA' name='btnInfoA' onclick='showInfo("Add");' value='Add'/>					
					<input type='button' class='tabs' id='btnInfoD' name='btnInfoD' onclick='showInfoView("Delete");' value='Delete'/>					
				</td>
			</tr>
			<tr><td colspan='2' style='height='5px;'></td></tr>	
			<tr> 
				<td colspan='2' style='height='20px;'>
					<select id='selEmps' style='display:none;'></select>
				</td>
			</tr>	
			<tr id='tblData' style='display:none;'>
				<td colspan='2'> 										
					<table style='border:1px solid black;background-color:pink;'>
					<colgroup>
						<col width='200px'></col>
						<col width='350px'></col>
					</colgroup>
						<tr>
							<td> 					
								Employee ID:
							</td>
							<td>
								<input type='text' id='txtEmpID' name='txtEmpID' style='width:350px;border:1px solid black;'/>					
							</td>
						</tr>						
						<tr><td colspan='2' style='height='5px;'></td></tr>	
						<tr>
							<td> 					
								Employee's UserName:
							</td>
							<td>
								<input type='text' id='txtEmpUN' name='txtEmpUN' style='width:350px;border:1px solid black;'/>					
							</td>
						</tr>			
						<tr><td colspan='2' style='height='5px;'></td></tr>
						<tr>
							<td> 					
								Employee (user) Name:
							</td>
							<td>
								<input type='text' id='txtEmpName' name='txtEmpName' style='width:350px;border:1px solid black;'/>					
							</td>
						</tr>
						<tr><td colspan='2' style='height='5px;'></td></tr>						
						<tr>
							<td> 					
								Employee (user) Address:
							</td>
							<td>
								<input type='text' id='txtEmpAddress' name='txtEmpAddress' style='width:350px;border:1px solid black;'/>					
							</td>
						</tr>			
						<tr><td colspan='2' style='height='5px;'></td></tr>						
						<tr>
							<td> 					
								Employee (user) DOB:
							</td>
							<td>
								<input type='text' id='txtEmpDOB' name='txtEmpDOB' style='width:350px;border:1px solid black;'/>					
							</td>
						</tr>			
						<tr><td colspan='2' style='height='5px;'></td></tr>												
					</table>										
				</td>
			</tr>
			<tr>				
				<td colspan='2' align='right'>
					<input type='button' id='btnSave' name='btnSave' onclick='btnSaveOnClick();' value='Save' style='display:none;border:1px solid black;'/>					
					<input type='button' id='btnCancel' name='btnCancel' onclick='btnCancelOnClick();' value='Cancel' style='display:none;border:1px solid black;'/>					
				</td>
			</tr>
		</table>		   	
	</body>
</html>