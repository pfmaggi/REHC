package com.rho.externalstorage;  
  
import com.rhomobile.rhodes.api.RhoApiFactory;  
  
public class ExternalstorageFactory  
       extends RhoApiFactory< Externalstorage, ExternalstorageSingleton>  
       implements IExternalstorageFactory {  
 
   @Override  
    protected ExternalstorageSingleton createSingleton() {  
        return new ExternalstorageSingleton();  
    }  
  
    @Override  
    protected Externalstorage createApiObject(String id) {  
        return new Externalstorage(id);  
    }  
}
