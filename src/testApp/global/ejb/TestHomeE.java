package global.ejb;

import javax.ejb.*;
import java.rmi.*;
import java.util.*;

public interface TestHomeE extends EJBLocalHome
{
   	public TestComponentE create(String sEID, String sEName, String sEDOB, String sEAdd, String sEUName) throws CreateException, DuplicateKeyException;
   		
   	public TestComponentE findByPrimaryKey(String key) throws FinderException;
   
    public Collection findAll() throws FinderException;
    
    public Collection findByEmpName(String sEmpName) throws FinderException;
    
    public Collection findByUserName(String sEmpUserName) throws FinderException;
    
    public Collection findByEmpID(String sEmpId) throws FinderException;        
}
