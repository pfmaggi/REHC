#include "api_generator/js_helpers.h"

#include "logging/RhoLog.h"
#undef DEFAULT_LOGCATEGORY
#define DEFAULT_LOGCATEGORY "Externalstorage"


rho::String js_s_Externalstorage_getSDPath(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);





extern "C" void Init_JSAPI_Externalstorage(void)
{

    rho::apiGenerator::js_define_static_method("Rho:Externalstorage:getSDPath", js_s_Externalstorage_getSDPath);


}

