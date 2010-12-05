package global.ejb;

import javax.ejb.*;
import java.rmi.*;

public interface TestHome extends EJBHome
{
   public Test create() throws CreateException,RemoteException;
}
