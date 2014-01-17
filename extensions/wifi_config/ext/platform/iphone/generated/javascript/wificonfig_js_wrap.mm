#import "IWifiConfig.h"
//#import "api_generator/common/ruby_helpers.h"

#include "api_generator/js_helpers.h"

#import "api_generator/iphone/CMethodResult.h"
#import "api_generator/iphone/CJSConverter.h"

extern VALUE getRuby_WifiConfig_Module();



id<IWifiConfig> WifiConfig_makeInstanceByJSObject(rho::String sid) {
    const char* szID = sid.c_str();
    id<IWifiConfigFactory> factory = [WifiConfigFactorySingleton getWifiConfigFactoryInstance];
    return [factory getWifiConfigByID:[NSString stringWithUTF8String:szID]];
}









@interface WifiConfig_getSimpleStringProperty_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IWifiConfig> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(WifiConfig_getSimpleStringProperty_caller_params*) makeParams:(NSArray*)_params _item:(id<IWifiConfig>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation WifiConfig_getSimpleStringProperty_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(WifiConfig_getSimpleStringProperty_caller_params*) makeParams:(NSArray*)_params _item:(id<IWifiConfig>)_item _methodResult:(CMethodResult*)_methodResult {
    WifiConfig_getSimpleStringProperty_caller_params* par = [[WifiConfig_getSimpleStringProperty_caller_params alloc] init];
    par.params = _params;
    par.item = _item;
    par.methodResult = _methodResult;
    return [par retain];
}

@end


@interface WifiConfig_getSimpleStringProperty_caller : NSObject {

}
+(WifiConfig_getSimpleStringProperty_caller*) getSharedInstance;
+(void) getSimpleStringProperty:(WifiConfig_getSimpleStringProperty_caller_params*)caller_params;
+(void) getSimpleStringProperty_in_thread:(WifiConfig_getSimpleStringProperty_caller_params*)caller_params;
+(void) getSimpleStringProperty_in_UI_thread:(WifiConfig_getSimpleStringProperty_caller_params*)caller_params;

@end

static WifiConfig_getSimpleStringProperty_caller* our_WifiConfig_getSimpleStringProperty_caller = nil;

@implementation WifiConfig_getSimpleStringProperty_caller

+(WifiConfig_getSimpleStringProperty_caller*) getSharedInstance {
    if (our_WifiConfig_getSimpleStringProperty_caller == nil) {
        our_WifiConfig_getSimpleStringProperty_caller = [[WifiConfig_getSimpleStringProperty_caller alloc] init];
    }
    return our_WifiConfig_getSimpleStringProperty_caller;
}

-(void) command_getSimpleStringProperty:(WifiConfig_getSimpleStringProperty_caller_params*)caller_params {
    NSArray* params = caller_params.params;
    id<IWifiConfig> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem getSimpleStringProperty:methodResult ];
    [caller_params release];
}


+(void) getSimpleStringProperty:(WifiConfig_getSimpleStringProperty_caller_params*)caller_params {
    [[WifiConfig_getSimpleStringProperty_caller getSharedInstance] command_getSimpleStringProperty:caller_params];
}

+(void) getSimpleStringProperty_in_thread:(WifiConfig_getSimpleStringProperty_caller_params*)caller_params {
    [[WifiConfig_getSimpleStringProperty_caller getSharedInstance] performSelectorInBackground:@selector(command_getSimpleStringProperty:) withObject:caller_params];
}

+(void) getSimpleStringProperty_in_UI_thread:(WifiConfig_getSimpleStringProperty_caller_params*)caller_params {
    [[WifiConfig_getSimpleStringProperty_caller getSharedInstance] performSelectorOnMainThread:@selector(command_getSimpleStringProperty:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_WifiConfig_getSimpleStringProperty_Obj(rho::json::CJSONArray& argv, id<IWifiConfig>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[0+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"WifiConfig::simpleStringProperty"];

    
    static RHO_API_PARAM rho_api_params[] = {  };

    
    BOOL is_factory_param[] = { NO };

    int i;

    // init
    for (i = 0; i < (0); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (0); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = WifiConfig_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                NSLog(@"WifiConfig::getSimpleStringProperty parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(0)];
    for (i = 0 ; i < (0); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [WifiConfig_getSimpleStringProperty_caller getSimpleStringProperty_in_thread:[WifiConfig_getSimpleStringProperty_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    else {
        // we do not have callback
        
        [WifiConfig_getSimpleStringProperty_caller getSimpleStringProperty:[WifiConfig_getSimpleStringProperty_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    return resValue;
}


rho::String js_WifiConfig_getSimpleStringProperty(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IWifiConfig> item = WifiConfig_makeInstanceByJSObject(strObjID);
    return js_WifiConfig_getSimpleStringProperty_Obj(argv, item, strCallbackID, strJsVmID, strCallbackParam);

}

rho::String js_s_WifiConfig_def_getSimpleStringProperty(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {
    id<IWifiConfigFactory> factory = [WifiConfigFactorySingleton getWifiConfigFactoryInstance];
    id<IWifiConfigSingleton> singleton = [factory getWifiConfigSingleton];

    NSString* defID = [singleton getDefaultID];

    id<IWifiConfig> item = [factory getWifiConfigByID:defID];
    return js_WifiConfig_getSimpleStringProperty_Obj(argv, item, strCallbackID, strJsVmID, strCallbackParam);
}







@interface WifiConfig_setSimpleStringProperty_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IWifiConfig> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(WifiConfig_setSimpleStringProperty_caller_params*) makeParams:(NSArray*)_params _item:(id<IWifiConfig>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation WifiConfig_setSimpleStringProperty_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(WifiConfig_setSimpleStringProperty_caller_params*) makeParams:(NSArray*)_params _item:(id<IWifiConfig>)_item _methodResult:(CMethodResult*)_methodResult {
    WifiConfig_setSimpleStringProperty_caller_params* par = [[WifiConfig_setSimpleStringProperty_caller_params alloc] init];
    par.params = _params;
    par.item = _item;
    par.methodResult = _methodResult;
    return [par retain];
}

@end


@interface WifiConfig_setSimpleStringProperty_caller : NSObject {

}
+(WifiConfig_setSimpleStringProperty_caller*) getSharedInstance;
+(void) setSimpleStringProperty:(WifiConfig_setSimpleStringProperty_caller_params*)caller_params;
+(void) setSimpleStringProperty_in_thread:(WifiConfig_setSimpleStringProperty_caller_params*)caller_params;
+(void) setSimpleStringProperty_in_UI_thread:(WifiConfig_setSimpleStringProperty_caller_params*)caller_params;

@end

static WifiConfig_setSimpleStringProperty_caller* our_WifiConfig_setSimpleStringProperty_caller = nil;

@implementation WifiConfig_setSimpleStringProperty_caller

+(WifiConfig_setSimpleStringProperty_caller*) getSharedInstance {
    if (our_WifiConfig_setSimpleStringProperty_caller == nil) {
        our_WifiConfig_setSimpleStringProperty_caller = [[WifiConfig_setSimpleStringProperty_caller alloc] init];
    }
    return our_WifiConfig_setSimpleStringProperty_caller;
}

-(void) command_setSimpleStringProperty:(WifiConfig_setSimpleStringProperty_caller_params*)caller_params {
    NSArray* params = caller_params.params;
    id<IWifiConfig> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem setSimpleStringProperty:(NSString*)[params objectAtIndex:0] methodResult:methodResult ];
    [caller_params release];
}


+(void) setSimpleStringProperty:(WifiConfig_setSimpleStringProperty_caller_params*)caller_params {
    [[WifiConfig_setSimpleStringProperty_caller getSharedInstance] command_setSimpleStringProperty:caller_params];
}

+(void) setSimpleStringProperty_in_thread:(WifiConfig_setSimpleStringProperty_caller_params*)caller_params {
    [[WifiConfig_setSimpleStringProperty_caller getSharedInstance] performSelectorInBackground:@selector(command_setSimpleStringProperty:) withObject:caller_params];
}

+(void) setSimpleStringProperty_in_UI_thread:(WifiConfig_setSimpleStringProperty_caller_params*)caller_params {
    [[WifiConfig_setSimpleStringProperty_caller getSharedInstance] performSelectorOnMainThread:@selector(command_setSimpleStringProperty:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_WifiConfig_setSimpleStringProperty_Obj(rho::json::CJSONArray& argv, id<IWifiConfig>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[1+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"WifiConfig::simpleStringProperty="];

    
    static RHO_API_PARAM rho_api_params[] = { {RHO_API_STRING, 0, "simpleStringProperty", 0, 0 } };

    
    BOOL is_factory_param[] = { NO, NO };

    int i;

    // init
    for (i = 0; i < (1); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (1); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = WifiConfig_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                NSLog(@"WifiConfig::setSimpleStringProperty parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(1)];
    for (i = 0 ; i < (1); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [WifiConfig_setSimpleStringProperty_caller setSimpleStringProperty_in_thread:[WifiConfig_setSimpleStringProperty_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    else {
        // we do not have callback
        
        [WifiConfig_setSimpleStringProperty_caller setSimpleStringProperty:[WifiConfig_setSimpleStringProperty_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    return resValue;
}


rho::String js_WifiConfig_setSimpleStringProperty(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IWifiConfig> item = WifiConfig_makeInstanceByJSObject(strObjID);
    return js_WifiConfig_setSimpleStringProperty_Obj(argv, item, strCallbackID, strJsVmID, strCallbackParam);

}

rho::String js_s_WifiConfig_def_setSimpleStringProperty(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {
    id<IWifiConfigFactory> factory = [WifiConfigFactorySingleton getWifiConfigFactoryInstance];
    id<IWifiConfigSingleton> singleton = [factory getWifiConfigSingleton];

    NSString* defID = [singleton getDefaultID];

    id<IWifiConfig> item = [factory getWifiConfigByID:defID];
    return js_WifiConfig_setSimpleStringProperty_Obj(argv, item, strCallbackID, strJsVmID, strCallbackParam);
}







@interface WifiConfig_enumerate_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IWifiConfigSingleton> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(WifiConfig_enumerate_caller_params*) makeParams:(NSArray*)_params _item:(id<IWifiConfigSingleton>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation WifiConfig_enumerate_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(WifiConfig_enumerate_caller_params*) makeParams:(NSArray*)_params _item:(id<IWifiConfigSingleton>)_item _methodResult:(CMethodResult*)_methodResult {
    WifiConfig_enumerate_caller_params* par = [[WifiConfig_enumerate_caller_params alloc] init];
    par.params = _params;
    par.item = _item;
    par.methodResult = _methodResult;
    return [par retain];
}

@end


@interface WifiConfig_enumerate_caller : NSObject {

}
+(WifiConfig_enumerate_caller*) getSharedInstance;
+(void) enumerate:(WifiConfig_enumerate_caller_params*)caller_params;
+(void) enumerate_in_thread:(WifiConfig_enumerate_caller_params*)caller_params;
+(void) enumerate_in_UI_thread:(WifiConfig_enumerate_caller_params*)caller_params;

@end

static WifiConfig_enumerate_caller* our_WifiConfig_enumerate_caller = nil;

@implementation WifiConfig_enumerate_caller

+(WifiConfig_enumerate_caller*) getSharedInstance {
    if (our_WifiConfig_enumerate_caller == nil) {
        our_WifiConfig_enumerate_caller = [[WifiConfig_enumerate_caller alloc] init];
    }
    return our_WifiConfig_enumerate_caller;
}

-(void) command_enumerate:(WifiConfig_enumerate_caller_params*)caller_params {
    NSArray* params = caller_params.params;
    id<IWifiConfigSingleton> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem enumerate:methodResult ];
    [caller_params release];
}


+(void) enumerate:(WifiConfig_enumerate_caller_params*)caller_params {
    [[WifiConfig_enumerate_caller getSharedInstance] command_enumerate:caller_params];
}

+(void) enumerate_in_thread:(WifiConfig_enumerate_caller_params*)caller_params {
    [[WifiConfig_enumerate_caller getSharedInstance] performSelectorInBackground:@selector(command_enumerate:) withObject:caller_params];
}

+(void) enumerate_in_UI_thread:(WifiConfig_enumerate_caller_params*)caller_params {
    [[WifiConfig_enumerate_caller getSharedInstance] performSelectorOnMainThread:@selector(command_enumerate:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_WifiConfig_enumerate_Obj(rho::json::CJSONArray& argv, id<IWifiConfigSingleton>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[0+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"WifiConfig::enumerate"];

    
    static RHO_API_PARAM rho_api_params[] = {  };

    
    BOOL is_factory_param[] = { NO };

    int i;

    // init
    for (i = 0; i < (0); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (0); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = WifiConfig_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                NSLog(@"WifiConfig::enumerate parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(0)];
    for (i = 0 ; i < (0); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    [methodResult enableObjectCreationModeWithJSClassPath:@"Rho.WifiConfig"];

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [WifiConfig_enumerate_caller enumerate_in_thread:[WifiConfig_enumerate_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    else {
        // we do not have callback
        
        [WifiConfig_enumerate_caller enumerate:[WifiConfig_enumerate_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    return resValue;
}


rho::String js_s_WifiConfig_enumerate(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IWifiConfigFactory> factory = [WifiConfigFactorySingleton getWifiConfigFactoryInstance];
    id<IWifiConfigSingleton> singleton = [factory getWifiConfigSingleton];
    return js_WifiConfig_enumerate_Obj(argv, singleton, strCallbackID, strJsVmID, strCallbackParam);

}







@interface WifiConfig_get_EAP_Identity_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IWifiConfig> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(WifiConfig_get_EAP_Identity_caller_params*) makeParams:(NSArray*)_params _item:(id<IWifiConfig>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation WifiConfig_get_EAP_Identity_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(WifiConfig_get_EAP_Identity_caller_params*) makeParams:(NSArray*)_params _item:(id<IWifiConfig>)_item _methodResult:(CMethodResult*)_methodResult {
    WifiConfig_get_EAP_Identity_caller_params* par = [[WifiConfig_get_EAP_Identity_caller_params alloc] init];
    par.params = _params;
    par.item = _item;
    par.methodResult = _methodResult;
    return [par retain];
}

@end


@interface WifiConfig_get_EAP_Identity_caller : NSObject {

}
+(WifiConfig_get_EAP_Identity_caller*) getSharedInstance;
+(void) get_EAP_Identity:(WifiConfig_get_EAP_Identity_caller_params*)caller_params;
+(void) get_EAP_Identity_in_thread:(WifiConfig_get_EAP_Identity_caller_params*)caller_params;
+(void) get_EAP_Identity_in_UI_thread:(WifiConfig_get_EAP_Identity_caller_params*)caller_params;

@end

static WifiConfig_get_EAP_Identity_caller* our_WifiConfig_get_EAP_Identity_caller = nil;

@implementation WifiConfig_get_EAP_Identity_caller

+(WifiConfig_get_EAP_Identity_caller*) getSharedInstance {
    if (our_WifiConfig_get_EAP_Identity_caller == nil) {
        our_WifiConfig_get_EAP_Identity_caller = [[WifiConfig_get_EAP_Identity_caller alloc] init];
    }
    return our_WifiConfig_get_EAP_Identity_caller;
}

-(void) command_get_EAP_Identity:(WifiConfig_get_EAP_Identity_caller_params*)caller_params {
    NSArray* params = caller_params.params;
    id<IWifiConfig> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem get_EAP_Identity:(NSString*)[params objectAtIndex:0] methodResult:methodResult ];
    [caller_params release];
}


+(void) get_EAP_Identity:(WifiConfig_get_EAP_Identity_caller_params*)caller_params {
    [[WifiConfig_get_EAP_Identity_caller getSharedInstance] command_get_EAP_Identity:caller_params];
}

+(void) get_EAP_Identity_in_thread:(WifiConfig_get_EAP_Identity_caller_params*)caller_params {
    [[WifiConfig_get_EAP_Identity_caller getSharedInstance] performSelectorInBackground:@selector(command_get_EAP_Identity:) withObject:caller_params];
}

+(void) get_EAP_Identity_in_UI_thread:(WifiConfig_get_EAP_Identity_caller_params*)caller_params {
    [[WifiConfig_get_EAP_Identity_caller getSharedInstance] performSelectorOnMainThread:@selector(command_get_EAP_Identity:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_WifiConfig_get_EAP_Identity_Obj(rho::json::CJSONArray& argv, id<IWifiConfig>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[1+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"WifiConfig::get_EAP_Identity"];

    
    static RHO_API_PARAM rho_api_params[] = { {RHO_API_STRING, 0, "a", 0, 0 } };

    
    BOOL is_factory_param[] = { NO, NO };

    int i;

    // init
    for (i = 0; i < (1); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (1); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = WifiConfig_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                NSLog(@"WifiConfig::get_EAP_Identity parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(1)];
    for (i = 0 ; i < (1); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [WifiConfig_get_EAP_Identity_caller get_EAP_Identity_in_thread:[WifiConfig_get_EAP_Identity_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    else {
        // we do not have callback
        
        [WifiConfig_get_EAP_Identity_caller get_EAP_Identity:[WifiConfig_get_EAP_Identity_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    return resValue;
}


rho::String js_WifiConfig_get_EAP_Identity(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IWifiConfig> item = WifiConfig_makeInstanceByJSObject(strObjID);
    return js_WifiConfig_get_EAP_Identity_Obj(argv, item, strCallbackID, strJsVmID, strCallbackParam);

}

rho::String js_s_WifiConfig_def_get_EAP_Identity(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {
    id<IWifiConfigFactory> factory = [WifiConfigFactorySingleton getWifiConfigFactoryInstance];
    id<IWifiConfigSingleton> singleton = [factory getWifiConfigSingleton];

    NSString* defID = [singleton getDefaultID];

    id<IWifiConfig> item = [factory getWifiConfigByID:defID];
    return js_WifiConfig_get_EAP_Identity_Obj(argv, item, strCallbackID, strJsVmID, strCallbackParam);
}







@interface WifiConfig_getProperty_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IWifiConfig> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(WifiConfig_getProperty_caller_params*) makeParams:(NSArray*)_params _item:(id<IWifiConfig>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation WifiConfig_getProperty_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(WifiConfig_getProperty_caller_params*) makeParams:(NSArray*)_params _item:(id<IWifiConfig>)_item _methodResult:(CMethodResult*)_methodResult {
    WifiConfig_getProperty_caller_params* par = [[WifiConfig_getProperty_caller_params alloc] init];
    par.params = _params;
    par.item = _item;
    par.methodResult = _methodResult;
    return [par retain];
}

@end


@interface WifiConfig_getProperty_caller : NSObject {

}
+(WifiConfig_getProperty_caller*) getSharedInstance;
+(void) getProperty:(WifiConfig_getProperty_caller_params*)caller_params;
+(void) getProperty_in_thread:(WifiConfig_getProperty_caller_params*)caller_params;
+(void) getProperty_in_UI_thread:(WifiConfig_getProperty_caller_params*)caller_params;

@end

static WifiConfig_getProperty_caller* our_WifiConfig_getProperty_caller = nil;

@implementation WifiConfig_getProperty_caller

+(WifiConfig_getProperty_caller*) getSharedInstance {
    if (our_WifiConfig_getProperty_caller == nil) {
        our_WifiConfig_getProperty_caller = [[WifiConfig_getProperty_caller alloc] init];
    }
    return our_WifiConfig_getProperty_caller;
}

-(void) command_getProperty:(WifiConfig_getProperty_caller_params*)caller_params {
    NSArray* params = caller_params.params;
    id<IWifiConfig> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem getProperty:(NSString*)[params objectAtIndex:0] methodResult:methodResult ];
    [caller_params release];
}


+(void) getProperty:(WifiConfig_getProperty_caller_params*)caller_params {
    [[WifiConfig_getProperty_caller getSharedInstance] command_getProperty:caller_params];
}

+(void) getProperty_in_thread:(WifiConfig_getProperty_caller_params*)caller_params {
    [[WifiConfig_getProperty_caller getSharedInstance] performSelectorInBackground:@selector(command_getProperty:) withObject:caller_params];
}

+(void) getProperty_in_UI_thread:(WifiConfig_getProperty_caller_params*)caller_params {
    [[WifiConfig_getProperty_caller getSharedInstance] performSelectorOnMainThread:@selector(command_getProperty:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_WifiConfig_getProperty_Obj(rho::json::CJSONArray& argv, id<IWifiConfig>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[1+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"WifiConfig::getProperty"];

    
    static RHO_API_PARAM rho_api_params[] = { {RHO_API_STRING, 0, "propertyName", 0, 0 } };

    
    BOOL is_factory_param[] = { NO, NO };

    int i;

    // init
    for (i = 0; i < (1); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (1); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = WifiConfig_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                NSLog(@"WifiConfig::getProperty parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(1)];
    for (i = 0 ; i < (1); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [WifiConfig_getProperty_caller getProperty_in_thread:[WifiConfig_getProperty_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    else {
        // we do not have callback
        
        [WifiConfig_getProperty_caller getProperty:[WifiConfig_getProperty_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    return resValue;
}


rho::String js_WifiConfig_getProperty(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IWifiConfig> item = WifiConfig_makeInstanceByJSObject(strObjID);
    return js_WifiConfig_getProperty_Obj(argv, item, strCallbackID, strJsVmID, strCallbackParam);

}

rho::String js_s_WifiConfig_def_getProperty(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {
    id<IWifiConfigFactory> factory = [WifiConfigFactorySingleton getWifiConfigFactoryInstance];
    id<IWifiConfigSingleton> singleton = [factory getWifiConfigSingleton];

    NSString* defID = [singleton getDefaultID];

    id<IWifiConfig> item = [factory getWifiConfigByID:defID];
    return js_WifiConfig_getProperty_Obj(argv, item, strCallbackID, strJsVmID, strCallbackParam);
}







@interface WifiConfig_getProperties_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IWifiConfig> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(WifiConfig_getProperties_caller_params*) makeParams:(NSArray*)_params _item:(id<IWifiConfig>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation WifiConfig_getProperties_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(WifiConfig_getProperties_caller_params*) makeParams:(NSArray*)_params _item:(id<IWifiConfig>)_item _methodResult:(CMethodResult*)_methodResult {
    WifiConfig_getProperties_caller_params* par = [[WifiConfig_getProperties_caller_params alloc] init];
    par.params = _params;
    par.item = _item;
    par.methodResult = _methodResult;
    return [par retain];
}

@end


@interface WifiConfig_getProperties_caller : NSObject {

}
+(WifiConfig_getProperties_caller*) getSharedInstance;
+(void) getProperties:(WifiConfig_getProperties_caller_params*)caller_params;
+(void) getProperties_in_thread:(WifiConfig_getProperties_caller_params*)caller_params;
+(void) getProperties_in_UI_thread:(WifiConfig_getProperties_caller_params*)caller_params;

@end

static WifiConfig_getProperties_caller* our_WifiConfig_getProperties_caller = nil;

@implementation WifiConfig_getProperties_caller

+(WifiConfig_getProperties_caller*) getSharedInstance {
    if (our_WifiConfig_getProperties_caller == nil) {
        our_WifiConfig_getProperties_caller = [[WifiConfig_getProperties_caller alloc] init];
    }
    return our_WifiConfig_getProperties_caller;
}

-(void) command_getProperties:(WifiConfig_getProperties_caller_params*)caller_params {
    NSArray* params = caller_params.params;
    id<IWifiConfig> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem getProperties:(NSArray*)[params objectAtIndex:0] methodResult:methodResult ];
    [caller_params release];
}


+(void) getProperties:(WifiConfig_getProperties_caller_params*)caller_params {
    [[WifiConfig_getProperties_caller getSharedInstance] command_getProperties:caller_params];
}

+(void) getProperties_in_thread:(WifiConfig_getProperties_caller_params*)caller_params {
    [[WifiConfig_getProperties_caller getSharedInstance] performSelectorInBackground:@selector(command_getProperties:) withObject:caller_params];
}

+(void) getProperties_in_UI_thread:(WifiConfig_getProperties_caller_params*)caller_params {
    [[WifiConfig_getProperties_caller getSharedInstance] performSelectorOnMainThread:@selector(command_getProperties:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_WifiConfig_getProperties_Obj(rho::json::CJSONArray& argv, id<IWifiConfig>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[1+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"WifiConfig::getProperties"];

    
    static RHO_API_PARAM rho_api_params_param0[] = { {RHO_API_STRING, 0, "array_param", 0, 0 } };
    static RHO_API_PARAM rho_api_params[] = { {RHO_API_ARRAY, 0, "arrayofNames", 1, rho_api_params_param0 } };

    
    BOOL is_factory_param[] = { NO, NO };

    int i;

    // init
    for (i = 0; i < (1); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (1); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = WifiConfig_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                NSLog(@"WifiConfig::getProperties parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(1)];
    for (i = 0 ; i < (1); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [WifiConfig_getProperties_caller getProperties_in_thread:[WifiConfig_getProperties_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    else {
        // we do not have callback
        
        [WifiConfig_getProperties_caller getProperties:[WifiConfig_getProperties_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    return resValue;
}


rho::String js_WifiConfig_getProperties(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IWifiConfig> item = WifiConfig_makeInstanceByJSObject(strObjID);
    return js_WifiConfig_getProperties_Obj(argv, item, strCallbackID, strJsVmID, strCallbackParam);

}

rho::String js_s_WifiConfig_def_getProperties(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {
    id<IWifiConfigFactory> factory = [WifiConfigFactorySingleton getWifiConfigFactoryInstance];
    id<IWifiConfigSingleton> singleton = [factory getWifiConfigSingleton];

    NSString* defID = [singleton getDefaultID];

    id<IWifiConfig> item = [factory getWifiConfigByID:defID];
    return js_WifiConfig_getProperties_Obj(argv, item, strCallbackID, strJsVmID, strCallbackParam);
}







@interface WifiConfig_getAllProperties_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IWifiConfig> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(WifiConfig_getAllProperties_caller_params*) makeParams:(NSArray*)_params _item:(id<IWifiConfig>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation WifiConfig_getAllProperties_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(WifiConfig_getAllProperties_caller_params*) makeParams:(NSArray*)_params _item:(id<IWifiConfig>)_item _methodResult:(CMethodResult*)_methodResult {
    WifiConfig_getAllProperties_caller_params* par = [[WifiConfig_getAllProperties_caller_params alloc] init];
    par.params = _params;
    par.item = _item;
    par.methodResult = _methodResult;
    return [par retain];
}

@end


@interface WifiConfig_getAllProperties_caller : NSObject {

}
+(WifiConfig_getAllProperties_caller*) getSharedInstance;
+(void) getAllProperties:(WifiConfig_getAllProperties_caller_params*)caller_params;
+(void) getAllProperties_in_thread:(WifiConfig_getAllProperties_caller_params*)caller_params;
+(void) getAllProperties_in_UI_thread:(WifiConfig_getAllProperties_caller_params*)caller_params;

@end

static WifiConfig_getAllProperties_caller* our_WifiConfig_getAllProperties_caller = nil;

@implementation WifiConfig_getAllProperties_caller

+(WifiConfig_getAllProperties_caller*) getSharedInstance {
    if (our_WifiConfig_getAllProperties_caller == nil) {
        our_WifiConfig_getAllProperties_caller = [[WifiConfig_getAllProperties_caller alloc] init];
    }
    return our_WifiConfig_getAllProperties_caller;
}

-(void) command_getAllProperties:(WifiConfig_getAllProperties_caller_params*)caller_params {
    NSArray* params = caller_params.params;
    id<IWifiConfig> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem getAllProperties:methodResult ];
    [caller_params release];
}


+(void) getAllProperties:(WifiConfig_getAllProperties_caller_params*)caller_params {
    [[WifiConfig_getAllProperties_caller getSharedInstance] command_getAllProperties:caller_params];
}

+(void) getAllProperties_in_thread:(WifiConfig_getAllProperties_caller_params*)caller_params {
    [[WifiConfig_getAllProperties_caller getSharedInstance] performSelectorInBackground:@selector(command_getAllProperties:) withObject:caller_params];
}

+(void) getAllProperties_in_UI_thread:(WifiConfig_getAllProperties_caller_params*)caller_params {
    [[WifiConfig_getAllProperties_caller getSharedInstance] performSelectorOnMainThread:@selector(command_getAllProperties:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_WifiConfig_getAllProperties_Obj(rho::json::CJSONArray& argv, id<IWifiConfig>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[0+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"WifiConfig::getAllProperties"];

    
    static RHO_API_PARAM rho_api_params[] = {  };

    
    BOOL is_factory_param[] = { NO };

    int i;

    // init
    for (i = 0; i < (0); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (0); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = WifiConfig_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                NSLog(@"WifiConfig::getAllProperties parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(0)];
    for (i = 0 ; i < (0); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [WifiConfig_getAllProperties_caller getAllProperties_in_thread:[WifiConfig_getAllProperties_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    else {
        // we do not have callback
        
        [WifiConfig_getAllProperties_caller getAllProperties:[WifiConfig_getAllProperties_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    return resValue;
}


rho::String js_WifiConfig_getAllProperties(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IWifiConfig> item = WifiConfig_makeInstanceByJSObject(strObjID);
    return js_WifiConfig_getAllProperties_Obj(argv, item, strCallbackID, strJsVmID, strCallbackParam);

}

rho::String js_s_WifiConfig_def_getAllProperties(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {
    id<IWifiConfigFactory> factory = [WifiConfigFactorySingleton getWifiConfigFactoryInstance];
    id<IWifiConfigSingleton> singleton = [factory getWifiConfigSingleton];

    NSString* defID = [singleton getDefaultID];

    id<IWifiConfig> item = [factory getWifiConfigByID:defID];
    return js_WifiConfig_getAllProperties_Obj(argv, item, strCallbackID, strJsVmID, strCallbackParam);
}







@interface WifiConfig_setProperty_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IWifiConfig> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(WifiConfig_setProperty_caller_params*) makeParams:(NSArray*)_params _item:(id<IWifiConfig>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation WifiConfig_setProperty_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(WifiConfig_setProperty_caller_params*) makeParams:(NSArray*)_params _item:(id<IWifiConfig>)_item _methodResult:(CMethodResult*)_methodResult {
    WifiConfig_setProperty_caller_params* par = [[WifiConfig_setProperty_caller_params alloc] init];
    par.params = _params;
    par.item = _item;
    par.methodResult = _methodResult;
    return [par retain];
}

@end


@interface WifiConfig_setProperty_caller : NSObject {

}
+(WifiConfig_setProperty_caller*) getSharedInstance;
+(void) setProperty:(WifiConfig_setProperty_caller_params*)caller_params;
+(void) setProperty_in_thread:(WifiConfig_setProperty_caller_params*)caller_params;
+(void) setProperty_in_UI_thread:(WifiConfig_setProperty_caller_params*)caller_params;

@end

static WifiConfig_setProperty_caller* our_WifiConfig_setProperty_caller = nil;

@implementation WifiConfig_setProperty_caller

+(WifiConfig_setProperty_caller*) getSharedInstance {
    if (our_WifiConfig_setProperty_caller == nil) {
        our_WifiConfig_setProperty_caller = [[WifiConfig_setProperty_caller alloc] init];
    }
    return our_WifiConfig_setProperty_caller;
}

-(void) command_setProperty:(WifiConfig_setProperty_caller_params*)caller_params {
    NSArray* params = caller_params.params;
    id<IWifiConfig> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem setProperty:(NSString*)[params objectAtIndex:0] propertyValue:(NSString*)[params objectAtIndex:1] methodResult:methodResult ];
    [caller_params release];
}


+(void) setProperty:(WifiConfig_setProperty_caller_params*)caller_params {
    [[WifiConfig_setProperty_caller getSharedInstance] command_setProperty:caller_params];
}

+(void) setProperty_in_thread:(WifiConfig_setProperty_caller_params*)caller_params {
    [[WifiConfig_setProperty_caller getSharedInstance] performSelectorInBackground:@selector(command_setProperty:) withObject:caller_params];
}

+(void) setProperty_in_UI_thread:(WifiConfig_setProperty_caller_params*)caller_params {
    [[WifiConfig_setProperty_caller getSharedInstance] performSelectorOnMainThread:@selector(command_setProperty:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_WifiConfig_setProperty_Obj(rho::json::CJSONArray& argv, id<IWifiConfig>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[2+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"WifiConfig::setProperty"];

    
    static RHO_API_PARAM rho_api_params[] = { {RHO_API_STRING, 0, "propertyName", 0, 0 }, {RHO_API_STRING, 0, "propertyValue", 0, 0 } };

    
    BOOL is_factory_param[] = { NO, NO, NO };

    int i;

    // init
    for (i = 0; i < (2); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (2); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = WifiConfig_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                NSLog(@"WifiConfig::setProperty parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(2)];
    for (i = 0 ; i < (2); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [WifiConfig_setProperty_caller setProperty_in_thread:[WifiConfig_setProperty_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    else {
        // we do not have callback
        
        [WifiConfig_setProperty_caller setProperty:[WifiConfig_setProperty_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    return resValue;
}


rho::String js_WifiConfig_setProperty(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IWifiConfig> item = WifiConfig_makeInstanceByJSObject(strObjID);
    return js_WifiConfig_setProperty_Obj(argv, item, strCallbackID, strJsVmID, strCallbackParam);

}

rho::String js_s_WifiConfig_def_setProperty(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {
    id<IWifiConfigFactory> factory = [WifiConfigFactorySingleton getWifiConfigFactoryInstance];
    id<IWifiConfigSingleton> singleton = [factory getWifiConfigSingleton];

    NSString* defID = [singleton getDefaultID];

    id<IWifiConfig> item = [factory getWifiConfigByID:defID];
    return js_WifiConfig_setProperty_Obj(argv, item, strCallbackID, strJsVmID, strCallbackParam);
}







@interface WifiConfig_setProperties_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IWifiConfig> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(WifiConfig_setProperties_caller_params*) makeParams:(NSArray*)_params _item:(id<IWifiConfig>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation WifiConfig_setProperties_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(WifiConfig_setProperties_caller_params*) makeParams:(NSArray*)_params _item:(id<IWifiConfig>)_item _methodResult:(CMethodResult*)_methodResult {
    WifiConfig_setProperties_caller_params* par = [[WifiConfig_setProperties_caller_params alloc] init];
    par.params = _params;
    par.item = _item;
    par.methodResult = _methodResult;
    return [par retain];
}

@end


@interface WifiConfig_setProperties_caller : NSObject {

}
+(WifiConfig_setProperties_caller*) getSharedInstance;
+(void) setProperties:(WifiConfig_setProperties_caller_params*)caller_params;
+(void) setProperties_in_thread:(WifiConfig_setProperties_caller_params*)caller_params;
+(void) setProperties_in_UI_thread:(WifiConfig_setProperties_caller_params*)caller_params;

@end

static WifiConfig_setProperties_caller* our_WifiConfig_setProperties_caller = nil;

@implementation WifiConfig_setProperties_caller

+(WifiConfig_setProperties_caller*) getSharedInstance {
    if (our_WifiConfig_setProperties_caller == nil) {
        our_WifiConfig_setProperties_caller = [[WifiConfig_setProperties_caller alloc] init];
    }
    return our_WifiConfig_setProperties_caller;
}

-(void) command_setProperties:(WifiConfig_setProperties_caller_params*)caller_params {
    NSArray* params = caller_params.params;
    id<IWifiConfig> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem setProperties:(NSDictionary*)[params objectAtIndex:0] methodResult:methodResult ];
    [caller_params release];
}


+(void) setProperties:(WifiConfig_setProperties_caller_params*)caller_params {
    [[WifiConfig_setProperties_caller getSharedInstance] command_setProperties:caller_params];
}

+(void) setProperties_in_thread:(WifiConfig_setProperties_caller_params*)caller_params {
    [[WifiConfig_setProperties_caller getSharedInstance] performSelectorInBackground:@selector(command_setProperties:) withObject:caller_params];
}

+(void) setProperties_in_UI_thread:(WifiConfig_setProperties_caller_params*)caller_params {
    [[WifiConfig_setProperties_caller getSharedInstance] performSelectorOnMainThread:@selector(command_setProperties:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_WifiConfig_setProperties_Obj(rho::json::CJSONArray& argv, id<IWifiConfig>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[1+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"WifiConfig::setProperties"];

    
    static RHO_API_PARAM rho_api_params[] = { {RHO_API_HASH, 0, "propertyMap", 0, 0 } };

    
    BOOL is_factory_param[] = { NO, NO };

    int i;

    // init
    for (i = 0; i < (1); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (1); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = WifiConfig_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                NSLog(@"WifiConfig::setProperties parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(1)];
    for (i = 0 ; i < (1); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [WifiConfig_setProperties_caller setProperties_in_thread:[WifiConfig_setProperties_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    else {
        // we do not have callback
        
        [WifiConfig_setProperties_caller setProperties:[WifiConfig_setProperties_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    return resValue;
}


rho::String js_WifiConfig_setProperties(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IWifiConfig> item = WifiConfig_makeInstanceByJSObject(strObjID);
    return js_WifiConfig_setProperties_Obj(argv, item, strCallbackID, strJsVmID, strCallbackParam);

}

rho::String js_s_WifiConfig_def_setProperties(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {
    id<IWifiConfigFactory> factory = [WifiConfigFactorySingleton getWifiConfigFactoryInstance];
    id<IWifiConfigSingleton> singleton = [factory getWifiConfigSingleton];

    NSString* defID = [singleton getDefaultID];

    id<IWifiConfig> item = [factory getWifiConfigByID:defID];
    return js_WifiConfig_setProperties_Obj(argv, item, strCallbackID, strJsVmID, strCallbackParam);
}







rho::String js_s_WifiConfig_getDefaultID(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    id<IWifiConfigFactory> factory = [WifiConfigFactorySingleton getWifiConfigFactoryInstance];
    id<IWifiConfigSingleton> singleton = [factory getWifiConfigSingleton];

    NSString* defID = [singleton getDefaultID];

    rho::String res =  [[CJSConverter convertToJS:defID level:0] UTF8String];

    return res;
}

rho::String js_s_WifiConfig_getDefault(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    id<IWifiConfigFactory> factory = [WifiConfigFactorySingleton getWifiConfigFactoryInstance];
    id<IWifiConfigSingleton> singleton = [factory getWifiConfigSingleton];

    NSString* defID = [singleton getDefaultID];

    rho::String res =  [[CJSConverter convertToJS:[CRhoAPIClassInstance rubyClassByName:@"Rho.WifiConfig" instanceID:defID] level:0] UTF8String];

    return res;
}

rho::String js_s_WifiConfig_setDefaultID(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    id<IWifiConfigFactory> factory = [WifiConfigFactorySingleton getWifiConfigFactoryInstance];
    id<IWifiConfigSingleton> singleton = [factory getWifiConfigSingleton];

    [singleton setDefaultID:[NSString stringWithUTF8String:(strObjID.c_str())]];

    [[CJSConverter convertToJS:nil level:0] UTF8String];
}



