package global.ejb;

import javax.ejb.*;
import java.rmi.*;
import java.util.*;

public interface TestHomeE extends EJBLocalHome
{
   	/*public TestComponentE create(String strEmpID, String strEmpName, String strEmpDOB, String strEmpAddress) 
   		throws CreateException,RemoteException;*/
   		
    public TestComponentE create() throws CreateException;
   		
   	public TestComponentE findByPrimaryKey(String key) throws FinderException;
   
    public Collection findAll() throws FinderException;
    
    public Collection findByEmpName(String sEmpName) throws FinderException;
    
    public Collection findByEmpID(String sEmpId) throws FinderException;
}
