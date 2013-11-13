#include "ruby.h"

static VALUE rb_api_mParent;
static VALUE rb_api_mExternalstorage;

VALUE rb_s_Externalstorage_getSDPath(int argc, VALUE *argv);




VALUE getRuby_Externalstorage_Module(){ return rb_api_mExternalstorage; }



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

void Init_RubyAPI_Externalstorage(void)
{

    VALUE tmpParent = Qnil;
    rb_api_mParent = rb_define_module("Rho");
    

	rb_api_mExternalstorage = rb_define_class_under(rb_api_mParent, "Externalstorage", rb_cObject);

	rb_define_alloc_func(rb_api_mExternalstorage, _allocate_class_object);
    //Constructor should be not available in case of static members
    //rb_undef_alloc_func(rb_api_mExternalstorage);

    rb_define_singleton_method(rb_api_mExternalstorage, "getSDPath", rb_s_Externalstorage_getSDPath, -1);








}

