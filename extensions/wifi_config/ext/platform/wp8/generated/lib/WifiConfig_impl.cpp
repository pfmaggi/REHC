#include "common/RhodesApp.h"
#include "../../wp8/rhoruntime/common/RhoConvertWP8.h"
//#include "../../../../shared/generated/cpp/WifiConfigBase.h"
#include "WifiConfigFactory.h"
#include "api_generator/wp8/MethodResultImpl.h"

using namespace rho::apiGenerator;
using namespace rhoruntime;

namespace rho {

class CWifiConfigImpl: public CWifiConfigBase
{
private:
    IWifiConfigImpl^ _runtime;
public:
    CWifiConfigImpl(const rho::String& strID, IWifiConfigImpl^ runtime): CWifiConfigBase(), _runtime(runtime) {}

    virtual void getSimpleStringProperty(CMethodResult& oResult)
    {
        try {
            _runtime->getSimpleStringProperty(ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void setSimpleStringProperty(const rho::String& simpleStringProperty, CMethodResult& oResult)
    {
        Platform::String^ _simpleStringProperty = rho::common::convertStringToWP8(simpleStringProperty);
        try {
            _runtime->setSimpleStringProperty(_simpleStringProperty, ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void get_EAP_Identity(const rho::String& a, CMethodResult& oResult)
    {
        Platform::String^ _a = rho::common::convertStringToWP8(a);
        try {
            _runtime->get_EAP_Identity(_a, ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void getProperty(const rho::String& propertyName, CMethodResult& oResult)
    {
        Platform::String^ _propertyName = rho::common::convertStringToWP8(propertyName);
        try {
            _runtime->getProperty(_propertyName, ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void getProperties(const rho::Vector<rho::String>& arrayofNames, CMethodResult& oResult)
    {
        Windows::Foundation::Collections::IVectorView<Platform::String^>^ _arrayofNames = rho::common::convertArrayToWP8(arrayofNames);
        try {
            _runtime->getProperties(_arrayofNames, ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void getAllProperties(CMethodResult& oResult)
    {
        try {
            _runtime->getAllProperties(ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void setProperty(const rho::String& propertyName, const rho::String& propertyValue, CMethodResult& oResult)
    {
        Platform::String^ _propertyName = rho::common::convertStringToWP8(propertyName);
        Platform::String^ _propertyValue = rho::common::convertStringToWP8(propertyValue);
        try {
            _runtime->setProperty(_propertyName, _propertyValue, ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void setProperties(const rho::Hashtable<rho::String, rho::String>& propertyMap, CMethodResult& oResult)
    {
        Windows::Foundation::Collections::IMapView<Platform::String^, Platform::String^>^ _propertyMap = rho::common::convertHashToWP8(propertyMap);
        try {
            _runtime->setProperties(_propertyMap, ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }
};

class CWifiConfigSingleton: public CWifiConfigSingletonBase
{
private:
    IWifiConfigSingletonImpl^ _runtime;
public:
    CWifiConfigSingleton(IWifiConfigSingletonImpl^ runtime): CWifiConfigSingletonBase(), _runtime(runtime) {}
    ~CWifiConfigSingleton(){}

    virtual void enumerate(CMethodResult& oResult)
    {
        try {
            _runtime->enumerate(ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }


    virtual rho::String getDefaultID(){return "1";} // TODO: implement getDefaultID
    virtual rho::String getInitialDefaultID(){return "1";} // TODO: implement getInitialDefaultID
    virtual void setDefaultID(const rho::String& strID){} // TODO: implement setDefaultID
    virtual void addCommandToQueue(rho::common::CInstanceClassFunctorBase<rho::apiGenerator::CMethodResult>* pFunctor){} // TODO: implement addCommandToQueue
    virtual void callCommandInThread(rho::common::IRhoRunnable* pFunctor){} // TODO: implement callCommandInThread
};

IWifiConfigFactoryImpl^ CWifiConfigFactory::_impl;

IWifiConfig* CWifiConfigFactory::createModuleByID(const rho::String& strID)
{
    return new CWifiConfigImpl(strID, _impl->getImpl());
}

IWifiConfigSingleton* CWifiConfigFactory::createModuleSingleton()
{
    return new CWifiConfigSingleton(_impl->getSingletonImpl());
}

}

extern "C" void Init_WifiConfig_extension()
{
    rho::CWifiConfigFactory::setInstance( new rho::CWifiConfigFactory() );
    rho::Init_WifiConfig_API();

    RHODESAPP().getExtManager().requireRubyFile("RhoWifiConfigApi");
}
