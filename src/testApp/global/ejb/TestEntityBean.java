package global.ejb;

import java.rmi.RemoteException;
import javax.ejb.CreateException;
import javax.ejb.EJBException;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;
import javax.ejb.*;

public abstract class TestEntityBean implements EntityBean
{
	private EntityContext ctx;

	//CMP field accessors ------------------------------------------------------	
	public abstract String getEmployeeID();
	public abstract void setEmployeeID(String sEmpId);
	
	public abstract String getEmployeeName();
	public abstract void setEmployeeName(String sEmpName);
	
	public abstract String getEmployeeDOB();
	public abstract void setEmployeeDOB(String sDOB);
	
	public abstract String getEmployeeAddress();
	public abstract void setEmployeeAddress(String sEmpAdd);	
	//CMP field accessors ------------------------------------------------------
	
    //ejb methods --------------------------------------------------------------	
   	public String ejbCreate() throws CreateException{return "";}   		
	public void ejbPostCreate() {}
   	public void ejbRemove() { }
   	public void ejbStore() { }
   	public void ejbLoad() { }
   	public void ejbActivate() { }
   	public void ejbPassivate() { }
    //---------------------------------------------------------------------------
    
	public void setEntityContext(EntityContext ctx) {
      	this.ctx = ctx;
   	}

   	public void unsetEntityContext() {
    	this.ctx = null;
   	}

}
