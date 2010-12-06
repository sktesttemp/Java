package global.ejb;

import javax.ejb.*;
import java.rmi.*;
import java.lang.*;

public interface TestLocalComponent extends EJBLocalObject
{   
   public String displayHello();
}