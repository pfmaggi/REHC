#pragma once

#include "../../../../shared/generated/cpp/IWifiConfig.h"
#include "api_generator/wp8/IMethodResult.h"

namespace rhoruntime
{
    public interface class IWifiConfigImpl
    {
    public:
        void getSimpleStringProperty(IMethodResult^ oResult);
        void setSimpleStringProperty(Platform::String^ simpleStringProperty, IMethodResult^ oResult);
        void get_EAP_Identity(Platform::String^ a, IMethodResult^ oResult);
        void getProperty(Platform::String^ propertyName, IMethodResult^ oResult);
        void getProperties(Windows::Foundation::Collections::IVectorView<Platform::String^>^ arrayofNames, IMethodResult^ oResult);
        void getAllProperties(IMethodResult^ oResult);
        void setProperty(Platform::String^ propertyName, Platform::String^ propertyValue, IMethodResult^ oResult);
        void setProperties(Windows::Foundation::Collections::IMapView<Platform::String^, Platform::String^>^ propertyMap, IMethodResult^ oResult);
    };

    public interface class IWifiConfigSingletonImpl
    {
    public:
        void enumerate(IMethodResult^ oResult);
    };
    public interface class IWifiConfigFactoryImpl
    {
    public:
        IWifiConfigImpl^ getImpl();
        IWifiConfigSingletonImpl^ getSingletonImpl();
    };

    public ref class WifiConfigRuntimeComponent sealed: public IWifiConfigImpl
    {
    public:
        WifiConfigRuntimeComponent(IWifiConfigImpl^ impl);
        virtual void getSimpleStringProperty(IMethodResult^ oResult);
        virtual void setSimpleStringProperty(Platform::String^ simpleStringProperty, IMethodResult^ oResult);
        virtual void get_EAP_Identity(Platform::String^ a, IMethodResult^ oResult);
        virtual void getProperty(Platform::String^ propertyName, IMethodResult^ oResult);
        virtual void getProperties(Windows::Foundation::Collections::IVectorView<Platform::String^>^ arrayofNames, IMethodResult^ oResult);
        virtual void getAllProperties(IMethodResult^ oResult);
        virtual void setProperty(Platform::String^ propertyName, Platform::String^ propertyValue, IMethodResult^ oResult);
        virtual void setProperties(Windows::Foundation::Collections::IMapView<Platform::String^, Platform::String^>^ propertyMap, IMethodResult^ oResult);
    private:
        IWifiConfigImpl^ _impl;
    };

    public ref class WifiConfigSingletonComponent sealed: public IWifiConfigSingletonImpl
    {
    public:
        WifiConfigSingletonComponent(IWifiConfigSingletonImpl^ impl);
        virtual void enumerate(IMethodResult^ oResult);
    private:
        IWifiConfigSingletonImpl^ _impl;
    };

    public ref class WifiConfigFactoryComponent sealed
    {
    public:
        static void setImpl(IWifiConfigFactoryImpl^ impl);
    };
}
