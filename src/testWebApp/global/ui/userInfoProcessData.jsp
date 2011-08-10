<%@ page import="javax.naming.*,
				 javax.rmi.PortableRemoteObject,
				 global.common.*,
				 global.ejb.*,
				 java.io.IOException,
				 java.util.Vector,
				 java.util.*,
				 javax.ejb.*"
%>
<%!
	String strEmps = "";
%>
<%
	System.out.println("Came inside JSP:userInfoProcessData.jsp");		
	String strMode = request.getParameter("mode");
	System.out.println("Mode is: "+strMode);	

	TestHomeE testHome = null;			
	strEmps = "";
	try 
	{
		InitialContext ctx = new InitialContext();
		Object objref = ctx.lookup("global.ejb.TestComponentE");
	    testHome = (TestHomeE)PortableRemoteObject.narrow(objref,TestHomeE.class);		    		    
	}
	catch (Exception ne) 
	{
		System.out.println("userInfoProcessData.jsp:Exception Occured in EJB-JNDI for Entity Bean! - "+ne.getMessage());
		ne.printStackTrace();
	}	
	
	if("getEmps".equals(strMode))
	{	
		strEmps = "";
		try 
		{
			String strQ = "select username from tblemployee";
			DBHelper dbh = new DBHelper();	
			Vector vOut = dbh.getQueryToVector(strQ);
			
			for(int nCount = 0;nCount < vOut.size();nCount++){										
				strEmps += vOut.get(nCount);
				if(nCount != vOut.size()-1)
					strEmps += ",";														
			}	
			System.out.println("Result isss: "+strEmps);
		}
		catch (Exception ne) 
		{
			System.out.println("userInfoProcessData.jsp:Exception Occured in EJB-JNDI for Entity Bean! - "+ne.getMessage());
			ne.printStackTrace();
		}	
	}
	else if("getEmpInfo".equals(strMode))
	{			
		try
		{		
			String strEmpName = request.getParameter("EmpUserName");				
			Collection colObj = testHome.findByUserName(strEmpName);
			Iterator iter = colObj.iterator();
            while(iter.hasNext())
            {
                TestComponentE beanObj = (TestComponentE)iter.next();

                strEmps += beanObj.getEmployeeID();strEmps += "|";														 
                strEmps += beanObj.getEmpUserName();strEmps += "|";
				strEmps += beanObj.getEmployeeName();strEmps += "|";														
				strEmps += beanObj.getEmployeeAddress();strEmps += "|";														
				strEmps += beanObj.getEmployeeDOB();			  
            }						
		}
		catch(Exception ce)
		{
			System.out.println("userInfoProcessData.jsp:Exception Occured in EJB-CREATE! - "+ce.getMessage());
			ce.printStackTrace();
		}				
		System.out.println("userInfoProcessData.jsp:Result is: "+strEmps);		
	}	
	else if("saveEmpInfo".equals(strMode))
	{				
		strEmps = "";			
		String strEmpID = "";
		String sEmpName = "";
		String sEmpDOB  = "";
		String sEmpAdd 	= "";
		String sEmpUserName  = "";
		
		System.out.println("userInfoProcessData.jsp:Came in: "+strMode);	
		
		try
		{						
			strEmpID = request.getParameter("EmpID");
			
			sEmpName		= request.getParameter("EmpName");
			sEmpDOB 		= request.getParameter("EmpDOB");
			sEmpAdd 		= request.getParameter("EmpAdd");
			sEmpUserName = request.getParameter("EmpUserName");
						
			TestComponentE beanObj = testHome.findByPrimaryKey(strEmpID);																	
            beanObj.save(sEmpName,sEmpDOB,sEmpAdd,sEmpUserName);            
            strEmps = "Value is updated for EmpID: "+strEmpID;
		}
		catch(FinderException fe)
		{						
			System.out.println("userInfoProcessData.jsp:Finder Exception Occured in EJB Save! - "+fe.getMessage());
			
			try
			{
				testHome.create(strEmpID,sEmpName,sEmpDOB,sEmpAdd,sEmpUserName);
			}
			catch(CreateException ce)
			{
				System.out.println("userInfoProcessData.jsp:Create Exception occured in Create for :: "+strEmpID+" :: "+sEmpName+" :: "+sEmpDOB+" :: "+sEmpAdd+" :: "+sEmpUserName);
				System.out.println("userInfoProcessData.jsp:Message: "+ce.getMessage());
				strEmps = "userInfoProcessData.jsp:Create Exception occured in Create";
			}
			strEmps = "New Entry is created... With EmpID: "+strEmpID;
		}
		catch(Exception ce)
		{
			System.out.println("userInfoProcessData.jsp:Exception Occured in EJB-CREATE! - "+ce.getMessage());			
			strEmps = "Exception: Error Ocurred in Saving..., Message: "+ce.getMessage();
			ce.printStackTrace();
		}		
		System.out.println(strEmps);		
	}	
	else if("deleteEmpInfo".equals(strMode))
	{				
		strEmps = "";			
		String strEmpID = "";
		
		System.out.println("userInfoProcessData.jsp:Came in: "+strMode);	
		
		try
		{						
			strEmpID = request.getParameter("EmpID");

			TestComponentE beanObj = testHome.findByPrimaryKey(strEmpID);																	
            beanObj.remove();            
            strEmps = "Record is deleted for EmpID: "+strEmpID;
		}
		catch(FinderException fe)
		{						
			System.out.println("userInfoProcessData.jsp:Finder Exception Occured in EJB Save! - "+fe.getMessage());			
			strEmps = "userInfoProcessData.jsp:Remove Exception occured in Delete.";
		}
		catch(RemoveException re)
		{
			System.out.println("userInfoProcessData.jsp:Remove Exception Occured in EJB Delete! - "+re.getMessage());			
			strEmps = "userInfoProcessData.jsp:Create Exception occured in Create, Message: "+re.getMessage();			
		}			
		catch(Exception ce)
		{
			System.out.println("userInfoProcessData.jsp:Exception Occured in EJB-CREATE! - "+ce.getMessage());			
			strEmps = "Exception: Error Ocurred in Saving..., Message: "+ce.getMessage();
			ce.printStackTrace();
		}		
		System.out.println(strEmps);		
	}	
	
	out.print(strEmps);
%>