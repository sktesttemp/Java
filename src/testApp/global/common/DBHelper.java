package global.common;

import java.sql.Connection; 
import java.sql.DriverManager; 
import java.sql.SQLException; 
import java.sql.Statement; 
import java.sql.ResultSet; 
import java.sql.ResultSetMetaData;
import java.sql.DatabaseMetaData;
import java.util.Vector;
import java.lang.ClassNotFoundException;

import java.lang.StackTraceElement;
import java.lang.Thread;
import java.lang.Throwable;

public class DBHelper
{
	public Connection getMSSQLConnection()			
 	{ 
		Connection conn=null;
		String strServerName = "jdbc:jtds:sqlserver";
		String strDriverName = "net.sourceforge.jtds.jdbc.Driver";
		String strIP = "localhost";
		String strPort = "1433";
		String strDatabaseName = "hbp";
		String strUserName = "sa";
		String strPassword = "sasas";
		
		String strConnectionString;
		strConnectionString = strServerName+"://"+strIP+":"+strPort+"/"+strDatabaseName;
		try
  		{
	  		Class.forName(strDriverName);	  		
	  		conn = DriverManager.getConnection(strConnectionString,strUserName,strPassword);	  		
        }        
        catch(SQLException sq)
  		{
	  		sq.printStackTrace();
			System.out.println("MSSQL Exception Occured! - "+sq.getMessage());
        }
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("Exception Occured! - "+e.getMessage());
		}
		return conn;
	}
	
	public Connection getMYSQLConnection()			
 	{
		Connection conn=null;				
		
		String strDriverName = "com.mysql.jdbc.Driver";
		String strServerName = "jdbc:mysql";
		String strDomain = "localhost";		
		String strDatabaseName = "practicedb";
		String strUserName = "root";
		String strPassword = "root";				
				 
		String url=strServerName+"://"+strDomain+"/"+strDatabaseName+"?user="+strUserName+"&password="+strPassword;		
		try
  		{
			Class.forName(strDriverName);
	  		conn = DriverManager.getConnection(url);		  			  		 			  	
        }        
        catch(SQLException sq)
  		{
	  		sq.printStackTrace();
	  		System.out.println("MySQL Exception Occured! - "+sq.getMessage());
  		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("Exception Occured! - "+e.getMessage());
		}				
		return conn; 
	}
	
 	public Vector getResult(String name)
 	{	 	
	 	ResultSet rst=null;	 	
		Statement stmt=null;
		Connection conn=null;
		Vector vResult=new Vector();
		
		DBHelper dbh = new DBHelper();	 	
				
	 	conn = dbh.getMYSQLConnection(); // for MySQL	
	 	//conn = dbh.getMSSQLConnection(); //for MSSQL
	 	System.out.println("\n\nGGGGG:"+conn);
	 	try
	 	{		 			 	
		 	stmt=conn.createStatement();	  		
		
		 	rst=stmt.executeQuery("select empid,empfullname,empipaddress,sex,permission from tblempdetails where username like '%"+name+"%' limit 1"); // for MySQL	
			//rst=stmt.executeQuery(" select username from hbpusers "); //for MSSQL
			
			
			ResultSetMetaData rsmd = rst.getMetaData();				
			int nNoOfColumns = rsmd.getColumnCount();      
			while(rst.next()){
				for (int i = 1; i <= nNoOfColumns; i++) {				
					vResult.add(rst.getString(i));
				}				
			}			
			/*DatabaseMetaData metadata = conn.getMetaData();        	
        	ResultSet resultSet = metadata.getPrimaryKeys("", "", "tblempdetails");        	
        	while (resultSet.next()) {
        		String name1 = resultSet.getString("COLUMN_NAME");        		       			
       			System.out.println("Column name: [" + name1 + "]");
       		}*/    
		}
		catch(SQLException sq)
  		{
	  		sq.printStackTrace();
	  		System.out.println("SQL Exception Occured! - "+sq.getMessage());
  		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("Exception Occured! - "+e.getMessage());
		}
		finally
		{
			try
			{	
				rst.close();			
				stmt.close();
				conn.close();	 	
			}
			catch(Exception ee)
			{
				System.out.println("Problem in Closing connection!"+ee.getMessage());	
			}				
		}
		return vResult;		
 	} 		
}
