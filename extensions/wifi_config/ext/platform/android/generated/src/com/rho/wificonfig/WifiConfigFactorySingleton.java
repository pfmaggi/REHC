package com.rho.wificonfig;

public class WifiConfigFactorySingleton {
    private static IWifiConfigFactory mFactory;
    public static void setInstance(IWifiConfigFactory factory) {
        mFactory = factory;
    }
    public static IWifiConfigFactory getInstance() {
        return mFactory;
    }
}
