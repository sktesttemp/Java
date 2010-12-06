package global.main;

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

import java.util.Date;
import org.apache.log4j.Logger;
import org.apache.log4j.BasicConfigurator;
import java.util.Vector;

public class TestEJB extends HttpServlet
{
	static Logger logger = Logger.getLogger(TestEJB.class);

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BasicConfigurator.configure();		
		
		String strEmpName = request.getParameter("txtEmpName");
		
		logger.info("Welcome to Global Automation ("+new Date()+")!!");
			
		String ejbMessage = "";
			
		TestHome testHome = null;
		//-TestLocalHome testHome = null;
		
		try 
		{
			InitialContext ctx = new InitialContext();
			Object objref = ctx.lookup("global.ejb.TestComponent");
		    testHome = (TestHome)PortableRemoteObject.narrow(objref,TestHome.class);		    
		    //-testHome = (TestLocalHome)PortableRemoteObject.narrow(objref,TestLocalHome.class);
		}
		catch (Exception ne) 
		{
			logger.fatal("Exception Occured in EJB-JNDI! - "+ne.getMessage());
			ne.printStackTrace();
		}

		try
		{
			TestComponent beanObj;
			//-TestLocalComponent beanObj;
			beanObj = testHome.create();
			
			ejbMessage = beanObj.displayHello(); 
			beanObj.remove();
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
			pw.print("<h4>Welcome to Mr/Ms "+strEmpName+"!</h4>");	
			pw.print("<h6>EJB Message: "+ejbMessage+"!</h6>");	
			pw.print("<input type='button' value='Home Page' onclick='callMe();'/>");			
			pw.print("<script>function callMe(){history.go(-1);}</script>");
		}		
		catch(Exception e)
		{			
			logger.fatal("Exception Occured in Controller! - "+e.getMessage());
		}	
	}	
}
