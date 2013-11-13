#import "IExternalstorage.h"
//#import "api_generator/common/ruby_helpers.h"

#include "api_generator/js_helpers.h"

#import "api_generator/iphone/CMethodResult.h"
#import "api_generator/iphone/CJSConverter.h"

extern VALUE getRuby_Externalstorage_Module();



id<IExternalstorage> Externalstorage_makeInstanceByJSObject(rho::String sid) {
    const char* szID = sid.c_str();
    id<IExternalstorageFactory> factory = [ExternalstorageFactorySingleton getExternalstorageFactoryInstance];
    return [factory getExternalstorageByID:[NSString stringWithUTF8String:szID]];
}









@interface Externalstorage_getSDPath_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IExternalstorageSingleton> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(Externalstorage_getSDPath_caller_params*) makeParams:(NSArray*)_params _item:(id<IExternalstorageSingleton>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation Externalstorage_getSDPath_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(Externalstorage_getSDPath_caller_params*) makeParams:(NSArray*)_params _item:(id<IExternalstorageSingleton>)_item _methodResult:(CMethodResult*)_methodResult {
    Externalstorage_getSDPath_caller_params* par = [[Externalstorage_getSDPath_caller_params alloc] init];
    par.params = _params;
    par.item = _item;
    par.methodResult = _methodResult;
    return [par retain];
}

@end


@interface Externalstorage_getSDPath_caller : NSObject {

}
+(Externalstorage_getSDPath_caller*) getSharedInstance;
+(void) getSDPath:(Externalstorage_getSDPath_caller_params*)caller_params;
+(void) getSDPath_in_thread:(Externalstorage_getSDPath_caller_params*)caller_params;
+(void) getSDPath_in_UI_thread:(Externalstorage_getSDPath_caller_params*)caller_params;

@end

static Externalstorage_getSDPath_caller* our_Externalstorage_getSDPath_caller = nil;

@implementation Externalstorage_getSDPath_caller

+(Externalstorage_getSDPath_caller*) getSharedInstance {
    if (our_Externalstorage_getSDPath_caller == nil) {
        our_Externalstorage_getSDPath_caller = [[Externalstorage_getSDPath_caller alloc] init];
    }
    return our_Externalstorage_getSDPath_caller;
}

-(void) command_getSDPath:(Externalstorage_getSDPath_caller_params*)caller_params {
    NSArray* params = caller_params.params;
    id<IExternalstorageSingleton> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem getSDPath:methodResult ];
    [caller_params release];
}


+(void) getSDPath:(Externalstorage_getSDPath_caller_params*)caller_params {
    [[Externalstorage_getSDPath_caller getSharedInstance] command_getSDPath:caller_params];
}

+(void) getSDPath_in_thread:(Externalstorage_getSDPath_caller_params*)caller_params {
    [[Externalstorage_getSDPath_caller getSharedInstance] performSelectorInBackground:@selector(command_getSDPath:) withObject:caller_params];
}

+(void) getSDPath_in_UI_thread:(Externalstorage_getSDPath_caller_params*)caller_params {
    [[Externalstorage_getSDPath_caller getSharedInstance] performSelectorOnMainThread:@selector(command_getSDPath:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_Externalstorage_getSDPath_Obj(rho::json::CJSONArray& argv, id<IExternalstorageSingleton>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[0+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"Externalstorage::getSDPath"];

    
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
                params[i] = Externalstorage_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                NSLog(@"Externalstorage::getSDPath parameter %d is nil!", i);
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
        
        [Externalstorage_getSDPath_caller getSDPath_in_thread:[Externalstorage_getSDPath_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    else {
        // we do not have callback
        
        [Externalstorage_getSDPath_caller getSDPath:[Externalstorage_getSDPath_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    return resValue;
}


rho::String js_s_Externalstorage_getSDPath(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IExternalstorageFactory> factory = [ExternalstorageFactorySingleton getExternalstorageFactoryInstance];
    id<IExternalstorageSingleton> singleton = [factory getExternalstorageSingleton];
    return js_Externalstorage_getSDPath_Obj(argv, singleton, strCallbackID, strJsVmID, strCallbackParam);

}









