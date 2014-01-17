#include "../../../shared/generated/cpp/WifiConfigBase.h"

namespace rho {

using namespace apiGenerator;

class CWifiConfigImpl: public CWifiConfigBase
{
public:
    CWifiConfigImpl(const rho::String& strID): CWifiConfigBase()
    {
    }

    virtual void getPlatformName(rho::apiGenerator::CMethodResult& oResult) {
         oResult.set("WM");
    }

    virtual void calcSumm( int a,  int b, rho::apiGenerator::CMethodResult& oResult) {
         oResult.set(a+b);
    }
    
    virtual void joinStrings( const rho::String& a,  const rho::String& b, rho::apiGenerator::CMethodResult& oResult) {
         oResult.set(a+b);
    }

};

class CWifiConfigSingleton: public CWifiConfigSingletonBase
{
    ~CWifiConfigSingleton(){}
    virtual rho::String getInitialDefaultID();
    virtual void enumerate(CMethodResult& oResult);
};

class CWifiConfigFactory: public CWifiConfigFactoryBase
{
    ~CWifiConfigFactory(){}
    virtual IWifiConfigSingleton* createModuleSingleton();
    virtual IWifiConfig* createModuleByID(const rho::String& strID);
};

extern "C" void Init_WifiConfig_extension()
{
    CWifiConfigFactory::setInstance( new CWifiConfigFactory() );
    Init_WifiConfig_API();
}

IWifiConfig* CWifiConfigFactory::createModuleByID(const rho::String& strID)
{
    return new CWifiConfigImpl(strID);
}

IWifiConfigSingleton* CWifiConfigFactory::createModuleSingleton()
{
    return new CWifiConfigSingleton();
}

void CWifiConfigSingleton::enumerate(CMethodResult& oResult)
{
    rho::Vector<rho::String> arIDs;
    arIDs.addElement("SC1");
    arIDs.addElement("SC2");

    oResult.set(arIDs);
}

rho::String CWifiConfigSingleton::getInitialDefaultID()
{
    CMethodResult oRes;
    enumerate(oRes);

    rho::Vector<rho::String>& arIDs = oRes.getStringArray();
        
    return arIDs[0];
}

}