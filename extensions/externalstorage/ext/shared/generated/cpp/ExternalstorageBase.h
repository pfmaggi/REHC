#pragma once

#include "IExternalstorage.h"
#include "logging/RhoLog.h"
#include "common/StringConverter.h"
#include "common/ExtManager.h"


namespace rho {

using namespace rho::apiGenerator;

// hash keys used in properties and parameters 

class CExternalstorageFactoryBase : public CModuleFactoryBase<IExternalstorage, IExternalstorageSingleton, IExternalstorageFactory>
{
protected:
    static rho::common::CAutoPtr<CExternalstorageFactoryBase> m_pInstance;
    HashtablePtr<rho::String,IExternalstorage*> m_hashModules;

public:

    static void setInstance(CExternalstorageFactoryBase* pInstance){ m_pInstance = pInstance; }
    static CExternalstorageFactoryBase* getInstance(){ return m_pInstance; }

    static IExternalstorageSingleton* getExternalstorageSingletonS(){ return getInstance()->getModuleSingleton(); }

    virtual IExternalstorage* getModuleByID(const rho::String& strID)
    {
        if ( !m_hashModules.containsKey(strID) )
        {
            IExternalstorage* pObj = createModuleByID(strID);
            m_hashModules.put(strID, pObj );

            return pObj;
        }

        return m_hashModules[strID];
    }

    virtual IExternalstorage* createModuleByID(const rho::String& strID){ return (IExternalstorage*)0; };
    virtual void deleteModuleByID(const rho::String& strID)
    {
        m_hashModules.remove(strID);
    }

};

class CExternalstorageSingletonBase : public CModuleSingletonBase< IExternalstorageSingleton >, public rho::common::IRhoExtension
{
protected:
    DEFINE_LOGCLASS;





public:
    virtual rho::LogCategory getModuleLogCategory(){ return getLogCategory(); }

    CExternalstorageSingletonBase();
    ~CExternalstorageSingletonBase();




};

class CExternalstorageBase: public IExternalstorage
{
protected:
    DEFINE_LOGCLASS;


public:


    CExternalstorageBase();


 

};

extern "C" void Init_Externalstorage_API();


}
