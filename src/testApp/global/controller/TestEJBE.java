package global.controller;

import global.common.*;
import global.ejb.*;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.naming.*;
import javax.rmi.PortableRemoteObject;

import java.util.*;
import java.util.Date;
import org.apache.log4j.Logger;
import org.apache.log4j.BasicConfigurator;
import java.util.Vector;

public class TestEJBE extends HttpServlet
{
	static Logger logger = Logger.getLogger(TestEJBE.class);

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BasicConfigurator.configure();		
		
		String strEmpName = request.getParameter("txtEmpNameE");
		
		logger.info("Welcome to Global Automation for Entity Bean... - ("+new Date()+")!!");
		logger.info("\n\nHi "+strEmpName);
		
		String strId	= "";
		String strName 	= "";
		String strDOB 	= "";
		String strAddr 	= "";
			
		TestHomeE testHome = null;		
		
		try 
		{
			InitialContext ctx = new InitialContext();
			Object objref = ctx.lookup("global.ejb.TestComponentE");
		    testHome = (TestHomeE)PortableRemoteObject.narrow(objref,TestHomeE.class);		    		    
		}
		catch (Exception ne) 
		{
			logger.fatal("Exception Occured in EJB-JNDI for Entity Bean! - "+ne.getMessage());
			ne.printStackTrace();
		}

		try
		{						
			Collection colObj = testHome.findByEmpName(strEmpName);
			Iterator iter = colObj.iterator();
            while(iter.hasNext())
            {
                TestComponentE beanObj = (TestComponentE)iter.next();

                strId	= beanObj.getEmployeeID(); 
				strName = beanObj.getEmployeeName();
				strDOB	= beanObj.getEmployeeDOB();
				strAddr	= beanObj.getEmployeeAddress();			  
            }						
		}
		catch(Exception ce)
		{
			logger.fatal("Exception Occured in EJB-CREATE! - "+ce.getMessage());
			ce.printStackTrace();
		}
		
		PrintWriter pw = response.getWriter();		
		response.setContentType("text/html");		
		try
		{	
			String strVal = "";
			
			pw.print("<h5>Date: "+new Date()+"</h5>");
			pw.print("<h4>Welcome Mr/Ms &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label style='color:brown;'>"+strName+"!</label></h4>");	
			pw.print("<h5>Your Information</h6>");	
			pw.print("<h6>Employee ID: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label style='color:brown;'>"+strId+"!</label></h6>");	
			pw.print("<h6>Date of Birth: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label style='color:brown;'>"+strDOB+"!</label></h6>");	
			pw.print("<h6>Address: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label style='color:brown;'>"+strAddr+"!</label></h6>");	
			
			pw.print("<input type='button' value='Home Page' onclick='callMe();'/>");			
			pw.print("<script>function callMe(){history.go(-1);}</script>");
		}		
		catch(Exception e)
		{			
			logger.fatal("Exception Occured in Controller! - "+e.getMessage());
		}	
	}	
}
