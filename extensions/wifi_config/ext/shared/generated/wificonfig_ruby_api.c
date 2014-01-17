#include "ruby.h"

static VALUE rb_api_mParent;
static VALUE rb_api_mWifiConfig;

VALUE rb_WifiConfig_getSimpleStringProperty(int argc, VALUE *argv, VALUE obj);
VALUE rb_s_WifiConfig_def_getSimpleStringProperty(int argc, VALUE *argv);
VALUE rb_WifiConfig_setSimpleStringProperty(int argc, VALUE *argv, VALUE obj);
VALUE rb_s_WifiConfig_def_setSimpleStringProperty(int argc, VALUE *argv);
VALUE rb_s_WifiConfig_enumerate(int argc, VALUE *argv);
VALUE rb_WifiConfig_get_EAP_Identity(int argc, VALUE *argv, VALUE obj);
VALUE rb_s_WifiConfig_def_get_EAP_Identity(int argc, VALUE *argv);
VALUE rb_WifiConfig_getProperty(int argc, VALUE *argv, VALUE obj);
VALUE rb_s_WifiConfig_def_getProperty(int argc, VALUE *argv);
VALUE rb_WifiConfig_getProperties(int argc, VALUE *argv, VALUE obj);
VALUE rb_s_WifiConfig_def_getProperties(int argc, VALUE *argv);
VALUE rb_WifiConfig_getAllProperties(int argc, VALUE *argv, VALUE obj);
VALUE rb_s_WifiConfig_def_getAllProperties(int argc, VALUE *argv);
VALUE rb_WifiConfig_setProperty(int argc, VALUE *argv, VALUE obj);
VALUE rb_s_WifiConfig_def_setProperty(int argc, VALUE *argv);
VALUE rb_WifiConfig_setProperties(int argc, VALUE *argv, VALUE obj);
VALUE rb_s_WifiConfig_def_setProperties(int argc, VALUE *argv);



VALUE rb_WifiConfig_s_default(VALUE klass);
VALUE rb_WifiConfig_s_setDefault(VALUE klass, VALUE obj);


VALUE getRuby_WifiConfig_Module(){ return rb_api_mWifiConfig; }



static void _free_class_object(void *p)
{
    ruby_xfree(p);
}

static VALUE _allocate_class_object(VALUE klass)
{
    VALUE valObj = 0;
    char ** ppString = NULL;
    void* pData = ALLOC(void*);
    memset( pData, 0, sizeof(pData) );
    
	valObj = Data_Wrap_Struct(klass, 0, _free_class_object, pData);

    Data_Get_Struct(valObj, char *, ppString);
    *ppString = xmalloc(10);
    sprintf(*ppString, "%X", valObj);

    return valObj;
}

void Init_RubyAPI_WifiConfig(void)
{

    VALUE tmpParent = Qnil;
    rb_api_mParent = rb_define_module("Rho");
    

	rb_api_mWifiConfig = rb_define_class_under(rb_api_mParent, "WifiConfig", rb_cObject);

	rb_define_alloc_func(rb_api_mWifiConfig, _allocate_class_object);
    //Constructor should be not available in case of static members
    //rb_undef_alloc_func(rb_api_mWifiConfig);

    rb_define_method(rb_api_mWifiConfig, "simpleStringProperty", rb_WifiConfig_getSimpleStringProperty, -1);
    rb_define_singleton_method(rb_api_mWifiConfig, "simpleStringProperty", rb_s_WifiConfig_def_getSimpleStringProperty, -1);
    rb_define_method(rb_api_mWifiConfig, "simpleStringProperty=", rb_WifiConfig_setSimpleStringProperty, -1);
    rb_define_singleton_method(rb_api_mWifiConfig, "simpleStringProperty=", rb_s_WifiConfig_def_setSimpleStringProperty, -1);
    rb_define_singleton_method(rb_api_mWifiConfig, "enumerate", rb_s_WifiConfig_enumerate, -1);
    rb_define_method(rb_api_mWifiConfig, "get_EAP_Identity", rb_WifiConfig_get_EAP_Identity, -1);
    rb_define_singleton_method(rb_api_mWifiConfig, "get_EAP_Identity", rb_s_WifiConfig_def_get_EAP_Identity, -1);
    rb_define_method(rb_api_mWifiConfig, "getProperty", rb_WifiConfig_getProperty, -1);
    rb_define_singleton_method(rb_api_mWifiConfig, "getProperty", rb_s_WifiConfig_def_getProperty, -1);
    rb_define_method(rb_api_mWifiConfig, "getProperties", rb_WifiConfig_getProperties, -1);
    rb_define_singleton_method(rb_api_mWifiConfig, "getProperties", rb_s_WifiConfig_def_getProperties, -1);
    rb_define_method(rb_api_mWifiConfig, "getAllProperties", rb_WifiConfig_getAllProperties, -1);
    rb_define_singleton_method(rb_api_mWifiConfig, "getAllProperties", rb_s_WifiConfig_def_getAllProperties, -1);
    rb_define_method(rb_api_mWifiConfig, "setProperty", rb_WifiConfig_setProperty, -1);
    rb_define_singleton_method(rb_api_mWifiConfig, "setProperty", rb_s_WifiConfig_def_setProperty, -1);
    rb_define_method(rb_api_mWifiConfig, "setProperties", rb_WifiConfig_setProperties, -1);
    rb_define_singleton_method(rb_api_mWifiConfig, "setProperties", rb_s_WifiConfig_def_setProperties, -1);



    rb_define_singleton_method(rb_api_mWifiConfig, "getDefault", rb_WifiConfig_s_default, 0);
    rb_define_singleton_method(rb_api_mWifiConfig, "setDefault", rb_WifiConfig_s_setDefault, 1);






}

