#include "common/app_build_capabilities.h"

extern "C" void Init_RubyAPI_Externalstorage();
extern "C" void Init_JSAPI_Externalstorage();

extern "C" int  rho_ruby_is_started();

extern "C" void Init_Externalstorage_API()
{
    if (rho_ruby_is_started())
    {
    	Init_RubyAPI_Externalstorage();
    }

#ifndef RHO_NO_JS_API
    Init_JSAPI_Externalstorage();
#endif
}
