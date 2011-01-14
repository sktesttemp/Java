<%-- @ taglib prefix="json" uri="http://www.atg.com/taglibs/json" --%>
<%-- @ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="tlt" --%>

<%-- @ page import="org.json.JSONObject" --%>
<%--
    * Core: http://java.sun.com/jsp/jstl/core
    * XML: http://java.sun.com/jsp/jstl/xml
    * Internationalization: http://java.sun.com/jsp/jstl/fmt
    * SQL: http://java.sun.com/jsp/jstl/sql
    * Functions: http://java.sun.com/jsp/jstl/functions
--%>
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
					<hr/>					
					<a href='global/ui/userInfoEJB.jsp'>Go to EJB Page</a>																	
				</td>
			</tr>
		</table>		   


	<%-- json:object>
	  <json:property name="outer" value="foo"/>	   
	  <json:object name="inner">
	    <json:property name="innerProp1" value="val1"/>
	    <json:property name="innerProp2" value="val2"/>	    	    
	  </json:object> 	  	  
	</json:object --%>
	
	</body>
</html>

<%--		 	
	JSONObject json = new JSONObject();
	json.put("city", "Mumbai");
	json.put("country", "India");

	String output = json.toString();
	
	System.out.println("\n\nSanjay................!::"+output);
	
--%>
