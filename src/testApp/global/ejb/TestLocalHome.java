package global.ejb;

import javax.ejb.*;
import java.rmi.*;

public interface TestLocalHome extends EJBLocalHome
{
   public TestLocalComponent create() throws CreateException;
}
