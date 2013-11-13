#include "common/RhodesApp.h"
#include "../../wp8/rhoruntime/common/RhoConvertWP8.h"
//#include "../../../../shared/generated/cpp/ExternalstorageBase.h"
#include "ExternalstorageFactory.h"
#include "api_generator/wp8/MethodResultImpl.h"

using namespace rho::apiGenerator;
using namespace rhoruntime;

namespace rho {

class CExternalstorageImpl: public CExternalstorageBase
{
private:
    IExternalstorageImpl^ _runtime;
public:
    CExternalstorageImpl(const rho::String& strID, IExternalstorageImpl^ runtime): CExternalstorageBase(), _runtime(runtime) {}
};

class CExternalstorageSingleton: public CExternalstorageSingletonBase
{
private:
    IExternalstorageSingletonImpl^ _runtime;
public:
    CExternalstorageSingleton(IExternalstorageSingletonImpl^ runtime): CExternalstorageSingletonBase(), _runtime(runtime) {}
    ~CExternalstorageSingleton(){}

    virtual void getSDPath(CMethodResult& oResult)
    {
        try {
            _runtime->getSDPath(ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void addCommandToQueue(rho::common::CInstanceClassFunctorBase<rho::apiGenerator::CMethodResult>* pFunctor){} // TODO: implement addCommandToQueue
    virtual void callCommandInThread(rho::common::IRhoRunnable* pFunctor){} // TODO: implement callCommandInThread
};

IExternalstorageFactoryImpl^ CExternalstorageFactory::_impl;

IExternalstorage* CExternalstorageFactory::createModuleByID(const rho::String& strID)
{
    return new CExternalstorageImpl(strID, _impl->getImpl());
}

IExternalstorageSingleton* CExternalstorageFactory::createModuleSingleton()
{
    return new CExternalstorageSingleton(_impl->getSingletonImpl());
}

}

extern "C" void Init_Externalstorage_extension()
{
    rho::CExternalstorageFactory::setInstance( new rho::CExternalstorageFactory() );
    rho::Init_Externalstorage_API();

    RHODESAPP().getExtManager().requireRubyFile("RhoExternalstorageApi");
}
