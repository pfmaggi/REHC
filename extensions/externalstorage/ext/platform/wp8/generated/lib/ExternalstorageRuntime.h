#pragma once

#include "../../../../shared/generated/cpp/IExternalstorage.h"
#include "api_generator/wp8/IMethodResult.h"

namespace rhoruntime
{
    public interface class IExternalstorageImpl
    {
    };

    public interface class IExternalstorageSingletonImpl
    {
    public:
        void getSDPath(IMethodResult^ oResult);
    };
    public interface class IExternalstorageFactoryImpl
    {
    public:
        IExternalstorageImpl^ getImpl();
        IExternalstorageSingletonImpl^ getSingletonImpl();
    };

    public ref class ExternalstorageRuntimeComponent sealed: public IExternalstorageImpl
    {
    public:
        ExternalstorageRuntimeComponent(IExternalstorageImpl^ impl);
    private:
        IExternalstorageImpl^ _impl;
    };

    public ref class ExternalstorageSingletonComponent sealed: public IExternalstorageSingletonImpl
    {
    public:
        ExternalstorageSingletonComponent(IExternalstorageSingletonImpl^ impl);
        virtual void getSDPath(IMethodResult^ oResult);
    private:
        IExternalstorageSingletonImpl^ _impl;
    };

    public ref class ExternalstorageFactoryComponent sealed
    {
    public:
        static void setImpl(IExternalstorageFactoryImpl^ impl);
    };
}
