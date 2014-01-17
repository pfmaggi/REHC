package com.rho.wificonfig;



import java.util.Map;
import java.util.List;

import com.rhomobile.rhodes.api.IMethodResult;

import com.rhomobile.rhodes.api.IRhoApiDefaultId;


public interface IWifiConfigSingleton
       extends IRhoApiDefaultId  {



  // hash keys used in properties and parameters



    void enumerate(IMethodResult result); 

}
