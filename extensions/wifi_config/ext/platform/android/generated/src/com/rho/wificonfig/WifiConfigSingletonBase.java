package com.rho.wificonfig;

import java.util.List;
import java.util.Map;

import com.rhomobile.rhodes.api.IMethodResult;

import com.rhomobile.rhodes.api.RhoApiDefaultId;

public abstract class WifiConfigSingletonBase 
    extends RhoApiDefaultId<IWifiConfig, IWifiConfigFactory>  {

    public WifiConfigSingletonBase(IWifiConfigFactory factory) {
        super(factory);
    } 

    public static class enumerateTask implements Runnable {
        private IWifiConfigSingleton mApiSingleton; 
        private IMethodResult mResult;

        public enumerateTask(IWifiConfigSingleton obj,         
                IMethodResult result) {
            this.mApiSingleton = obj;         
            this.mResult = result;
        }

        @Override
        public void run() {
            mApiSingleton.enumerate( mResult);
        }
    }

    
}
