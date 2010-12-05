package global.ejb;

import javax.ejb.*;
import java.rmi.*;
import java.lang.*;

public interface TestComponent extends EJBObject
{   
   public String displayHello() throws RemoteException;
}