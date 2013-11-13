#include "Externalstorage.h"


namespace rho {

IMPLEMENT_LOGCLASS(CExternalstorageBase, "ExternalstorageJNI");

//ExternalstorageFactorySingleton staff
const char* const CExternalstorageBase::FACTORY_SINGLETON_CLASS = "com.rho.externalstorage.ExternalstorageFactorySingleton";
jclass CExternalstorageBase::s_clsFactorySingleton = 0;
jmethodID CExternalstorageBase::s_midFactorySetInstance;
jmethodID CExternalstorageBase::s_midFactoryGetInstance;

//ExternalstorageFactory staff
const char* const CExternalstorageBase::IFACTORY_CLASS = "com.rho.externalstorage.IExternalstorageFactory";
jclass CExternalstorageBase::s_clsIFactory = 0;
jmethodID CExternalstorageBase::s_midGetApiSingleton;
jmethodID CExternalstorageBase::s_midGetApiObject;

//ExternalstorageSingletonBase staff
const char* const CExternalstorageBase::SINGLETON_BASE_CLASS = "com.rho.externalstorage.ExternalstorageSingletonBase";
jclass CExternalstorageBase::s_clsSingletonBase = 0;

//ExternalstorageBase staff
const char* const CExternalstorageBase::OBJECT_BASE_CLASS = "com.rho.externalstorage.ExternalstorageBase";
jclass CExternalstorageBase::s_clsObjectBase = 0;



//Method tasks

const char* const CExternalstorageBase::GETSDPATH_TASK_CLASS = 
        "com.rho.externalstorage.ExternalstorageSingletonBase$getSDPathTask";

jclass CExternalstorageBase::s_clsgetSDPathTask = 0;
jmethodID CExternalstorageBase::s_midgetSDPathTask;


//----------------------------------------------------------------------------------------------------------------------

JNIEnv* CExternalstorageBase::jniInit()
{
    JNIEnv *env = jnienv();
    if(!env)
    {
        LOG(FATAL) + "JNI init failed: JNIEnv is null";
        return 0;
    }
    return jniInit(env);
}
//----------------------------------------------------------------------------------------------------------------------

JNIEnv* CExternalstorageBase::jniInit(JNIEnv* env)
{
    static bool initialized = false;
    env = MethodExecutorJni::jniInit(env);
    if (!env) {
        LOG(FATAL) + "JNI init failed";
        return 0;
    }

    if(!initialized)
    {
        //init ExternalstorageFactorySingleton JNI
        s_clsFactorySingleton = loadClass(env, FACTORY_SINGLETON_CLASS);
        if (!s_clsFactorySingleton) return 0;

        s_midFactorySetInstance = env->GetStaticMethodID(s_clsFactorySingleton, "setInstance", "(Lcom/rho/externalstorage/IExternalstorageFactory;)V");
        if(!s_midFactorySetInstance)
        {
            LOG(FATAL) + "Failed to get method 'setInstance' for java class " + FACTORY_SINGLETON_CLASS;
            return NULL;
        }
        s_midFactoryGetInstance = env->GetStaticMethodID(s_clsFactorySingleton, "getInstance", "()Lcom/rho/externalstorage/IExternalstorageFactory;");
        if(!s_midFactoryGetInstance)
        {
            LOG(FATAL) + "Failed to get method 'getInstance' for java class " + FACTORY_SINGLETON_CLASS;
            return NULL;
        }

        //init IExternalstorageFactory JNI
        s_clsIFactory = loadClass(env, IFACTORY_CLASS);
        if (!s_clsIFactory) return 0;
        s_midGetApiSingleton = env->GetMethodID(s_clsIFactory, "getApiSingleton", "()Lcom/rho/externalstorage/IExternalstorageSingleton;");
        if(!s_midGetApiSingleton)
        {
            LOG(FATAL) + "Failed to get method 'getApiSingleton' for java class " + IFACTORY_CLASS;
            return NULL;
        }
        s_midGetApiObject = env->GetMethodID(s_clsIFactory, "getApiObject", "(Ljava/lang/String;)Lcom/rho/externalstorage/IExternalstorage;");
        if(!s_midGetApiObject)
        {
            LOG(FATAL) + "Failed to get method 'getApiObject' for java class " + IFACTORY_CLASS;
            return NULL;
        }

        s_clsSingletonBase = loadClass(env, SINGLETON_BASE_CLASS);
        if (!s_clsSingletonBase) return 0;
        s_clsObjectBase = loadClass(env, OBJECT_BASE_CLASS);
        if (!s_clsObjectBase) return 0;



        s_clsgetSDPathTask = loadClass(env, GETSDPATH_TASK_CLASS);
        if (!s_clsgetSDPathTask) return 0;
        s_midgetSDPathTask = env->GetMethodID(s_clsgetSDPathTask, "<init>",
                        "(Lcom/rho/externalstorage/IExternalstorageSingleton;Lcom/rhomobile/rhodes/api/IMethodResult;)V");
        if(!s_midgetSDPathTask)
        {
            LOG(FATAL) + "Failed to get constructor for java class " + GETSDPATH_TASK_CLASS;
            return NULL;
        }



        initialized = true;
        LOG(TRACE) + "CExternalstorage JNI init succeeded";
    }
    return env;
}
//----------------------------------------------------------------------------------------------------------------------

void CExternalstorageBase::setJavaFactory(JNIEnv* env, jobject jFactory)
{
    LOG(TRACE) + "setJavaFactory";

    env = jniInit(env);
    if (!env) {
        LOG(FATAL) + "JNI initialization failed";
        return;
    }

    env->CallStaticVoidMethod(s_clsFactorySingleton, s_midFactorySetInstance, jFactory);

    LOG(TRACE) + "setJavaFactory succeeded";
}
//----------------------------------------------------------------------------------------------------------------------

jobject CExternalstorageBase::getFactory(JNIEnv* env)
{
    jobject res = env->CallStaticObjectMethod(s_clsFactorySingleton, s_midFactoryGetInstance);
    return res;
}
//----------------------------------------------------------------------------------------------------------------------

jobject CExternalstorageBase::getSingleton(JNIEnv* env)
{
    jhobject jhFactory = getFactory(env);
    jobject res = env->CallObjectMethod(jhFactory.get(), s_midGetApiSingleton);
    return res;
}
//----------------------------------------------------------------------------------------------------------------------

jobject CExternalstorageBase::getObject(JNIEnv* env)
{
    jhstring jhId = rho_cast<jstring>(env, m_id);
    jhobject jhFactory = getFactory(env);
    jobject res = env->CallObjectMethod(jhFactory.get(), s_midGetApiObject, jhId.get());
    return res;
}
//----------------------------------------------------------------------------------------------------------------------


}
