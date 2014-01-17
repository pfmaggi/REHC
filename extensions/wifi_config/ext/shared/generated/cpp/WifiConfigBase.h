#pragma once

#include "IWifiConfig.h"
#include "logging/RhoLog.h"
#include "common/StringConverter.h"
#include "common/ExtManager.h"


namespace rho {

using namespace rho::apiGenerator;

// hash keys used in properties and parameters 

class CWifiConfigFactoryBase : public CModuleFactoryBase<IWifiConfig, IWifiConfigSingleton, IWifiConfigFactory>
{
protected:
    static rho::common::CAutoPtr<CWifiConfigFactoryBase> m_pInstance;
    HashtablePtr<rho::String,IWifiConfig*> m_hashModules;

public:

    static void setInstance(CWifiConfigFactoryBase* pInstance){ m_pInstance = pInstance; }
    static CWifiConfigFactoryBase* getInstance(){ return m_pInstance; }

    static IWifiConfigSingleton* getWifiConfigSingletonS(){ return getInstance()->getModuleSingleton(); }

    virtual IWifiConfig* getModuleByID(const rho::String& strID)
    {
        if ( !m_hashModules.containsKey(strID) )
        {
            IWifiConfig* pObj = createModuleByID(strID);
            m_hashModules.put(strID, pObj );

            return pObj;
        }

        return m_hashModules[strID];
    }

    virtual IWifiConfig* createModuleByID(const rho::String& strID){ return (IWifiConfig*)0; };
    virtual void deleteModuleByID(const rho::String& strID)
    {
        m_hashModules.remove(strID);
    }

};

class CWifiConfigSingletonBase : public CModuleSingletonBase< IWifiConfigSingleton >, public rho::common::IRhoExtension
{
protected:
    DEFINE_LOGCLASS;


    rho::String m_strDefaultID;




public:
    virtual rho::LogCategory getModuleLogCategory(){ return getLogCategory(); }

    CWifiConfigSingletonBase();
    ~CWifiConfigSingletonBase();




    virtual void setDefaultID(const rho::String& strDefaultID){ m_strDefaultID = strDefaultID; }
    virtual rho::String getDefaultID()
    { 
        if ( m_strDefaultID.length() == 0 )
            setDefaultID(getInitialDefaultID());
        return m_strDefaultID; 
    }

};

class CWifiConfigBase: public IWifiConfig
{
protected:
    DEFINE_LOGCLASS;


    rho::Hashtable<rho::String, rho::String> m_hashProps;
    rho::Hashtable<rho::String, rho::apiGenerator::CMethodAccessor< IWifiConfig > *> m_mapPropAccessors;

public:


    CWifiConfigBase();

    virtual void getProperty( const rho::String& propertyName, CMethodResult& oResult);
    virtual void getProperties( const rho::Vector<rho::String>& arrayofNames, CMethodResult& oResult);
    virtual void getAllProperties(CMethodResult& oResult);
    virtual void setProperty( const rho::String& propertyName,  const rho::String& propertyValue, CMethodResult& oResult);
    virtual void setProperties( const rho::Hashtable<rho::String, rho::String>& propertyMap, CMethodResult& oResult);
    virtual void clearAllProperties(CMethodResult& oResult);


    virtual void getSimpleStringProperty(rho::apiGenerator::CMethodResult& oResult);

    virtual void setSimpleStringProperty( const rho::String& simpleStringProperty, rho::apiGenerator::CMethodResult& oResult);


    static CWifiConfigBase* getInstance(){ return static_cast< CWifiConfigBase* >(CWifiConfigFactoryBase::getInstance()->getModuleByID(CWifiConfigFactoryBase::getWifiConfigSingletonS()->getDefaultID())); }
 

};

extern "C" void Init_WifiConfig_API();


}
