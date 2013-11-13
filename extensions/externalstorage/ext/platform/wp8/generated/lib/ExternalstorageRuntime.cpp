// ExternalstorageRuntime.cpp
#include "ExternalstorageRuntime.h"
#include "ExternalstorageFactory.h"

using namespace Platform;
using namespace rho::apiGenerator;

using namespace rho;

namespace rhoruntime
{

ExternalstorageRuntimeComponent::ExternalstorageRuntimeComponent(IExternalstorageImpl^ impl):
    _impl(impl)
{
    // TODO: implement runtime component constructor
}

ExternalstorageSingletonComponent::ExternalstorageSingletonComponent(IExternalstorageSingletonImpl^ impl):
    _impl(impl)
{
    // TODO: implement singleton component constructor
}

void ExternalstorageSingletonComponent::getSDPath(IMethodResult^ oResult)
{
    _impl->getSDPath(oResult);
}

void ExternalstorageFactoryComponent::setImpl(IExternalstorageFactoryImpl^ impl)
{
    CExternalstorageFactory::setImpl(impl);
}

}