package com.rho.externalstorage;

import java.util.List;
import java.util.Map;

import com.rhomobile.rhodes.api.IMethodResult;

public abstract class ExternalstorageSingletonBase  {


    public static class getSDPathTask implements Runnable {
        private IExternalstorageSingleton mApiSingleton; 
        private IMethodResult mResult;

        public getSDPathTask(IExternalstorageSingleton obj,         
                IMethodResult result) {
            this.mApiSingleton = obj;         
            this.mResult = result;
        }

        @Override
        public void run() {
            mApiSingleton.getSDPath( mResult);
        }
    }

    
}
