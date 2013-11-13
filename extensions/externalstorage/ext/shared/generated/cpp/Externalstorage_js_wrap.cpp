

#include "ExternalstorageBase.h"
#include "api_generator/js_helpers.h"

#include "logging/RhoLog.h"
#undef DEFAULT_LOGCATEGORY
#define DEFAULT_LOGCATEGORY "Externalstorage"

#include "common/StringConverter.h"

extern "C" void rho_wm_impl_performOnUiThread(rho::common::IRhoRunnable* pTask);

using namespace rho;
using namespace rho::json;
using namespace rho::common;
using namespace rho::apiGenerator;


rho::String js_s_Externalstorage_getSDPath(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE3("getSDPath(strObjID = %s, strCallbackID = %s, strJsVmID = %s)", strObjID.c_str(), strCallbackID.c_str(), strJsVmID.c_str());

    rho::apiGenerator::CMethodResult oRes;


    oRes.setRequestedType(CMethodResult::eString);

    rho::common::CInstanceClassFunctorBase<rho::apiGenerator::CMethodResult>* pFunctor = 0;
    int argc = argv.getSize();







    if ( oRes.hasCallback() )
    {
        pFunctor = rho_makeInstanceClassFunctor1( rho::CExternalstorageFactoryBase::getExternalstorageSingletonS(), &rho::IExternalstorageSingleton::getSDPath,  oRes );
        rho::CExternalstorageFactoryBase::getExternalstorageSingletonS()->addCommandToQueue( pFunctor );
    }
    else 
    {

        rho::CExternalstorageFactoryBase::getExternalstorageSingletonS()->getSDPath(  oRes );
    }

    return oRes.toJSON();

}



