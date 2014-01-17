#include "common/app_build_capabilities.h"

extern "C" void Init_RubyAPI_WifiConfig();
extern "C" void Init_JSAPI_WifiConfig();

extern "C" int  rho_ruby_is_started();

extern "C" void Init_WifiConfig_API()
{
    if (rho_ruby_is_started())
    {
    	Init_RubyAPI_WifiConfig();
    }

#ifndef RHO_NO_JS_API
    Init_JSAPI_WifiConfig();
#endif
}
