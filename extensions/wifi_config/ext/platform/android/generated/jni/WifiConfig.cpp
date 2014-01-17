#include "WifiConfig.h"


namespace rho {

IMPLEMENT_LOGCLASS(CWifiConfigBase, "WifiConfigJNI");

//WifiConfigFactorySingleton staff
const char* const CWifiConfigBase::FACTORY_SINGLETON_CLASS = "com.rho.wificonfig.WifiConfigFactorySingleton";
jclass CWifiConfigBase::s_clsFactorySingleton = 0;
jmethodID CWifiConfigBase::s_midFactorySetInstance;
jmethodID CWifiConfigBase::s_midFactoryGetInstance;

//WifiConfigFactory staff
const char* const CWifiConfigBase::IFACTORY_CLASS = "com.rho.wificonfig.IWifiConfigFactory";
jclass CWifiConfigBase::s_clsIFactory = 0;
jmethodID CWifiConfigBase::s_midGetApiSingleton;
jmethodID CWifiConfigBase::s_midGetApiObject;

//WifiConfigSingletonBase staff
const char* const CWifiConfigBase::SINGLETON_BASE_CLASS = "com.rho.wificonfig.WifiConfigSingletonBase";
jclass CWifiConfigBase::s_clsSingletonBase = 0;

//WifiConfigBase staff
const char* const CWifiConfigBase::OBJECT_BASE_CLASS = "com.rho.wificonfig.WifiConfigBase";
jclass CWifiConfigBase::s_clsObjectBase = 0;


//IRhoApiDefaultId staff
const char* const CWifiConfigBase::IDEFAULTID_CLASS = "com.rhomobile.rhodes.api.IRhoApiDefaultId";
jclass CWifiConfigBase::s_clsIDefaultId = 0;
jmethodID CWifiConfigBase::s_midGetDefaultID;
jmethodID CWifiConfigBase::s_midSetDefaultID;


//Method tasks

const char* const CWifiConfigBase::GETSIMPLESTRINGPROPERTY_TASK_CLASS = 
        "com.rho.wificonfig.WifiConfigBase$getSimpleStringPropertyTask";

jclass CWifiConfigBase::s_clsgetSimpleStringPropertyTask = 0;
jmethodID CWifiConfigBase::s_midgetSimpleStringPropertyTask;

const char* const CWifiConfigBase::SETSIMPLESTRINGPROPERTY_TASK_CLASS = 
        "com.rho.wificonfig.WifiConfigBase$setSimpleStringPropertyTask";

jclass CWifiConfigBase::s_clssetSimpleStringPropertyTask = 0;
jmethodID CWifiConfigBase::s_midsetSimpleStringPropertyTask;

const char* const CWifiConfigBase::ENUMERATE_TASK_CLASS = 
        "com.rho.wificonfig.WifiConfigSingletonBase$enumerateTask";

jclass CWifiConfigBase::s_clsenumerateTask = 0;
jmethodID CWifiConfigBase::s_midenumerateTask;

const char* const CWifiConfigBase::GET_EAP_IDENTITY_TASK_CLASS = 
        "com.rho.wificonfig.WifiConfigBase$get_EAP_IdentityTask";

jclass CWifiConfigBase::s_clsget_EAP_IdentityTask = 0;
jmethodID CWifiConfigBase::s_midget_EAP_IdentityTask;

const char* const CWifiConfigBase::GETPROPERTY_TASK_CLASS = 
        "com.rho.wificonfig.WifiConfigBase$getPropertyTask";

jclass CWifiConfigBase::s_clsgetPropertyTask = 0;
jmethodID CWifiConfigBase::s_midgetPropertyTask;

const char* const CWifiConfigBase::GETPROPERTIES_TASK_CLASS = 
        "com.rho.wificonfig.WifiConfigBase$getPropertiesTask";

jclass CWifiConfigBase::s_clsgetPropertiesTask = 0;
jmethodID CWifiConfigBase::s_midgetPropertiesTask;

const char* const CWifiConfigBase::GETALLPROPERTIES_TASK_CLASS = 
        "com.rho.wificonfig.WifiConfigBase$getAllPropertiesTask";

jclass CWifiConfigBase::s_clsgetAllPropertiesTask = 0;
jmethodID CWifiConfigBase::s_midgetAllPropertiesTask;

const char* const CWifiConfigBase::SETPROPERTY_TASK_CLASS = 
        "com.rho.wificonfig.WifiConfigBase$setPropertyTask";

jclass CWifiConfigBase::s_clssetPropertyTask = 0;
jmethodID CWifiConfigBase::s_midsetPropertyTask;

const char* const CWifiConfigBase::SETPROPERTIES_TASK_CLASS = 
        "com.rho.wificonfig.WifiConfigBase$setPropertiesTask";

jclass CWifiConfigBase::s_clssetPropertiesTask = 0;
jmethodID CWifiConfigBase::s_midsetPropertiesTask;


//----------------------------------------------------------------------------------------------------------------------

JNIEnv* CWifiConfigBase::jniInit()
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

JNIEnv* CWifiConfigBase::jniInit(JNIEnv* env)
{
    static bool initialized = false;
    env = MethodExecutorJni::jniInit(env);
    if (!env) {
        LOG(FATAL) + "JNI init failed";
        return 0;
    }

    if(!initialized)
    {
        //init WifiConfigFactorySingleton JNI
        s_clsFactorySingleton = loadClass(env, FACTORY_SINGLETON_CLASS);
        if (!s_clsFactorySingleton) return 0;

        s_midFactorySetInstance = env->GetStaticMethodID(s_clsFactorySingleton, "setInstance", "(Lcom/rho/wificonfig/IWifiConfigFactory;)V");
        if(!s_midFactorySetInstance)
        {
            LOG(FATAL) + "Failed to get method 'setInstance' for java class " + FACTORY_SINGLETON_CLASS;
            return NULL;
        }
        s_midFactoryGetInstance = env->GetStaticMethodID(s_clsFactorySingleton, "getInstance", "()Lcom/rho/wificonfig/IWifiConfigFactory;");
        if(!s_midFactoryGetInstance)
        {
            LOG(FATAL) + "Failed to get method 'getInstance' for java class " + FACTORY_SINGLETON_CLASS;
            return NULL;
        }

        //init IWifiConfigFactory JNI
        s_clsIFactory = loadClass(env, IFACTORY_CLASS);
        if (!s_clsIFactory) return 0;
        s_midGetApiSingleton = env->GetMethodID(s_clsIFactory, "getApiSingleton", "()Lcom/rho/wificonfig/IWifiConfigSingleton;");
        if(!s_midGetApiSingleton)
        {
            LOG(FATAL) + "Failed to get method 'getApiSingleton' for java class " + IFACTORY_CLASS;
            return NULL;
        }
        s_midGetApiObject = env->GetMethodID(s_clsIFactory, "getApiObject", "(Ljava/lang/String;)Lcom/rho/wificonfig/IWifiConfig;");
        if(!s_midGetApiObject)
        {
            LOG(FATAL) + "Failed to get method 'getApiObject' for java class " + IFACTORY_CLASS;
            return NULL;
        }

        s_clsSingletonBase = loadClass(env, SINGLETON_BASE_CLASS);
        if (!s_clsSingletonBase) return 0;
        s_clsObjectBase = loadClass(env, OBJECT_BASE_CLASS);
        if (!s_clsObjectBase) return 0;



        s_clsgetSimpleStringPropertyTask = loadClass(env, GETSIMPLESTRINGPROPERTY_TASK_CLASS);
        if (!s_clsgetSimpleStringPropertyTask) return 0;
        s_midgetSimpleStringPropertyTask = env->GetMethodID(s_clsgetSimpleStringPropertyTask, "<init>",
                        "(Lcom/rho/wificonfig/IWifiConfig;Lcom/rhomobile/rhodes/api/IMethodResult;)V");
        if(!s_midgetSimpleStringPropertyTask)
        {
            LOG(FATAL) + "Failed to get constructor for java class " + GETSIMPLESTRINGPROPERTY_TASK_CLASS;
            return NULL;
        }

        s_clssetSimpleStringPropertyTask = loadClass(env, SETSIMPLESTRINGPROPERTY_TASK_CLASS);
        if (!s_clssetSimpleStringPropertyTask) return 0;
        s_midsetSimpleStringPropertyTask = env->GetMethodID(s_clssetSimpleStringPropertyTask, "<init>",
                        "(Lcom/rho/wificonfig/IWifiConfig;Ljava/lang/String;Lcom/rhomobile/rhodes/api/IMethodResult;)V");
        if(!s_midsetSimpleStringPropertyTask)
        {
            LOG(FATAL) + "Failed to get constructor for java class " + SETSIMPLESTRINGPROPERTY_TASK_CLASS;
            return NULL;
        }

        s_clsenumerateTask = loadClass(env, ENUMERATE_TASK_CLASS);
        if (!s_clsenumerateTask) return 0;
        s_midenumerateTask = env->GetMethodID(s_clsenumerateTask, "<init>",
                        "(Lcom/rho/wificonfig/IWifiConfigSingleton;Lcom/rhomobile/rhodes/api/IMethodResult;)V");
        if(!s_midenumerateTask)
        {
            LOG(FATAL) + "Failed to get constructor for java class " + ENUMERATE_TASK_CLASS;
            return NULL;
        }

        s_clsget_EAP_IdentityTask = loadClass(env, GET_EAP_IDENTITY_TASK_CLASS);
        if (!s_clsget_EAP_IdentityTask) return 0;
        s_midget_EAP_IdentityTask = env->GetMethodID(s_clsget_EAP_IdentityTask, "<init>",
                        "(Lcom/rho/wificonfig/IWifiConfig;Ljava/lang/String;Lcom/rhomobile/rhodes/api/IMethodResult;)V");
        if(!s_midget_EAP_IdentityTask)
        {
            LOG(FATAL) + "Failed to get constructor for java class " + GET_EAP_IDENTITY_TASK_CLASS;
            return NULL;
        }

        s_clsgetPropertyTask = loadClass(env, GETPROPERTY_TASK_CLASS);
        if (!s_clsgetPropertyTask) return 0;
        s_midgetPropertyTask = env->GetMethodID(s_clsgetPropertyTask, "<init>",
                        "(Lcom/rho/wificonfig/IWifiConfig;Ljava/lang/String;Lcom/rhomobile/rhodes/api/IMethodResult;)V");
        if(!s_midgetPropertyTask)
        {
            LOG(FATAL) + "Failed to get constructor for java class " + GETPROPERTY_TASK_CLASS;
            return NULL;
        }

        s_clsgetPropertiesTask = loadClass(env, GETPROPERTIES_TASK_CLASS);
        if (!s_clsgetPropertiesTask) return 0;
        s_midgetPropertiesTask = env->GetMethodID(s_clsgetPropertiesTask, "<init>",
                        "(Lcom/rho/wificonfig/IWifiConfig;Ljava/util/List;Lcom/rhomobile/rhodes/api/IMethodResult;)V");
        if(!s_midgetPropertiesTask)
        {
            LOG(FATAL) + "Failed to get constructor for java class " + GETPROPERTIES_TASK_CLASS;
            return NULL;
        }

        s_clsgetAllPropertiesTask = loadClass(env, GETALLPROPERTIES_TASK_CLASS);
        if (!s_clsgetAllPropertiesTask) return 0;
        s_midgetAllPropertiesTask = env->GetMethodID(s_clsgetAllPropertiesTask, "<init>",
                        "(Lcom/rho/wificonfig/IWifiConfig;Lcom/rhomobile/rhodes/api/IMethodResult;)V");
        if(!s_midgetAllPropertiesTask)
        {
            LOG(FATAL) + "Failed to get constructor for java class " + GETALLPROPERTIES_TASK_CLASS;
            return NULL;
        }

        s_clssetPropertyTask = loadClass(env, SETPROPERTY_TASK_CLASS);
        if (!s_clssetPropertyTask) return 0;
        s_midsetPropertyTask = env->GetMethodID(s_clssetPropertyTask, "<init>",
                        "(Lcom/rho/wificonfig/IWifiConfig;Ljava/lang/String;Ljava/lang/String;Lcom/rhomobile/rhodes/api/IMethodResult;)V");
        if(!s_midsetPropertyTask)
        {
            LOG(FATAL) + "Failed to get constructor for java class " + SETPROPERTY_TASK_CLASS;
            return NULL;
        }

        s_clssetPropertiesTask = loadClass(env, SETPROPERTIES_TASK_CLASS);
        if (!s_clssetPropertiesTask) return 0;
        s_midsetPropertiesTask = env->GetMethodID(s_clssetPropertiesTask, "<init>",
                        "(Lcom/rho/wificonfig/IWifiConfig;Ljava/util/Map;Lcom/rhomobile/rhodes/api/IMethodResult;)V");
        if(!s_midsetPropertiesTask)
        {
            LOG(FATAL) + "Failed to get constructor for java class " + SETPROPERTIES_TASK_CLASS;
            return NULL;
        }


        s_clsIDefaultId = loadClass(env, IDEFAULTID_CLASS);
        if (!s_clsIDefaultId) return 0;
        s_midGetDefaultID = env->GetMethodID(s_clsIDefaultId, "getDefaultID", "()Ljava/lang/String;");
        if(!s_midGetDefaultID)
        {
            LOG(FATAL) + "Failed to get method 'getDefaultID' for java class " + IDEFAULTID_CLASS;
            return NULL;
        }
        s_midSetDefaultID = env->GetMethodID(s_clsIDefaultId, "setDefaultID", "(Ljava/lang/String;)V");
        if(!s_midSetDefaultID)
        {
            LOG(FATAL) + "Failed to get method 'setDefaultID' for java class " + IDEFAULTID_CLASS;
            return NULL;
        }


        initialized = true;
        LOG(TRACE) + "CWifiConfig JNI init succeeded";
    }
    return env;
}
//----------------------------------------------------------------------------------------------------------------------

void CWifiConfigBase::setJavaFactory(JNIEnv* env, jobject jFactory)
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

rho::String CWifiConfigBase::getDefaultID()
{
    LOG(TRACE) + "getDefaultID";

    JNIEnv *env = jniInit();
    if (!env) {
        LOG(FATAL) + "JNI initialization failed";
        return rho::String();
    }

    jhobject jhSingleton = getSingleton(env);
    jhstring res = static_cast<jstring>(env->CallObjectMethod(jhSingleton.get(), s_midGetDefaultID));
    return rho_cast<rho::String>(env, res);
}
//----------------------------------------------------------------------------------------------------------------------

void CWifiConfigBase::setDefaultID(const rho::String& id)
{
    LOG(TRACE) + "setDefaultID: " + id;

    JNIEnv *env = jniInit();
    if (!env) {
        LOG(FATAL) + "JNI initialization failed";
        return;
    }

    jhobject instance = getSingleton(env);
    jhstring jhId = rho_cast<jstring>(env, id);
    env->CallVoidMethod(instance.get(), s_midSetDefaultID, jhId.get());
}
//----------------------------------------------------------------------------------------------------------------------

jobject CWifiConfigBase::getFactory(JNIEnv* env)
{
    jobject res = env->CallStaticObjectMethod(s_clsFactorySingleton, s_midFactoryGetInstance);
    return res;
}
//----------------------------------------------------------------------------------------------------------------------

jobject CWifiConfigBase::getSingleton(JNIEnv* env)
{
    jhobject jhFactory = getFactory(env);
    jobject res = env->CallObjectMethod(jhFactory.get(), s_midGetApiSingleton);
    return res;
}
//----------------------------------------------------------------------------------------------------------------------

jobject CWifiConfigBase::getObject(JNIEnv* env)
{
    jhstring jhId = rho_cast<jstring>(env, m_id);
    jhobject jhFactory = getFactory(env);
    jobject res = env->CallObjectMethod(jhFactory.get(), s_midGetApiObject, jhId.get());
    return res;
}
//----------------------------------------------------------------------------------------------------------------------


}
