package com.rho.externalstorage;

public class ExternalstorageFactorySingleton {
    private static IExternalstorageFactory mFactory;
    public static void setInstance(IExternalstorageFactory factory) {
        mFactory = factory;
    }
    public static IExternalstorageFactory getInstance() {
        return mFactory;
    }
}
