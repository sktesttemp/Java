<html>
	<head>
		<title>Examples...
		</title>		
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
					<!-- hr/>					
					<a href='global/ui/userInfoEJB.jsp'>Go to EJB Page</a -->
					<hr/>	
					<a href='global/ui/userInfoProcess.jsp'>Entity Bean Page...</a>																	
				</td>
			</tr>
		</table>		   

	</body>
</html>
