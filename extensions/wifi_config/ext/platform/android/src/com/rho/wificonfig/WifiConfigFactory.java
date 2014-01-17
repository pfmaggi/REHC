package com.rho.wificonfig;

import com.rhomobile.rhodes.api.RhoApiFactory;

public class WifiConfigFactory
        extends RhoApiFactory< WifiConfig, WifiConfigSingleton>
        implements IWifiConfigFactory {

    @Override
    protected WifiConfigSingleton createSingleton() {
        return new WifiConfigSingleton(this);
    }

    @Override
    protected WifiConfig createApiObject(String id) {
        return new WifiConfig(id);
    }
}
