#pragma once

#include "../../../../shared/generated/cpp/ExternalstorageBase.h"
#include "ExternalstorageRuntime.h"


namespace rho {
class CExternalstorageFactory: public CExternalstorageFactoryBase
{
private:
    static rhoruntime::IExternalstorageFactoryImpl^ _impl;
public:
    static void setImpl(rhoruntime::IExternalstorageFactoryImpl^ impl) { _impl = impl; }
    ~CExternalstorageFactory(){}
    virtual IExternalstorageSingleton* createModuleSingleton();
    virtual IExternalstorage* createModuleByID(const rho::String& strID);
};

}
