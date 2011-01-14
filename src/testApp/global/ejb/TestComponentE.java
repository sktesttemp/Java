package global.ejb;

import javax.ejb.*;
import java.rmi.*;
import java.lang.*;

public interface TestComponentE extends EJBLocalObject
{       
    public String getEmployeeID();
    public String getEmployeeName();
	public String getEmployeeDOB();
	public String getEmployeeAddress();
	
    public void setEmployeeID(String sEmpID);
	public void setEmployeeName(String sEmpName);
	public void setEmployeeDOB(String sEmpDOB);
   	public void setEmployeeAddress(String sEmpAdd);   
}
