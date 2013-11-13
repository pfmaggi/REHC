package com.rho.externalstorage;

import com.rhomobile.rhodes.api.IRhoApiFactory;
import com.rhomobile.rhodes.api.IRhoApiSingletonFactory;

public interface IExternalstorageFactory
    extends IRhoApiFactory<IExternalstorage>,
            IRhoApiSingletonFactory<IExternalstorageSingleton> {

    @Override
    IExternalstorageSingleton getApiSingleton();

    @Override
    IExternalstorage getApiObject(String id);

}
