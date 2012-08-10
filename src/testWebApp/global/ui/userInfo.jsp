<html>
	<head>
		<title>Examples...</title>	
		<script type='text/javascript' src='./commonAjax.js'></script>	
		<script type="text/javascript">
			function getUserInfoAJAX(){
				var strURL    = "secondServlet?mode=deleteEmpInfo&EmpID="+strEmpId;	        	
	    		var retData = getDataFromServer(strURL, null);	
				alert('sanjay....!!!');
			}
		</script>
	</head>
	<body bgcolor='lightblue' onload="javascript:document.getElementById('txtEmpName').value='';document.getElementById('txtEmpName').focus();"> 
		<br/><br/>
		<table id='mainTBL'>
			<tr>
				<td> 
					<h3>Employees Information</h3>
					<form action="firstServlet" method="post">		
						Enter Employee (user) Name...	
						<input type='text' id='txtEmpName' name='txtEmpName' style='border:1px solid black;' title='Enter Employee Name...'/>
						<input type="submit" value="Get Info">
					</form>	
				</td>
			</tr>
			<tr>
				<td> 
					<hr/>	
					<h3>Employees Information with AJAX</h3>
				
					Enter Employee (user) Name...	
					<input type='text' id='txtEmpNameT' name='txtEmpNameT' style='border:1px solid black;' title='Enter Employee Name...'/>
					<input type="button" value="Get User Info" onclick="getUserInfoAJAX();">					
				</td>
			</tr>
			<tr>
				<td> 
					<!-- hr/>					
					<a href='global/ui/userInfoEJB.jsp'>Go to EJB Page</a -->
					<hr/>	
					<a href='global/ui/userInfoProcess.jsp'>Entity Bean Page...</a>																	
				</td>
			</tr>
		</table>		   

	</body>
</html>
