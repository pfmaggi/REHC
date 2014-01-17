#import "IWifiConfig.h"
//#import "api_generator/common/ruby_helpers.h"

#import "ruby/ext/rho/rhoruby.h"
#import "api_generator/iphone/CMethodResult.h"
#import "api_generator/iphone/CRubyConverter.h"

extern VALUE getRuby_WifiConfig_Module();



@interface WifiConfig_RubyValueFactory : NSObject<IMethodResult_RubyObjectFactory> {
}

- (VALUE) makeRubyValue:(NSObject*)obj;
+ (WifiConfig_RubyValueFactory*) getSharedInstance;

@end

static WifiConfig_RubyValueFactory* our_WifiConfig_RubyValueFactory = nil;

@implementation WifiConfig_RubyValueFactory

- (VALUE) makeRubyValue:(NSObject*)obj {
    VALUE v = rho_ruby_get_NIL();
    if ([obj isKindOfClass:[NSString class]]) {
        // single objects id
        NSString* strRes = (NSString*)obj;
        v = rho_ruby_create_object_with_id( getRuby_WifiConfig_Module(), [strRes UTF8String] );
    }
    else if ([obj isKindOfClass:[NSArray class]]) {
        // list of IDs
        v = rho_ruby_create_array();
        NSArray* arrRes = (NSArray*)obj;
        int i;
        for (i = 0; i < [arrRes count]; i++) {
            NSString* strItem = (NSString*)[arrRes objectAtIndex:i];
            VALUE vItem = rho_ruby_create_object_with_id( getRuby_WifiConfig_Module(), [strItem UTF8String] );
            rho_ruby_add_to_array(v, vItem);
        }
    }
    return v;
}

+ (WifiConfig_RubyValueFactory*) getSharedInstance {
    if (our_WifiConfig_RubyValueFactory == nil) {
        our_WifiConfig_RubyValueFactory = [[WifiConfig_RubyValueFactory alloc] init];
    }
    return our_WifiConfig_RubyValueFactory;
}

@end


id<IWifiConfig> WifiConfig_makeInstanceByRubyObject(VALUE obj) {
    const char* szID = rho_ruby_get_object_id( obj );
    id<IWifiConfigFactory> factory = [WifiConfigFactorySingleton getWifiConfigFactoryInstance];
    return [factory getWifiConfigByID:[NSString stringWithUTF8String:szID]];
}









@interface rb_WifiConfig_getSimpleStringProperty_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IWifiConfig> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(rb_WifiConfig_getSimpleStringProperty_caller_params*) makeParams:(NSArray*)_params _item:(id<IWifiConfig>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation rb_WifiConfig_getSimpleStringProperty_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(rb_WifiConfig_getSimpleStringProperty_caller_params*) makeParams:(NSArray*)_params _item:(id<IWifiConfig>)_item _methodResult:(CMethodResult*)_methodResult {
    rb_WifiConfig_getSimpleStringProperty_caller_params* par = [[rb_WifiConfig_getSimpleStringProperty_caller_params alloc] init];
    par.params = _params;
    par.item = _item;
    par.methodResult = _methodResult;
    return [par retain];
}

@end


@interface rb_WifiConfig_getSimpleStringProperty_caller : NSObject {

}
+(rb_WifiConfig_getSimpleStringProperty_caller*) getSharedInstance;
+(void) getSimpleStringProperty:(rb_WifiConfig_getSimpleStringProperty_caller_params*)caller_params;
+(void) getSimpleStringProperty_in_thread:(rb_WifiConfig_getSimpleStringProperty_caller_params*)caller_params;
+(void) getSimpleStringProperty_in_UI_thread:(rb_WifiConfig_getSimpleStringProperty_caller_params*)caller_params;

@end

static rb_WifiConfig_getSimpleStringProperty_caller* our_WifiConfig_getSimpleStringProperty_caller = nil;

@implementation rb_WifiConfig_getSimpleStringProperty_caller

+(rb_WifiConfig_getSimpleStringProperty_caller*) getSharedInstance {
    if (our_WifiConfig_getSimpleStringProperty_caller == nil) {
        our_WifiConfig_getSimpleStringProperty_caller = [[rb_WifiConfig_getSimpleStringProperty_caller alloc] init];
    }
    return our_WifiConfig_getSimpleStringProperty_caller;
}

-(void) command_getSimpleStringProperty:(rb_WifiConfig_getSimpleStringProperty_caller_params*)caller_params {
    NSArray* params = caller_params.params;
    id<IWifiConfig> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem getSimpleStringProperty:methodResult ];
    [caller_params release];
}

+(void) getSimpleStringProperty:(rb_WifiConfig_getSimpleStringProperty_caller_params*)caller_params {
    [[rb_WifiConfig_getSimpleStringProperty_caller getSharedInstance] command_getSimpleStringProperty:caller_params];
}

+(void) getSimpleStringProperty_in_thread:(rb_WifiConfig_getSimpleStringProperty_caller_params*)caller_params {
    [[rb_WifiConfig_getSimpleStringProperty_caller getSharedInstance] performSelectorInBackground:@selector(command_getSimpleStringProperty:) withObject:caller_params];
}

+(void) getSimpleStringProperty_in_UI_thread:(rb_WifiConfig_getSimpleStringProperty_caller_params*)caller_params {
    [[rb_WifiConfig_getSimpleStringProperty_caller getSharedInstance] performSelectorOnMainThread:@selector(command_getSimpleStringProperty:) withObject:caller_params waitUntilDone:NO];
}


@end


VALUE rb_WifiConfig_getSimpleStringProperty_Obj(int argc, VALUE *argv, id<IWifiConfig>objItem) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[0+1];
    NSString* callbackURL = nil;
    unsigned long callbackMethod = 0;
    NSString* callbackParam = nil;
    BOOL method_return_result = YES;

    [methodResult setMethodSignature:@"WifiConfig::simpleStringProperty"];

    
    BOOL is_factory_param[] = { NO };

    int i;

    // init
    for (i = 0; i < (0); i++) {
        params[i] = [NSNull null];
    }

    

    // enumerate params
    for (int i = 0; i < (0); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = WifiConfig_makeInstanceByRubyObject(argv[i]);
            }
            else {
                params[i] = [[CRubyConverter convertFromRuby:argv[i]] retain];
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(0)];
    for (i = 0 ; i < (0); i++) {
        [params_array addObject:params[i]];
    }

    
    // check callback
    if (argc >= (0+1)) {
        VALUE callback = argv[0];
        if (rho_ruby_is_string(callback)) {
            callbackURL = [((NSString*)[CRubyConverter convertFromRuby:callback]) retain];
        }
        else if (rho_ruby_is_proc(callback) || rho_ruby_is_method(callback)) {
            callbackMethod = callback;
        }
    }
    // check callback param
    if (argc >= (0+2)) {
        VALUE callback_param = argv[0+1];
        if (rho_ruby_is_string(callback_param)) {
            callbackParam = [((NSString*)[CRubyConverter convertFromRuby:callback_param]) retain];
        }
    }
    

    
    


    if ((callbackURL != nil) || (callbackMethod != 0)) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        if (callbackURL != nil)
            [methodResult setRubyCallback:callbackURL];
        if (callbackMethod != 0)
            [methodResult setRubyCallbackMethod:callbackMethod];
        if (callbackParam != nil) {
            [methodResult setCallbackParam:callbackParam];
        }
        
        [rb_WifiConfig_getSimpleStringProperty_caller getSimpleStringProperty_in_thread:[rb_WifiConfig_getSimpleStringProperty_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    else {
        // we do not have callback
        
        [rb_WifiConfig_getSimpleStringProperty_caller getSimpleStringProperty:[rb_WifiConfig_getSimpleStringProperty_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    VALUE resValue = rho_ruby_get_NIL();
    if ((callbackURL == nil) && (callbackMethod == 0) && (method_return_result)) {
        resValue = [methodResult toRuby];
    }
    return resValue;
}


VALUE rb_WifiConfig_getSimpleStringProperty(int argc, VALUE *argv, VALUE obj) {

    id<IWifiConfig> item = WifiConfig_makeInstanceByRubyObject(obj);
    return rb_WifiConfig_getSimpleStringProperty_Obj(argc, argv, item);

}

VALUE rb_s_WifiConfig_def_getSimpleStringProperty(int argc, VALUE *argv) {
    id<IWifiConfigFactory> factory = [WifiConfigFactorySingleton getWifiConfigFactoryInstance];
    id<IWifiConfigSingleton> singleton = [factory getWifiConfigSingleton];

    NSString* defID = [singleton getDefaultID];

    id<IWifiConfig> item = [factory getWifiConfigByID:defID];
    return rb_WifiConfig_getSimpleStringProperty_Obj(argc, argv, item);
}







@interface rb_WifiConfig_setSimpleStringProperty_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IWifiConfig> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(rb_WifiConfig_setSimpleStringProperty_caller_params*) makeParams:(NSArray*)_params _item:(id<IWifiConfig>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation rb_WifiConfig_setSimpleStringProperty_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(rb_WifiConfig_setSimpleStringProperty_caller_params*) makeParams:(NSArray*)_params _item:(id<IWifiConfig>)_item _methodResult:(CMethodResult*)_methodResult {
    rb_WifiConfig_setSimpleStringProperty_caller_params* par = [[rb_WifiConfig_setSimpleStringProperty_caller_params alloc] init];
    par.params = _params;
    par.item = _item;
    par.methodResult = _methodResult;
    return [par retain];
}

@end


@interface rb_WifiConfig_setSimpleStringProperty_caller : NSObject {

}
+(rb_WifiConfig_setSimpleStringProperty_caller*) getSharedInstance;
+(void) setSimpleStringProperty:(rb_WifiConfig_setSimpleStringProperty_caller_params*)caller_params;
+(void) setSimpleStringProperty_in_thread:(rb_WifiConfig_setSimpleStringProperty_caller_params*)caller_params;
+(void) setSimpleStringProperty_in_UI_thread:(rb_WifiConfig_setSimpleStringProperty_caller_params*)caller_params;

@end

static rb_WifiConfig_setSimpleStringProperty_caller* our_WifiConfig_setSimpleStringProperty_caller = nil;

@implementation rb_WifiConfig_setSimpleStringProperty_caller

+(rb_WifiConfig_setSimpleStringProperty_caller*) getSharedInstance {
    if (our_WifiConfig_setSimpleStringProperty_caller == nil) {
        our_WifiConfig_setSimpleStringProperty_caller = [[rb_WifiConfig_setSimpleStringProperty_caller alloc] init];
    }
    return our_WifiConfig_setSimpleStringProperty_caller;
}

-(void) command_setSimpleStringProperty:(rb_WifiConfig_setSimpleStringProperty_caller_params*)caller_params {
    NSArray* params = caller_params.params;
    id<IWifiConfig> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem setSimpleStringProperty:(NSString*)[params objectAtIndex:0] methodResult:methodResult ];
    [caller_params release];
}

+(void) setSimpleStringProperty:(rb_WifiConfig_setSimpleStringProperty_caller_params*)caller_params {
    [[rb_WifiConfig_setSimpleStringProperty_caller getSharedInstance] command_setSimpleStringProperty:caller_params];
}

+(void) setSimpleStringProperty_in_thread:(rb_WifiConfig_setSimpleStringProperty_caller_params*)caller_params {
    [[rb_WifiConfig_setSimpleStringProperty_caller getSharedInstance] performSelectorInBackground:@selector(command_setSimpleStringProperty:) withObject:caller_params];
}

+(void) setSimpleStringProperty_in_UI_thread:(rb_WifiConfig_setSimpleStringProperty_caller_params*)caller_params {
    [[rb_WifiConfig_setSimpleStringProperty_caller getSharedInstance] performSelectorOnMainThread:@selector(command_setSimpleStringProperty:) withObject:caller_params waitUntilDone:NO];
}


@end


VALUE rb_WifiConfig_setSimpleStringProperty_Obj(int argc, VALUE *argv, id<IWifiConfig>objItem) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[1+1];
    NSString* callbackURL = nil;
    unsigned long callbackMethod = 0;
    NSString* callbackParam = nil;
    BOOL method_return_result = YES;

    [methodResult setMethodSignature:@"WifiConfig::simpleStringProperty="];

    
    BOOL is_factory_param[] = { NO, NO };

    int i;

    // init
    for (i = 0; i < (1); i++) {
        params[i] = [NSNull null];
    }

    

    // enumerate params
    for (int i = 0; i < (1); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = WifiConfig_makeInstanceByRubyObject(argv[i]);
            }
            else {
                params[i] = [[CRubyConverter convertFromRuby:argv[i]] retain];
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(1)];
    for (i = 0 ; i < (1); i++) {
        [params_array addObject:params[i]];
    }

    
    // check callback
    if (argc >= (1+1)) {
        VALUE callback = argv[1];
        if (rho_ruby_is_string(callback)) {
            callbackURL = [((NSString*)[CRubyConverter convertFromRuby:callback]) retain];
        }
        else if (rho_ruby_is_proc(callback) || rho_ruby_is_method(callback)) {
            callbackMethod = callback;
        }
    }
    // check callback param
    if (argc >= (1+2)) {
        VALUE callback_param = argv[1+1];
        if (rho_ruby_is_string(callback_param)) {
            callbackParam = [((NSString*)[CRubyConverter convertFromRuby:callback_param]) retain];
        }
    }
    

    
    


    if ((callbackURL != nil) || (callbackMethod != 0)) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        if (callbackURL != nil)
            [methodResult setRubyCallback:callbackURL];
        if (callbackMethod != 0)
            [methodResult setRubyCallbackMethod:callbackMethod];
        if (callbackParam != nil) {
            [methodResult setCallbackParam:callbackParam];
        }
        
        [rb_WifiConfig_setSimpleStringProperty_caller setSimpleStringProperty_in_thread:[rb_WifiConfig_setSimpleStringProperty_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    else {
        // we do not have callback
        
        [rb_WifiConfig_setSimpleStringProperty_caller setSimpleStringProperty:[rb_WifiConfig_setSimpleStringProperty_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    VALUE resValue = rho_ruby_get_NIL();
    if ((callbackURL == nil) && (callbackMethod == 0) && (method_return_result)) {
        resValue = [methodResult toRuby];
    }
    return resValue;
}


VALUE rb_WifiConfig_setSimpleStringProperty(int argc, VALUE *argv, VALUE obj) {

    id<IWifiConfig> item = WifiConfig_makeInstanceByRubyObject(obj);
    return rb_WifiConfig_setSimpleStringProperty_Obj(argc, argv, item);

}

VALUE rb_s_WifiConfig_def_setSimpleStringProperty(int argc, VALUE *argv) {
    id<IWifiConfigFactory> factory = [WifiConfigFactorySingleton getWifiConfigFactoryInstance];
    id<IWifiConfigSingleton> singleton = [factory getWifiConfigSingleton];

    NSString* defID = [singleton getDefaultID];

    id<IWifiConfig> item = [factory getWifiConfigByID:defID];
    return rb_WifiConfig_setSimpleStringProperty_Obj(argc, argv, item);
}







@interface rb_WifiConfig_enumerate_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IWifiConfigSingleton> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(rb_WifiConfig_enumerate_caller_params*) makeParams:(NSArray*)_params _item:(id<IWifiConfigSingleton>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation rb_WifiConfig_enumerate_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(rb_WifiConfig_enumerate_caller_params*) makeParams:(NSArray*)_params _item:(id<IWifiConfigSingleton>)_item _methodResult:(CMethodResult*)_methodResult {
    rb_WifiConfig_enumerate_caller_params* par = [[rb_WifiConfig_enumerate_caller_params alloc] init];
    par.params = _params;
    par.item = _item;
    par.methodResult = _methodResult;
    return [par retain];
}

@end


@interface rb_WifiConfig_enumerate_caller : NSObject {

}
+(rb_WifiConfig_enumerate_caller*) getSharedInstance;
+(void) enumerate:(rb_WifiConfig_enumerate_caller_params*)caller_params;
+(void) enumerate_in_thread:(rb_WifiConfig_enumerate_caller_params*)caller_params;
+(void) enumerate_in_UI_thread:(rb_WifiConfig_enumerate_caller_params*)caller_params;

@end

static rb_WifiConfig_enumerate_caller* our_WifiConfig_enumerate_caller = nil;

@implementation rb_WifiConfig_enumerate_caller

+(rb_WifiConfig_enumerate_caller*) getSharedInstance {
    if (our_WifiConfig_enumerate_caller == nil) {
        our_WifiConfig_enumerate_caller = [[rb_WifiConfig_enumerate_caller alloc] init];
    }
    return our_WifiConfig_enumerate_caller;
}

-(void) command_enumerate:(rb_WifiConfig_enumerate_caller_params*)caller_params {
    NSArray* params = caller_params.params;
    id<IWifiConfigSingleton> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem enumerate:methodResult ];
    [caller_params release];
}

+(void) enumerate:(rb_WifiConfig_enumerate_caller_params*)caller_params {
    [[rb_WifiConfig_enumerate_caller getSharedInstance] command_enumerate:caller_params];
}

+(void) enumerate_in_thread:(rb_WifiConfig_enumerate_caller_params*)caller_params {
    [[rb_WifiConfig_enumerate_caller getSharedInstance] performSelectorInBackground:@selector(command_enumerate:) withObject:caller_params];
}

+(void) enumerate_in_UI_thread:(rb_WifiConfig_enumerate_caller_params*)caller_params {
    [[rb_WifiConfig_enumerate_caller getSharedInstance] performSelectorOnMainThread:@selector(command_enumerate:) withObject:caller_params waitUntilDone:NO];
}


@end


VALUE rb_WifiConfig_enumerate_Obj(int argc, VALUE *argv, id<IWifiConfigSingleton>objItem) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[0+1];
    NSString* callbackURL = nil;
    unsigned long callbackMethod = 0;
    NSString* callbackParam = nil;
    BOOL method_return_result = YES;

    [methodResult setMethodSignature:@"WifiConfig::enumerate"];

    
    BOOL is_factory_param[] = { NO };

    int i;

    // init
    for (i = 0; i < (0); i++) {
        params[i] = [NSNull null];
    }

    

    // enumerate params
    for (int i = 0; i < (0); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = WifiConfig_makeInstanceByRubyObject(argv[i]);
            }
            else {
                params[i] = [[CRubyConverter convertFromRuby:argv[i]] retain];
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(0)];
    for (i = 0 ; i < (0); i++) {
        [params_array addObject:params[i]];
    }

    
    // check callback
    if (argc >= (0+1)) {
        VALUE callback = argv[0];
        if (rho_ruby_is_string(callback)) {
            callbackURL = [((NSString*)[CRubyConverter convertFromRuby:callback]) retain];
        }
        else if (rho_ruby_is_proc(callback) || rho_ruby_is_method(callback)) {
            callbackMethod = callback;
        }
    }
    // check callback param
    if (argc >= (0+2)) {
        VALUE callback_param = argv[0+1];
        if (rho_ruby_is_string(callback_param)) {
            callbackParam = [((NSString*)[CRubyConverter convertFromRuby:callback_param]) retain];
        }
    }
    

    
    [methodResult enableObjectCreationModeWithRubyClassPath:@"Rho.WifiConfig"];


    if ((callbackURL != nil) || (callbackMethod != 0)) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        if (callbackURL != nil)
            [methodResult setRubyCallback:callbackURL];
        if (callbackMethod != 0)
            [methodResult setRubyCallbackMethod:callbackMethod];
        if (callbackParam != nil) {
            [methodResult setCallbackParam:callbackParam];
        }
        
        [rb_WifiConfig_enumerate_caller enumerate_in_thread:[rb_WifiConfig_enumerate_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    else {
        // we do not have callback
        
        [rb_WifiConfig_enumerate_caller enumerate:[rb_WifiConfig_enumerate_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    VALUE resValue = rho_ruby_get_NIL();
    if ((callbackURL == nil) && (callbackMethod == 0) && (method_return_result)) {
        resValue = [methodResult toRuby];
    }
    return resValue;
}


VALUE rb_s_WifiConfig_enumerate(int argc, VALUE *argv) {

    id<IWifiConfigFactory> factory = [WifiConfigFactorySingleton getWifiConfigFactoryInstance];
    id<IWifiConfigSingleton> singleton = [factory getWifiConfigSingleton];
    return rb_WifiConfig_enumerate_Obj(argc, argv, singleton);

}







@interface rb_WifiConfig_get_EAP_Identity_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IWifiConfig> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(rb_WifiConfig_get_EAP_Identity_caller_params*) makeParams:(NSArray*)_params _item:(id<IWifiConfig>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation rb_WifiConfig_get_EAP_Identity_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(rb_WifiConfig_get_EAP_Identity_caller_params*) makeParams:(NSArray*)_params _item:(id<IWifiConfig>)_item _methodResult:(CMethodResult*)_methodResult {
    rb_WifiConfig_get_EAP_Identity_caller_params* par = [[rb_WifiConfig_get_EAP_Identity_caller_params alloc] init];
    par.params = _params;
    par.item = _item;
    par.methodResult = _methodResult;
    return [par retain];
}

@end


@interface rb_WifiConfig_get_EAP_Identity_caller : NSObject {

}
+(rb_WifiConfig_get_EAP_Identity_caller*) getSharedInstance;
+(void) get_EAP_Identity:(rb_WifiConfig_get_EAP_Identity_caller_params*)caller_params;
+(void) get_EAP_Identity_in_thread:(rb_WifiConfig_get_EAP_Identity_caller_params*)caller_params;
+(void) get_EAP_Identity_in_UI_thread:(rb_WifiConfig_get_EAP_Identity_caller_params*)caller_params;

@end

static rb_WifiConfig_get_EAP_Identity_caller* our_WifiConfig_get_EAP_Identity_caller = nil;

@implementation rb_WifiConfig_get_EAP_Identity_caller

+(rb_WifiConfig_get_EAP_Identity_caller*) getSharedInstance {
    if (our_WifiConfig_get_EAP_Identity_caller == nil) {
        our_WifiConfig_get_EAP_Identity_caller = [[rb_WifiConfig_get_EAP_Identity_caller alloc] init];
    }
    return our_WifiConfig_get_EAP_Identity_caller;
}

-(void) command_get_EAP_Identity:(rb_WifiConfig_get_EAP_Identity_caller_params*)caller_params {
    NSArray* params = caller_params.params;
    id<IWifiConfig> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem get_EAP_Identity:(NSString*)[params objectAtIndex:0] methodResult:methodResult ];
    [caller_params release];
}

+(void) get_EAP_Identity:(rb_WifiConfig_get_EAP_Identity_caller_params*)caller_params {
    [[rb_WifiConfig_get_EAP_Identity_caller getSharedInstance] command_get_EAP_Identity:caller_params];
}

+(void) get_EAP_Identity_in_thread:(rb_WifiConfig_get_EAP_Identity_caller_params*)caller_params {
    [[rb_WifiConfig_get_EAP_Identity_caller getSharedInstance] performSelectorInBackground:@selector(command_get_EAP_Identity:) withObject:caller_params];
}

+(void) get_EAP_Identity_in_UI_thread:(rb_WifiConfig_get_EAP_Identity_caller_params*)caller_params {
    [[rb_WifiConfig_get_EAP_Identity_caller getSharedInstance] performSelectorOnMainThread:@selector(command_get_EAP_Identity:) withObject:caller_params waitUntilDone:NO];
}


@end


VALUE rb_WifiConfig_get_EAP_Identity_Obj(int argc, VALUE *argv, id<IWifiConfig>objItem) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[1+1];
    NSString* callbackURL = nil;
    unsigned long callbackMethod = 0;
    NSString* callbackParam = nil;
    BOOL method_return_result = YES;

    [methodResult setMethodSignature:@"WifiConfig::get_EAP_Identity"];

    
    BOOL is_factory_param[] = { NO, NO };

    int i;

    // init
    for (i = 0; i < (1); i++) {
        params[i] = [NSNull null];
    }

    

    // enumerate params
    for (int i = 0; i < (1); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = WifiConfig_makeInstanceByRubyObject(argv[i]);
            }
            else {
                params[i] = [[CRubyConverter convertFromRuby:argv[i]] retain];
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(1)];
    for (i = 0 ; i < (1); i++) {
        [params_array addObject:params[i]];
    }

    
    // check callback
    if (argc >= (1+1)) {
        VALUE callback = argv[1];
        if (rho_ruby_is_string(callback)) {
            callbackURL = [((NSString*)[CRubyConverter convertFromRuby:callback]) retain];
        }
        else if (rho_ruby_is_proc(callback) || rho_ruby_is_method(callback)) {
            callbackMethod = callback;
        }
    }
    // check callback param
    if (argc >= (1+2)) {
        VALUE callback_param = argv[1+1];
        if (rho_ruby_is_string(callback_param)) {
            callbackParam = [((NSString*)[CRubyConverter convertFromRuby:callback_param]) retain];
        }
    }
    

    
    


    if ((callbackURL != nil) || (callbackMethod != 0)) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        if (callbackURL != nil)
            [methodResult setRubyCallback:callbackURL];
        if (callbackMethod != 0)
            [methodResult setRubyCallbackMethod:callbackMethod];
        if (callbackParam != nil) {
            [methodResult setCallbackParam:callbackParam];
        }
        
        [rb_WifiConfig_get_EAP_Identity_caller get_EAP_Identity_in_thread:[rb_WifiConfig_get_EAP_Identity_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    else {
        // we do not have callback
        
        [rb_WifiConfig_get_EAP_Identity_caller get_EAP_Identity:[rb_WifiConfig_get_EAP_Identity_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    VALUE resValue = rho_ruby_get_NIL();
    if ((callbackURL == nil) && (callbackMethod == 0) && (method_return_result)) {
        resValue = [methodResult toRuby];
    }
    return resValue;
}


VALUE rb_WifiConfig_get_EAP_Identity(int argc, VALUE *argv, VALUE obj) {

    id<IWifiConfig> item = WifiConfig_makeInstanceByRubyObject(obj);
    return rb_WifiConfig_get_EAP_Identity_Obj(argc, argv, item);

}

VALUE rb_s_WifiConfig_def_get_EAP_Identity(int argc, VALUE *argv) {
    id<IWifiConfigFactory> factory = [WifiConfigFactorySingleton getWifiConfigFactoryInstance];
    id<IWifiConfigSingleton> singleton = [factory getWifiConfigSingleton];

    NSString* defID = [singleton getDefaultID];

    id<IWifiConfig> item = [factory getWifiConfigByID:defID];
    return rb_WifiConfig_get_EAP_Identity_Obj(argc, argv, item);
}







@interface rb_WifiConfig_getProperty_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IWifiConfig> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(rb_WifiConfig_getProperty_caller_params*) makeParams:(NSArray*)_params _item:(id<IWifiConfig>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation rb_WifiConfig_getProperty_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(rb_WifiConfig_getProperty_caller_params*) makeParams:(NSArray*)_params _item:(id<IWifiConfig>)_item _methodResult:(CMethodResult*)_methodResult {
    rb_WifiConfig_getProperty_caller_params* par = [[rb_WifiConfig_getProperty_caller_params alloc] init];
    par.params = _params;
    par.item = _item;
    par.methodResult = _methodResult;
    return [par retain];
}

@end


@interface rb_WifiConfig_getProperty_caller : NSObject {

}
+(rb_WifiConfig_getProperty_caller*) getSharedInstance;
+(void) getProperty:(rb_WifiConfig_getProperty_caller_params*)caller_params;
+(void) getProperty_in_thread:(rb_WifiConfig_getProperty_caller_params*)caller_params;
+(void) getProperty_in_UI_thread:(rb_WifiConfig_getProperty_caller_params*)caller_params;

@end

static rb_WifiConfig_getProperty_caller* our_WifiConfig_getProperty_caller = nil;

@implementation rb_WifiConfig_getProperty_caller

+(rb_WifiConfig_getProperty_caller*) getSharedInstance {
    if (our_WifiConfig_getProperty_caller == nil) {
        our_WifiConfig_getProperty_caller = [[rb_WifiConfig_getProperty_caller alloc] init];
    }
    return our_WifiConfig_getProperty_caller;
}

-(void) command_getProperty:(rb_WifiConfig_getProperty_caller_params*)caller_params {
    NSArray* params = caller_params.params;
    id<IWifiConfig> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem getProperty:(NSString*)[params objectAtIndex:0] methodResult:methodResult ];
    [caller_params release];
}

+(void) getProperty:(rb_WifiConfig_getProperty_caller_params*)caller_params {
    [[rb_WifiConfig_getProperty_caller getSharedInstance] command_getProperty:caller_params];
}

+(void) getProperty_in_thread:(rb_WifiConfig_getProperty_caller_params*)caller_params {
    [[rb_WifiConfig_getProperty_caller getSharedInstance] performSelectorInBackground:@selector(command_getProperty:) withObject:caller_params];
}

+(void) getProperty_in_UI_thread:(rb_WifiConfig_getProperty_caller_params*)caller_params {
    [[rb_WifiConfig_getProperty_caller getSharedInstance] performSelectorOnMainThread:@selector(command_getProperty:) withObject:caller_params waitUntilDone:NO];
}


@end


VALUE rb_WifiConfig_getProperty_Obj(int argc, VALUE *argv, id<IWifiConfig>objItem) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[1+1];
    NSString* callbackURL = nil;
    unsigned long callbackMethod = 0;
    NSString* callbackParam = nil;
    BOOL method_return_result = YES;

    [methodResult setMethodSignature:@"WifiConfig::getProperty"];

    
    BOOL is_factory_param[] = { NO, NO };

    int i;

    // init
    for (i = 0; i < (1); i++) {
        params[i] = [NSNull null];
    }

    

    // enumerate params
    for (int i = 0; i < (1); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = WifiConfig_makeInstanceByRubyObject(argv[i]);
            }
            else {
                params[i] = [[CRubyConverter convertFromRuby:argv[i]] retain];
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(1)];
    for (i = 0 ; i < (1); i++) {
        [params_array addObject:params[i]];
    }

    
    // check callback
    if (argc >= (1+1)) {
        VALUE callback = argv[1];
        if (rho_ruby_is_string(callback)) {
            callbackURL = [((NSString*)[CRubyConverter convertFromRuby:callback]) retain];
        }
        else if (rho_ruby_is_proc(callback) || rho_ruby_is_method(callback)) {
            callbackMethod = callback;
        }
    }
    // check callback param
    if (argc >= (1+2)) {
        VALUE callback_param = argv[1+1];
        if (rho_ruby_is_string(callback_param)) {
            callbackParam = [((NSString*)[CRubyConverter convertFromRuby:callback_param]) retain];
        }
    }
    

    
    


    if ((callbackURL != nil) || (callbackMethod != 0)) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        if (callbackURL != nil)
            [methodResult setRubyCallback:callbackURL];
        if (callbackMethod != 0)
            [methodResult setRubyCallbackMethod:callbackMethod];
        if (callbackParam != nil) {
            [methodResult setCallbackParam:callbackParam];
        }
        
        [rb_WifiConfig_getProperty_caller getProperty_in_thread:[rb_WifiConfig_getProperty_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    else {
        // we do not have callback
        
        [rb_WifiConfig_getProperty_caller getProperty:[rb_WifiConfig_getProperty_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    VALUE resValue = rho_ruby_get_NIL();
    if ((callbackURL == nil) && (callbackMethod == 0) && (method_return_result)) {
        resValue = [methodResult toRuby];
    }
    return resValue;
}


VALUE rb_WifiConfig_getProperty(int argc, VALUE *argv, VALUE obj) {

    id<IWifiConfig> item = WifiConfig_makeInstanceByRubyObject(obj);
    return rb_WifiConfig_getProperty_Obj(argc, argv, item);

}

VALUE rb_s_WifiConfig_def_getProperty(int argc, VALUE *argv) {
    id<IWifiConfigFactory> factory = [WifiConfigFactorySingleton getWifiConfigFactoryInstance];
    id<IWifiConfigSingleton> singleton = [factory getWifiConfigSingleton];

    NSString* defID = [singleton getDefaultID];

    id<IWifiConfig> item = [factory getWifiConfigByID:defID];
    return rb_WifiConfig_getProperty_Obj(argc, argv, item);
}







@interface rb_WifiConfig_getProperties_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IWifiConfig> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(rb_WifiConfig_getProperties_caller_params*) makeParams:(NSArray*)_params _item:(id<IWifiConfig>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation rb_WifiConfig_getProperties_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(rb_WifiConfig_getProperties_caller_params*) makeParams:(NSArray*)_params _item:(id<IWifiConfig>)_item _methodResult:(CMethodResult*)_methodResult {
    rb_WifiConfig_getProperties_caller_params* par = [[rb_WifiConfig_getProperties_caller_params alloc] init];
    par.params = _params;
    par.item = _item;
    par.methodResult = _methodResult;
    return [par retain];
}

@end


@interface rb_WifiConfig_getProperties_caller : NSObject {

}
+(rb_WifiConfig_getProperties_caller*) getSharedInstance;
+(void) getProperties:(rb_WifiConfig_getProperties_caller_params*)caller_params;
+(void) getProperties_in_thread:(rb_WifiConfig_getProperties_caller_params*)caller_params;
+(void) getProperties_in_UI_thread:(rb_WifiConfig_getProperties_caller_params*)caller_params;

@end

static rb_WifiConfig_getProperties_caller* our_WifiConfig_getProperties_caller = nil;

@implementation rb_WifiConfig_getProperties_caller

+(rb_WifiConfig_getProperties_caller*) getSharedInstance {
    if (our_WifiConfig_getProperties_caller == nil) {
        our_WifiConfig_getProperties_caller = [[rb_WifiConfig_getProperties_caller alloc] init];
    }
    return our_WifiConfig_getProperties_caller;
}

-(void) command_getProperties:(rb_WifiConfig_getProperties_caller_params*)caller_params {
    NSArray* params = caller_params.params;
    id<IWifiConfig> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem getProperties:(NSArray*)[params objectAtIndex:0] methodResult:methodResult ];
    [caller_params release];
}

+(void) getProperties:(rb_WifiConfig_getProperties_caller_params*)caller_params {
    [[rb_WifiConfig_getProperties_caller getSharedInstance] command_getProperties:caller_params];
}

+(void) getProperties_in_thread:(rb_WifiConfig_getProperties_caller_params*)caller_params {
    [[rb_WifiConfig_getProperties_caller getSharedInstance] performSelectorInBackground:@selector(command_getProperties:) withObject:caller_params];
}

+(void) getProperties_in_UI_thread:(rb_WifiConfig_getProperties_caller_params*)caller_params {
    [[rb_WifiConfig_getProperties_caller getSharedInstance] performSelectorOnMainThread:@selector(command_getProperties:) withObject:caller_params waitUntilDone:NO];
}


@end


VALUE rb_WifiConfig_getProperties_Obj(int argc, VALUE *argv, id<IWifiConfig>objItem) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[1+1];
    NSString* callbackURL = nil;
    unsigned long callbackMethod = 0;
    NSString* callbackParam = nil;
    BOOL method_return_result = YES;

    [methodResult setMethodSignature:@"WifiConfig::getProperties"];

    
    BOOL is_factory_param[] = { NO, NO };

    int i;

    // init
    for (i = 0; i < (1); i++) {
        params[i] = [NSNull null];
    }

    

    // enumerate params
    for (int i = 0; i < (1); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = WifiConfig_makeInstanceByRubyObject(argv[i]);
            }
            else {
                params[i] = [[CRubyConverter convertFromRuby:argv[i]] retain];
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(1)];
    for (i = 0 ; i < (1); i++) {
        [params_array addObject:params[i]];
    }

    
    // check callback
    if (argc >= (1+1)) {
        VALUE callback = argv[1];
        if (rho_ruby_is_string(callback)) {
            callbackURL = [((NSString*)[CRubyConverter convertFromRuby:callback]) retain];
        }
        else if (rho_ruby_is_proc(callback) || rho_ruby_is_method(callback)) {
            callbackMethod = callback;
        }
    }
    // check callback param
    if (argc >= (1+2)) {
        VALUE callback_param = argv[1+1];
        if (rho_ruby_is_string(callback_param)) {
            callbackParam = [((NSString*)[CRubyConverter convertFromRuby:callback_param]) retain];
        }
    }
    

    
    


    if ((callbackURL != nil) || (callbackMethod != 0)) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        if (callbackURL != nil)
            [methodResult setRubyCallback:callbackURL];
        if (callbackMethod != 0)
            [methodResult setRubyCallbackMethod:callbackMethod];
        if (callbackParam != nil) {
            [methodResult setCallbackParam:callbackParam];
        }
        
        [rb_WifiConfig_getProperties_caller getProperties_in_thread:[rb_WifiConfig_getProperties_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    else {
        // we do not have callback
        
        [rb_WifiConfig_getProperties_caller getProperties:[rb_WifiConfig_getProperties_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    VALUE resValue = rho_ruby_get_NIL();
    if ((callbackURL == nil) && (callbackMethod == 0) && (method_return_result)) {
        resValue = [methodResult toRuby];
    }
    return resValue;
}


VALUE rb_WifiConfig_getProperties(int argc, VALUE *argv, VALUE obj) {

    id<IWifiConfig> item = WifiConfig_makeInstanceByRubyObject(obj);
    return rb_WifiConfig_getProperties_Obj(argc, argv, item);

}

VALUE rb_s_WifiConfig_def_getProperties(int argc, VALUE *argv) {
    id<IWifiConfigFactory> factory = [WifiConfigFactorySingleton getWifiConfigFactoryInstance];
    id<IWifiConfigSingleton> singleton = [factory getWifiConfigSingleton];

    NSString* defID = [singleton getDefaultID];

    id<IWifiConfig> item = [factory getWifiConfigByID:defID];
    return rb_WifiConfig_getProperties_Obj(argc, argv, item);
}







@interface rb_WifiConfig_getAllProperties_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IWifiConfig> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(rb_WifiConfig_getAllProperties_caller_params*) makeParams:(NSArray*)_params _item:(id<IWifiConfig>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation rb_WifiConfig_getAllProperties_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(rb_WifiConfig_getAllProperties_caller_params*) makeParams:(NSArray*)_params _item:(id<IWifiConfig>)_item _methodResult:(CMethodResult*)_methodResult {
    rb_WifiConfig_getAllProperties_caller_params* par = [[rb_WifiConfig_getAllProperties_caller_params alloc] init];
    par.params = _params;
    par.item = _item;
    par.methodResult = _methodResult;
    return [par retain];
}

@end


@interface rb_WifiConfig_getAllProperties_caller : NSObject {

}
+(rb_WifiConfig_getAllProperties_caller*) getSharedInstance;
+(void) getAllProperties:(rb_WifiConfig_getAllProperties_caller_params*)caller_params;
+(void) getAllProperties_in_thread:(rb_WifiConfig_getAllProperties_caller_params*)caller_params;
+(void) getAllProperties_in_UI_thread:(rb_WifiConfig_getAllProperties_caller_params*)caller_params;

@end

static rb_WifiConfig_getAllProperties_caller* our_WifiConfig_getAllProperties_caller = nil;

@implementation rb_WifiConfig_getAllProperties_caller

+(rb_WifiConfig_getAllProperties_caller*) getSharedInstance {
    if (our_WifiConfig_getAllProperties_caller == nil) {
        our_WifiConfig_getAllProperties_caller = [[rb_WifiConfig_getAllProperties_caller alloc] init];
    }
    return our_WifiConfig_getAllProperties_caller;
}

-(void) command_getAllProperties:(rb_WifiConfig_getAllProperties_caller_params*)caller_params {
    NSArray* params = caller_params.params;
    id<IWifiConfig> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem getAllProperties:methodResult ];
    [caller_params release];
}

+(void) getAllProperties:(rb_WifiConfig_getAllProperties_caller_params*)caller_params {
    [[rb_WifiConfig_getAllProperties_caller getSharedInstance] command_getAllProperties:caller_params];
}

+(void) getAllProperties_in_thread:(rb_WifiConfig_getAllProperties_caller_params*)caller_params {
    [[rb_WifiConfig_getAllProperties_caller getSharedInstance] performSelectorInBackground:@selector(command_getAllProperties:) withObject:caller_params];
}

+(void) getAllProperties_in_UI_thread:(rb_WifiConfig_getAllProperties_caller_params*)caller_params {
    [[rb_WifiConfig_getAllProperties_caller getSharedInstance] performSelectorOnMainThread:@selector(command_getAllProperties:) withObject:caller_params waitUntilDone:NO];
}


@end


VALUE rb_WifiConfig_getAllProperties_Obj(int argc, VALUE *argv, id<IWifiConfig>objItem) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[0+1];
    NSString* callbackURL = nil;
    unsigned long callbackMethod = 0;
    NSString* callbackParam = nil;
    BOOL method_return_result = YES;

    [methodResult setMethodSignature:@"WifiConfig::getAllProperties"];

    
    BOOL is_factory_param[] = { NO };

    int i;

    // init
    for (i = 0; i < (0); i++) {
        params[i] = [NSNull null];
    }

    

    // enumerate params
    for (int i = 0; i < (0); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = WifiConfig_makeInstanceByRubyObject(argv[i]);
            }
            else {
                params[i] = [[CRubyConverter convertFromRuby:argv[i]] retain];
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(0)];
    for (i = 0 ; i < (0); i++) {
        [params_array addObject:params[i]];
    }

    
    // check callback
    if (argc >= (0+1)) {
        VALUE callback = argv[0];
        if (rho_ruby_is_string(callback)) {
            callbackURL = [((NSString*)[CRubyConverter convertFromRuby:callback]) retain];
        }
        else if (rho_ruby_is_proc(callback) || rho_ruby_is_method(callback)) {
            callbackMethod = callback;
        }
    }
    // check callback param
    if (argc >= (0+2)) {
        VALUE callback_param = argv[0+1];
        if (rho_ruby_is_string(callback_param)) {
            callbackParam = [((NSString*)[CRubyConverter convertFromRuby:callback_param]) retain];
        }
    }
    

    
    


    if ((callbackURL != nil) || (callbackMethod != 0)) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        if (callbackURL != nil)
            [methodResult setRubyCallback:callbackURL];
        if (callbackMethod != 0)
            [methodResult setRubyCallbackMethod:callbackMethod];
        if (callbackParam != nil) {
            [methodResult setCallbackParam:callbackParam];
        }
        
        [rb_WifiConfig_getAllProperties_caller getAllProperties_in_thread:[rb_WifiConfig_getAllProperties_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    else {
        // we do not have callback
        
        [rb_WifiConfig_getAllProperties_caller getAllProperties:[rb_WifiConfig_getAllProperties_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    VALUE resValue = rho_ruby_get_NIL();
    if ((callbackURL == nil) && (callbackMethod == 0) && (method_return_result)) {
        resValue = [methodResult toRuby];
    }
    return resValue;
}


VALUE rb_WifiConfig_getAllProperties(int argc, VALUE *argv, VALUE obj) {

    id<IWifiConfig> item = WifiConfig_makeInstanceByRubyObject(obj);
    return rb_WifiConfig_getAllProperties_Obj(argc, argv, item);

}

VALUE rb_s_WifiConfig_def_getAllProperties(int argc, VALUE *argv) {
    id<IWifiConfigFactory> factory = [WifiConfigFactorySingleton getWifiConfigFactoryInstance];
    id<IWifiConfigSingleton> singleton = [factory getWifiConfigSingleton];

    NSString* defID = [singleton getDefaultID];

    id<IWifiConfig> item = [factory getWifiConfigByID:defID];
    return rb_WifiConfig_getAllProperties_Obj(argc, argv, item);
}







@interface rb_WifiConfig_setProperty_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IWifiConfig> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(rb_WifiConfig_setProperty_caller_params*) makeParams:(NSArray*)_params _item:(id<IWifiConfig>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation rb_WifiConfig_setProperty_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(rb_WifiConfig_setProperty_caller_params*) makeParams:(NSArray*)_params _item:(id<IWifiConfig>)_item _methodResult:(CMethodResult*)_methodResult {
    rb_WifiConfig_setProperty_caller_params* par = [[rb_WifiConfig_setProperty_caller_params alloc] init];
    par.params = _params;
    par.item = _item;
    par.methodResult = _methodResult;
    return [par retain];
}

@end


@interface rb_WifiConfig_setProperty_caller : NSObject {

}
+(rb_WifiConfig_setProperty_caller*) getSharedInstance;
+(void) setProperty:(rb_WifiConfig_setProperty_caller_params*)caller_params;
+(void) setProperty_in_thread:(rb_WifiConfig_setProperty_caller_params*)caller_params;
+(void) setProperty_in_UI_thread:(rb_WifiConfig_setProperty_caller_params*)caller_params;

@end

static rb_WifiConfig_setProperty_caller* our_WifiConfig_setProperty_caller = nil;

@implementation rb_WifiConfig_setProperty_caller

+(rb_WifiConfig_setProperty_caller*) getSharedInstance {
    if (our_WifiConfig_setProperty_caller == nil) {
        our_WifiConfig_setProperty_caller = [[rb_WifiConfig_setProperty_caller alloc] init];
    }
    return our_WifiConfig_setProperty_caller;
}

-(void) command_setProperty:(rb_WifiConfig_setProperty_caller_params*)caller_params {
    NSArray* params = caller_params.params;
    id<IWifiConfig> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem setProperty:(NSString*)[params objectAtIndex:0] propertyValue:(NSString*)[params objectAtIndex:1] methodResult:methodResult ];
    [caller_params release];
}

+(void) setProperty:(rb_WifiConfig_setProperty_caller_params*)caller_params {
    [[rb_WifiConfig_setProperty_caller getSharedInstance] command_setProperty:caller_params];
}

+(void) setProperty_in_thread:(rb_WifiConfig_setProperty_caller_params*)caller_params {
    [[rb_WifiConfig_setProperty_caller getSharedInstance] performSelectorInBackground:@selector(command_setProperty:) withObject:caller_params];
}

+(void) setProperty_in_UI_thread:(rb_WifiConfig_setProperty_caller_params*)caller_params {
    [[rb_WifiConfig_setProperty_caller getSharedInstance] performSelectorOnMainThread:@selector(command_setProperty:) withObject:caller_params waitUntilDone:NO];
}


@end


VALUE rb_WifiConfig_setProperty_Obj(int argc, VALUE *argv, id<IWifiConfig>objItem) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[2+1];
    NSString* callbackURL = nil;
    unsigned long callbackMethod = 0;
    NSString* callbackParam = nil;
    BOOL method_return_result = YES;

    [methodResult setMethodSignature:@"WifiConfig::setProperty"];

    
    BOOL is_factory_param[] = { NO, NO, NO };

    int i;

    // init
    for (i = 0; i < (2); i++) {
        params[i] = [NSNull null];
    }

    

    // enumerate params
    for (int i = 0; i < (2); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = WifiConfig_makeInstanceByRubyObject(argv[i]);
            }
            else {
                params[i] = [[CRubyConverter convertFromRuby:argv[i]] retain];
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(2)];
    for (i = 0 ; i < (2); i++) {
        [params_array addObject:params[i]];
    }

    
    // check callback
    if (argc >= (2+1)) {
        VALUE callback = argv[2];
        if (rho_ruby_is_string(callback)) {
            callbackURL = [((NSString*)[CRubyConverter convertFromRuby:callback]) retain];
        }
        else if (rho_ruby_is_proc(callback) || rho_ruby_is_method(callback)) {
            callbackMethod = callback;
        }
    }
    // check callback param
    if (argc >= (2+2)) {
        VALUE callback_param = argv[2+1];
        if (rho_ruby_is_string(callback_param)) {
            callbackParam = [((NSString*)[CRubyConverter convertFromRuby:callback_param]) retain];
        }
    }
    

    
    


    if ((callbackURL != nil) || (callbackMethod != 0)) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        if (callbackURL != nil)
            [methodResult setRubyCallback:callbackURL];
        if (callbackMethod != 0)
            [methodResult setRubyCallbackMethod:callbackMethod];
        if (callbackParam != nil) {
            [methodResult setCallbackParam:callbackParam];
        }
        
        [rb_WifiConfig_setProperty_caller setProperty_in_thread:[rb_WifiConfig_setProperty_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    else {
        // we do not have callback
        
        [rb_WifiConfig_setProperty_caller setProperty:[rb_WifiConfig_setProperty_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    VALUE resValue = rho_ruby_get_NIL();
    if ((callbackURL == nil) && (callbackMethod == 0) && (method_return_result)) {
        resValue = [methodResult toRuby];
    }
    return resValue;
}


VALUE rb_WifiConfig_setProperty(int argc, VALUE *argv, VALUE obj) {

    id<IWifiConfig> item = WifiConfig_makeInstanceByRubyObject(obj);
    return rb_WifiConfig_setProperty_Obj(argc, argv, item);

}

VALUE rb_s_WifiConfig_def_setProperty(int argc, VALUE *argv) {
    id<IWifiConfigFactory> factory = [WifiConfigFactorySingleton getWifiConfigFactoryInstance];
    id<IWifiConfigSingleton> singleton = [factory getWifiConfigSingleton];

    NSString* defID = [singleton getDefaultID];

    id<IWifiConfig> item = [factory getWifiConfigByID:defID];
    return rb_WifiConfig_setProperty_Obj(argc, argv, item);
}







@interface rb_WifiConfig_setProperties_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IWifiConfig> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(rb_WifiConfig_setProperties_caller_params*) makeParams:(NSArray*)_params _item:(id<IWifiConfig>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation rb_WifiConfig_setProperties_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(rb_WifiConfig_setProperties_caller_params*) makeParams:(NSArray*)_params _item:(id<IWifiConfig>)_item _methodResult:(CMethodResult*)_methodResult {
    rb_WifiConfig_setProperties_caller_params* par = [[rb_WifiConfig_setProperties_caller_params alloc] init];
    par.params = _params;
    par.item = _item;
    par.methodResult = _methodResult;
    return [par retain];
}

@end


@interface rb_WifiConfig_setProperties_caller : NSObject {

}
+(rb_WifiConfig_setProperties_caller*) getSharedInstance;
+(void) setProperties:(rb_WifiConfig_setProperties_caller_params*)caller_params;
+(void) setProperties_in_thread:(rb_WifiConfig_setProperties_caller_params*)caller_params;
+(void) setProperties_in_UI_thread:(rb_WifiConfig_setProperties_caller_params*)caller_params;

@end

static rb_WifiConfig_setProperties_caller* our_WifiConfig_setProperties_caller = nil;

@implementation rb_WifiConfig_setProperties_caller

+(rb_WifiConfig_setProperties_caller*) getSharedInstance {
    if (our_WifiConfig_setProperties_caller == nil) {
        our_WifiConfig_setProperties_caller = [[rb_WifiConfig_setProperties_caller alloc] init];
    }
    return our_WifiConfig_setProperties_caller;
}

-(void) command_setProperties:(rb_WifiConfig_setProperties_caller_params*)caller_params {
    NSArray* params = caller_params.params;
    id<IWifiConfig> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem setProperties:(NSDictionary*)[params objectAtIndex:0] methodResult:methodResult ];
    [caller_params release];
}

+(void) setProperties:(rb_WifiConfig_setProperties_caller_params*)caller_params {
    [[rb_WifiConfig_setProperties_caller getSharedInstance] command_setProperties:caller_params];
}

+(void) setProperties_in_thread:(rb_WifiConfig_setProperties_caller_params*)caller_params {
    [[rb_WifiConfig_setProperties_caller getSharedInstance] performSelectorInBackground:@selector(command_setProperties:) withObject:caller_params];
}

+(void) setProperties_in_UI_thread:(rb_WifiConfig_setProperties_caller_params*)caller_params {
    [[rb_WifiConfig_setProperties_caller getSharedInstance] performSelectorOnMainThread:@selector(command_setProperties:) withObject:caller_params waitUntilDone:NO];
}


@end


VALUE rb_WifiConfig_setProperties_Obj(int argc, VALUE *argv, id<IWifiConfig>objItem) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[1+1];
    NSString* callbackURL = nil;
    unsigned long callbackMethod = 0;
    NSString* callbackParam = nil;
    BOOL method_return_result = YES;

    [methodResult setMethodSignature:@"WifiConfig::setProperties"];

    
    BOOL is_factory_param[] = { NO, NO };

    int i;

    // init
    for (i = 0; i < (1); i++) {
        params[i] = [NSNull null];
    }

    

    // enumerate params
    for (int i = 0; i < (1); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = WifiConfig_makeInstanceByRubyObject(argv[i]);
            }
            else {
                params[i] = [[CRubyConverter convertFromRuby:argv[i]] retain];
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(1)];
    for (i = 0 ; i < (1); i++) {
        [params_array addObject:params[i]];
    }

    
    // check callback
    if (argc >= (1+1)) {
        VALUE callback = argv[1];
        if (rho_ruby_is_string(callback)) {
            callbackURL = [((NSString*)[CRubyConverter convertFromRuby:callback]) retain];
        }
        else if (rho_ruby_is_proc(callback) || rho_ruby_is_method(callback)) {
            callbackMethod = callback;
        }
    }
    // check callback param
    if (argc >= (1+2)) {
        VALUE callback_param = argv[1+1];
        if (rho_ruby_is_string(callback_param)) {
            callbackParam = [((NSString*)[CRubyConverter convertFromRuby:callback_param]) retain];
        }
    }
    

    
    


    if ((callbackURL != nil) || (callbackMethod != 0)) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        if (callbackURL != nil)
            [methodResult setRubyCallback:callbackURL];
        if (callbackMethod != 0)
            [methodResult setRubyCallbackMethod:callbackMethod];
        if (callbackParam != nil) {
            [methodResult setCallbackParam:callbackParam];
        }
        
        [rb_WifiConfig_setProperties_caller setProperties_in_thread:[rb_WifiConfig_setProperties_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    else {
        // we do not have callback
        
        [rb_WifiConfig_setProperties_caller setProperties:[rb_WifiConfig_setProperties_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    VALUE resValue = rho_ruby_get_NIL();
    if ((callbackURL == nil) && (callbackMethod == 0) && (method_return_result)) {
        resValue = [methodResult toRuby];
    }
    return resValue;
}


VALUE rb_WifiConfig_setProperties(int argc, VALUE *argv, VALUE obj) {

    id<IWifiConfig> item = WifiConfig_makeInstanceByRubyObject(obj);
    return rb_WifiConfig_setProperties_Obj(argc, argv, item);

}

VALUE rb_s_WifiConfig_def_setProperties(int argc, VALUE *argv) {
    id<IWifiConfigFactory> factory = [WifiConfigFactorySingleton getWifiConfigFactoryInstance];
    id<IWifiConfigSingleton> singleton = [factory getWifiConfigSingleton];

    NSString* defID = [singleton getDefaultID];

    id<IWifiConfig> item = [factory getWifiConfigByID:defID];
    return rb_WifiConfig_setProperties_Obj(argc, argv, item);
}







VALUE rb_WifiConfig_s_default(VALUE klass)
{
    id<IWifiConfigFactory> factory = [WifiConfigFactorySingleton getWifiConfigFactoryInstance];
    id<IWifiConfigSingleton> singleton = [factory getWifiConfigSingleton];

    NSString* defID = [singleton getDefaultID];

    return rho_ruby_create_object_with_id( klass, [defID UTF8String] );
}

VALUE rb_WifiConfig_s_setDefault(VALUE klass, VALUE valObj)
{
    const char* szID = rho_ruby_get_object_id( valObj );
    id<IWifiConfigFactory> factory = [WifiConfigFactorySingleton getWifiConfigFactoryInstance];
    id<IWifiConfigSingleton> singleton = [factory getWifiConfigSingleton];

    [singleton setDefaultID:[NSString stringWithUTF8String:szID]];

    return rho_ruby_get_NIL();
}



