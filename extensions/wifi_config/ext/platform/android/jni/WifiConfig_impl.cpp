#include "rhodes.h"
#include "WifiConfig.h"

#include "logging/RhoLog.h"
#undef DEFAULT_LOGCATEGORY
#define DEFAULT_LOGCATEGORY "WifiConfig_impl"

#define WIFICONFIG_FACTORY_CLASS "com.rho.wificonfig.WifiConfigFactory"

extern "C" void Init_WifiConfig_API(void);

extern "C" void Init_WifiConfig(void)
{
    RAWTRACE(__FUNCTION__);

    JNIEnv *env = jnienv();
    if(env)
    {
        jclass cls = rho_find_class(env, WIFICONFIG_FACTORY_CLASS);
        if(!cls)
        {
            RAWLOG_ERROR1("Failed to find java class: %s", WIFICONFIG_FACTORY_CLASS);
            return;
        }
        jmethodID midFactory = env->GetMethodID(cls, "<init>", "()V");
        if(!midFactory)
        {
            RAWLOG_ERROR1("Failed to get constructor for java class %s", WIFICONFIG_FACTORY_CLASS);
            return;
        }
        jobject jFactory = env->NewObject(cls, midFactory);
        if(env->IsSameObject(jFactory, NULL))
        {
            RAWLOG_ERROR1("Failed to create %s instance", WIFICONFIG_FACTORY_CLASS);
            return;
        }
        
        RAWTRACE("Initializing Java factory");

        rho::CWifiConfigBase::setJavaFactory(env, jFactory);

        RAWTRACE("Deleting JNI reference");

        env->DeleteLocalRef(jFactory);

        RAWTRACE("Initializing API");

        Init_WifiConfig_API();

        RAWTRACE("Init_WifiConfig succeeded");
    }
    else
    {
        RAWLOG_ERROR("Failed to initialize WifiConfig API: jnienv() is failed");
    }

}

extern "C" void Init_WifiConfig_extension() {
    Init_WifiConfig();
}
