#include "rhodes.h"
#include "Externalstorage.h"

#include "logging/RhoLog.h"
#undef DEFAULT_LOGCATEGORY
#define DEFAULT_LOGCATEGORY "Externalstorage_impl"

#define EXTERNALSTORAGE_FACTORY_CLASS "com.rho.externalstorage.ExternalstorageFactory"

extern "C" void Init_Externalstorage_API(void);

extern "C" void Init_Externalstorage(void)
{
    RAWTRACE(__FUNCTION__);

    JNIEnv *env = jnienv();
    if(env)
    {
        jclass cls = rho_find_class(env, EXTERNALSTORAGE_FACTORY_CLASS);
        if(!cls)
        {
            RAWLOG_ERROR1("Failed to find java class: %s", EXTERNALSTORAGE_FACTORY_CLASS);
            return;
        }
        jmethodID midFactory = env->GetMethodID(cls, "<init>", "()V");
        if(!midFactory)
        {
            RAWLOG_ERROR1("Failed to get constructor for java class %s", EXTERNALSTORAGE_FACTORY_CLASS);
            return;
        }
        jobject jFactory = env->NewObject(cls, midFactory);
        if(env->IsSameObject(jFactory, NULL))
        {
            RAWLOG_ERROR1("Failed to create %s instance", EXTERNALSTORAGE_FACTORY_CLASS);
            return;
        }
        
        RAWTRACE("Initializing Java factory");

        rho::CExternalstorageBase::setJavaFactory(env, jFactory);

        RAWTRACE("Deleting JNI reference");

        env->DeleteLocalRef(jFactory);

        RAWTRACE("Initializing API");

        Init_Externalstorage_API();

        RAWTRACE("Init_Externalstorage succeeded");
    }
    else
    {
        RAWLOG_ERROR("Failed to initialize Externalstorage API: jnienv() is failed");
    }

}

extern "C" void Init_Externalstorage_extension() {
    Init_Externalstorage();
}
