#include "../../../shared/generated/cpp/ExternalstorageBase.h"

namespace rho {

using namespace apiGenerator;

class CExternalstorageImpl: public CExternalstorageBase
{
public:
    CExternalstorageImpl(const rho::String& strID): CExternalstorageBase()
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

class CExternalstorageSingleton: public CExternalstorageSingletonBase
{
    ~CExternalstorageSingleton(){}
    virtual rho::String getInitialDefaultID();
    virtual void enumerate(CMethodResult& oResult);
};

class CExternalstorageFactory: public CExternalstorageFactoryBase
{
    ~CExternalstorageFactory(){}
    virtual IExternalstorageSingleton* createModuleSingleton();
    virtual IExternalstorage* createModuleByID(const rho::String& strID);
};

extern "C" void Init_Externalstorage_extension()
{
    CExternalstorageFactory::setInstance( new CExternalstorageFactory() );
    Init_Externalstorage_API();
}

IExternalstorage* CExternalstorageFactory::createModuleByID(const rho::String& strID)
{
    return new CExternalstorageImpl(strID);
}

IExternalstorageSingleton* CExternalstorageFactory::createModuleSingleton()
{
    return new CExternalstorageSingleton();
}

void CExternalstorageSingleton::enumerate(CMethodResult& oResult)
{
    rho::Vector<rho::String> arIDs;
    arIDs.addElement("SC1");
    arIDs.addElement("SC2");

    oResult.set(arIDs);
}

rho::String CExternalstorageSingleton::getInitialDefaultID()
{
    CMethodResult oRes;
    enumerate(oRes);

    rho::Vector<rho::String>& arIDs = oRes.getStringArray();
        
    return arIDs[0];
}

}