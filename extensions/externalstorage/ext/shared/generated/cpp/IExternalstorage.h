#pragma once

#include "common/RhoStd.h"
#include "api_generator/MethodResult.h"
#include "api_generator/BaseClasses.h"


namespace rho {
///////////////////////////////////////////////////////////
struct IExternalstorage
{
//constants


//methods
    virtual ~IExternalstorage(){}


};

struct IExternalstorageSingleton
{
//constants


    virtual ~IExternalstorageSingleton(){}

//methods
    virtual void getSDPath(rho::apiGenerator::CMethodResult& oResult) = 0;


    virtual void addCommandToQueue(rho::common::CInstanceClassFunctorBase<rho::apiGenerator::CMethodResult>* pFunctor) = 0;
    virtual void callCommandInThread(rho::common::IRhoRunnable* pFunctor) = 0;
};

struct IExternalstorageFactory
{
    virtual ~IExternalstorageFactory(){}

    virtual IExternalstorageSingleton* getModuleSingleton() = 0;


};


}
