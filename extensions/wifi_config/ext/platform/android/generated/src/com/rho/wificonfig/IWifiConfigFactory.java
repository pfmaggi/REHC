package com.rho.wificonfig;

import com.rhomobile.rhodes.api.IRhoApiFactory;
import com.rhomobile.rhodes.api.IRhoApiSingletonFactory;

public interface IWifiConfigFactory
    extends IRhoApiFactory<IWifiConfig>,
            IRhoApiSingletonFactory<IWifiConfigSingleton> {

    @Override
    IWifiConfigSingleton getApiSingleton();

    @Override
    IWifiConfig getApiObject(String id);

}
