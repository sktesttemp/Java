package global.ejb;

import java.rmi.RemoteException;
import javax.ejb.CreateException;
import javax.ejb.EJBException;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;

public class TestSessionBean implements SessionBean
{
  public void ejbCreate() throws CreateException 
  {
  }

  public void setSessionContext( SessionContext oContext ) throws EJBException 
  {
  }

  public void ejbActivate() throws EJBException 
  {
  }

  public void ejbPassivate() throws EJBException 
  {
  }

  public void ejbRemove() throws EJBException 
  {
  }
  
  public String displayHello()
  {
	  String msg = "";
	  msg="Hello! It is my first Session Bean and now I have modified the message and tested it Twice! HA HA HA...";
      System.out.println("Printing on the server's console: "+msg);      
      return msg;
  }
}
