#include "../../../shared/generated/cpp/ExternalstorageBase.h"

namespace rho {

using namespace apiGenerator;

class CExternalstorageImpl: public CExternalstorageBase
{
public:
    CExternalstorageImpl(const rho::String& strID): CExternalstorageBase()
    {
    }

    virtual void enable( const rho::Hashtable<rho::String, rho::String>& propertyMap, CMethodResult& oResult){}
    virtual void start(CMethodResult& oResult){}
    virtual void stop(CMethodResult& oResult){}
    virtual void disable(CMethodResult& oResult){}
    virtual void take( const rho::Hashtable<rho::String, rho::String>& propertyMap, CMethodResult& oResult){}

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