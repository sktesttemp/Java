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
	public String getEmpUserName();
	
	public void save(String strEmpName, String strEmpDOB, String strEmpAdd, String strEmpUserName);	
}
