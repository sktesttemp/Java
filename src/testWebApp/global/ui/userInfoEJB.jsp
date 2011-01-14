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
					<h3>Session Bean Example</h3>
					<form action="ejbSessionB" method="post">		
						Enter Employee (user) Name...	
						<input type='text' id='txtEmpNameS' name='txtEmpNameS' style='border:1px solid black;' title='Enter Employee Name...'/>						
						<input type="submit" value="Go to EJB SessionBean Ex..">
					</form>	
				</td>
			</tr>	
			<tr style='height:40px;width:100%;'><td>&nbsp;</td></tr>		
			<tr>
				<td> 
					<h3>Entity Bean Example</h3>
					<form action="ejbEntityB" method="post">		
						Enter Employee (user) Name...	
						<input type='text' id='txtEmpNameE' name='txtEmpNameE' style='border:1px solid black;' title='Enter Employee Name...'/>
						<input type="submit" value="Go to EJB EntityBean Ex..">
					</form>	
				</td>
			</tr>				
		</table>		   
	</body>
</html>
