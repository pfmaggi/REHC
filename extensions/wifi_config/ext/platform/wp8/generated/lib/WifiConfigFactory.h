#pragma once

#include "../../../../shared/generated/cpp/WifiConfigBase.h"
#include "WifiConfigRuntime.h"


namespace rho {
class CWifiConfigFactory: public CWifiConfigFactoryBase
{
private:
    static rhoruntime::IWifiConfigFactoryImpl^ _impl;
public:
    static void setImpl(rhoruntime::IWifiConfigFactoryImpl^ impl) { _impl = impl; }
    ~CWifiConfigFactory(){}
    virtual IWifiConfigSingleton* createModuleSingleton();
    virtual IWifiConfig* createModuleByID(const rho::String& strID);
};

}
