// WifiConfigRuntime.cpp
#include "WifiConfigRuntime.h"
#include "WifiConfigFactory.h"

using namespace Platform;
using namespace rho::apiGenerator;

using namespace rho;

namespace rhoruntime
{

WifiConfigRuntimeComponent::WifiConfigRuntimeComponent(IWifiConfigImpl^ impl):
    _impl(impl)
{
    // TODO: implement runtime component constructor
}

WifiConfigSingletonComponent::WifiConfigSingletonComponent(IWifiConfigSingletonImpl^ impl):
    _impl(impl)
{
    // TODO: implement singleton component constructor
}

void WifiConfigRuntimeComponent::getSimpleStringProperty(IMethodResult^ oResult)
{
    _impl->getSimpleStringProperty(oResult);
}

void WifiConfigRuntimeComponent::setSimpleStringProperty(Platform::String^ simpleStringProperty, IMethodResult^ oResult)
{
    _impl->setSimpleStringProperty(simpleStringProperty, oResult);
}

void WifiConfigSingletonComponent::enumerate(IMethodResult^ oResult)
{
    _impl->enumerate(oResult);
}

void WifiConfigRuntimeComponent::get_EAP_Identity(Platform::String^ a, IMethodResult^ oResult)
{
    _impl->get_EAP_Identity(a, oResult);
}

void WifiConfigRuntimeComponent::getProperty(Platform::String^ propertyName, IMethodResult^ oResult)
{
    _impl->getProperty(propertyName, oResult);
}

void WifiConfigRuntimeComponent::getProperties(Windows::Foundation::Collections::IVectorView<Platform::String^>^ arrayofNames, IMethodResult^ oResult)
{
    _impl->getProperties(arrayofNames, oResult);
}

void WifiConfigRuntimeComponent::getAllProperties(IMethodResult^ oResult)
{
    _impl->getAllProperties(oResult);
}

void WifiConfigRuntimeComponent::setProperty(Platform::String^ propertyName, Platform::String^ propertyValue, IMethodResult^ oResult)
{
    _impl->setProperty(propertyName, propertyValue, oResult);
}

void WifiConfigRuntimeComponent::setProperties(Windows::Foundation::Collections::IMapView<Platform::String^, Platform::String^>^ propertyMap, IMethodResult^ oResult)
{
    _impl->setProperties(propertyMap, oResult);
}

void WifiConfigFactoryComponent::setImpl(IWifiConfigFactoryImpl^ impl)
{
    CWifiConfigFactory::setImpl(impl);
}

}