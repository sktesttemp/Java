<html>
	<head>
		<title>Examples...
		</title>
		<script type="text/javascript">			
		</script>
	</head>
	<body>
    	<jsp:forward page="global/ui/userInfo.jsp">
	  		<jsp:param name="" value=""/>
		</jsp:forward>
		<%--						
			String destination = "/WEB-INF/ui/userInfo.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
			rd.forward(request, response);
		--%>
	</body>
</html>
