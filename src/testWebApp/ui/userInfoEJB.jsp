<html>
	<head>
		<title>Examples...
		</title>		
	</head>
	<body bgcolor='pink' onload="javascript:document.getElementById('txtEmpName').value='';document.getElementById('txtEmpName').focus();"> 
		<br/><br/>
		<table id='mainTBLEJB'>
			<tr>
				<td> 
					<h3>Employees Information</h3>
					<form action="ejbServlet" method="post">		
						Enter Employee (user) Name...	
						<input type='text' id='txtEmpName' name='txtEmpName' style='border:1px solid black;' title='Enter Employee Name...'/>
						<input type="submit" value="Get Info">
					</form>	
				</td>
			</tr>			
		</table>		   
	</body>
</html>
