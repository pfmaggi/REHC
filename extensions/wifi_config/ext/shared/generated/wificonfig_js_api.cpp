#include "api_generator/js_helpers.h"

#include "logging/RhoLog.h"
#undef DEFAULT_LOGCATEGORY
#define DEFAULT_LOGCATEGORY "WifiConfig"


rho::String js_WifiConfig_getSimpleStringProperty(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);
rho::String js_s_WifiConfig_def_getSimpleStringProperty(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_WifiConfig_setSimpleStringProperty(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);
rho::String js_s_WifiConfig_def_setSimpleStringProperty(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_s_WifiConfig_enumerate(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_WifiConfig_get_EAP_Identity(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);
rho::String js_s_WifiConfig_def_get_EAP_Identity(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_WifiConfig_getProperty(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);
rho::String js_s_WifiConfig_def_getProperty(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_WifiConfig_getProperties(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);
rho::String js_s_WifiConfig_def_getProperties(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_WifiConfig_getAllProperties(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);
rho::String js_s_WifiConfig_def_getAllProperties(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_WifiConfig_setProperty(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);
rho::String js_s_WifiConfig_def_setProperty(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_WifiConfig_setProperties(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);
rho::String js_s_WifiConfig_def_setProperties(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);



rho::String js_s_WifiConfig_getDefaultID(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);
rho::String js_s_WifiConfig_getDefault(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);
rho::String js_s_WifiConfig_setDefaultID(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);



extern "C" void Init_JSAPI_WifiConfig(void)
{

    rho::apiGenerator::js_define_instance_method("Rho:WifiConfig:simpleStringProperty", js_WifiConfig_getSimpleStringProperty);
    //  should define static method !     rho::apiGenerator::js_define_static_method("Rho:WifiConfig:def_simpleStringProperty", js_s_WifiConfig_def_getSimpleStringProperty);;

    rho::apiGenerator::js_define_instance_method("Rho:WifiConfig:simpleStringProperty=", js_WifiConfig_setSimpleStringProperty);
    //  should define static method !     rho::apiGenerator::js_define_static_method("Rho:WifiConfig:def_simpleStringProperty=", js_s_WifiConfig_def_setSimpleStringProperty);;

    rho::apiGenerator::js_define_static_method("Rho:WifiConfig:enumerate", js_s_WifiConfig_enumerate);

    rho::apiGenerator::js_define_instance_method("Rho:WifiConfig:get_EAP_Identity", js_WifiConfig_get_EAP_Identity);
    //  should define static method !     rho::apiGenerator::js_define_static_method("Rho:WifiConfig:def_get_EAP_Identity", js_s_WifiConfig_def_get_EAP_Identity);;

    rho::apiGenerator::js_define_instance_method("Rho:WifiConfig:getProperty", js_WifiConfig_getProperty);
    //  should define static method !     rho::apiGenerator::js_define_static_method("Rho:WifiConfig:def_getProperty", js_s_WifiConfig_def_getProperty);;

    rho::apiGenerator::js_define_instance_method("Rho:WifiConfig:getProperties", js_WifiConfig_getProperties);
    //  should define static method !     rho::apiGenerator::js_define_static_method("Rho:WifiConfig:def_getProperties", js_s_WifiConfig_def_getProperties);;

    rho::apiGenerator::js_define_instance_method("Rho:WifiConfig:getAllProperties", js_WifiConfig_getAllProperties);
    //  should define static method !     rho::apiGenerator::js_define_static_method("Rho:WifiConfig:def_getAllProperties", js_s_WifiConfig_def_getAllProperties);;

    rho::apiGenerator::js_define_instance_method("Rho:WifiConfig:setProperty", js_WifiConfig_setProperty);
    //  should define static method !     rho::apiGenerator::js_define_static_method("Rho:WifiConfig:def_setProperty", js_s_WifiConfig_def_setProperty);;

    rho::apiGenerator::js_define_instance_method("Rho:WifiConfig:setProperties", js_WifiConfig_setProperties);
    //  should define static method !     rho::apiGenerator::js_define_static_method("Rho:WifiConfig:def_setProperties", js_s_WifiConfig_def_setProperties);;


    rho::apiGenerator::js_define_static_method("Rho:WifiConfig:getDefaultID", js_s_WifiConfig_getDefaultID);
    rho::apiGenerator::js_define_static_method("Rho:WifiConfig:getDefault", js_s_WifiConfig_getDefault);
    rho::apiGenerator::js_define_static_method("Rho:WifiConfig:setDefaultID", js_s_WifiConfig_setDefaultID);

}

