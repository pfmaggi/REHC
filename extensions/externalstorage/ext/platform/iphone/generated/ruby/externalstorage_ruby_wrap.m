#import "IExternalstorage.h"
//#import "api_generator/common/ruby_helpers.h"

#import "ruby/ext/rho/rhoruby.h"
#import "api_generator/iphone/CMethodResult.h"
#import "api_generator/iphone/CRubyConverter.h"

extern VALUE getRuby_Externalstorage_Module();



@interface Externalstorage_RubyValueFactory : NSObject<IMethodResult_RubyObjectFactory> {
}

- (VALUE) makeRubyValue:(NSObject*)obj;
+ (Externalstorage_RubyValueFactory*) getSharedInstance;

@end

static Externalstorage_RubyValueFactory* our_Externalstorage_RubyValueFactory = nil;

@implementation Externalstorage_RubyValueFactory

- (VALUE) makeRubyValue:(NSObject*)obj {
    VALUE v = rho_ruby_get_NIL();
    if ([obj isKindOfClass:[NSString class]]) {
        // single objects id
        NSString* strRes = (NSString*)obj;
        v = rho_ruby_create_object_with_id( getRuby_Externalstorage_Module(), [strRes UTF8String] );
    }
    else if ([obj isKindOfClass:[NSArray class]]) {
        // list of IDs
        v = rho_ruby_create_array();
        NSArray* arrRes = (NSArray*)obj;
        int i;
        for (i = 0; i < [arrRes count]; i++) {
            NSString* strItem = (NSString*)[arrRes objectAtIndex:i];
            VALUE vItem = rho_ruby_create_object_with_id( getRuby_Externalstorage_Module(), [strItem UTF8String] );
            rho_ruby_add_to_array(v, vItem);
        }
    }
    return v;
}

+ (Externalstorage_RubyValueFactory*) getSharedInstance {
    if (our_Externalstorage_RubyValueFactory == nil) {
        our_Externalstorage_RubyValueFactory = [[Externalstorage_RubyValueFactory alloc] init];
    }
    return our_Externalstorage_RubyValueFactory;
}

@end


id<IExternalstorage> Externalstorage_makeInstanceByRubyObject(VALUE obj) {
    const char* szID = rho_ruby_get_object_id( obj );
    id<IExternalstorageFactory> factory = [ExternalstorageFactorySingleton getExternalstorageFactoryInstance];
    return [factory getExternalstorageByID:[NSString stringWithUTF8String:szID]];
}









@interface rb_Externalstorage_getSDPath_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IExternalstorageSingleton> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(rb_Externalstorage_getSDPath_caller_params*) makeParams:(NSArray*)_params _item:(id<IExternalstorageSingleton>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation rb_Externalstorage_getSDPath_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(rb_Externalstorage_getSDPath_caller_params*) makeParams:(NSArray*)_params _item:(id<IExternalstorageSingleton>)_item _methodResult:(CMethodResult*)_methodResult {
    rb_Externalstorage_getSDPath_caller_params* par = [[rb_Externalstorage_getSDPath_caller_params alloc] init];
    par.params = _params;
    par.item = _item;
    par.methodResult = _methodResult;
    return [par retain];
}

@end


@interface rb_Externalstorage_getSDPath_caller : NSObject {

}
+(rb_Externalstorage_getSDPath_caller*) getSharedInstance;
+(void) getSDPath:(rb_Externalstorage_getSDPath_caller_params*)caller_params;
+(void) getSDPath_in_thread:(rb_Externalstorage_getSDPath_caller_params*)caller_params;
+(void) getSDPath_in_UI_thread:(rb_Externalstorage_getSDPath_caller_params*)caller_params;

@end

static rb_Externalstorage_getSDPath_caller* our_Externalstorage_getSDPath_caller = nil;

@implementation rb_Externalstorage_getSDPath_caller

+(rb_Externalstorage_getSDPath_caller*) getSharedInstance {
    if (our_Externalstorage_getSDPath_caller == nil) {
        our_Externalstorage_getSDPath_caller = [[rb_Externalstorage_getSDPath_caller alloc] init];
    }
    return our_Externalstorage_getSDPath_caller;
}

-(void) command_getSDPath:(rb_Externalstorage_getSDPath_caller_params*)caller_params {
    NSArray* params = caller_params.params;
    id<IExternalstorageSingleton> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem getSDPath:methodResult ];
    [caller_params release];
}

+(void) getSDPath:(rb_Externalstorage_getSDPath_caller_params*)caller_params {
    [[rb_Externalstorage_getSDPath_caller getSharedInstance] command_getSDPath:caller_params];
}

+(void) getSDPath_in_thread:(rb_Externalstorage_getSDPath_caller_params*)caller_params {
    [[rb_Externalstorage_getSDPath_caller getSharedInstance] performSelectorInBackground:@selector(command_getSDPath:) withObject:caller_params];
}

+(void) getSDPath_in_UI_thread:(rb_Externalstorage_getSDPath_caller_params*)caller_params {
    [[rb_Externalstorage_getSDPath_caller getSharedInstance] performSelectorOnMainThread:@selector(command_getSDPath:) withObject:caller_params waitUntilDone:NO];
}


@end


VALUE rb_Externalstorage_getSDPath_Obj(int argc, VALUE *argv, id<IExternalstorageSingleton>objItem) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[0+1];
    NSString* callbackURL = nil;
    unsigned long callbackMethod = 0;
    NSString* callbackParam = nil;
    BOOL method_return_result = YES;

    [methodResult setMethodSignature:@"Externalstorage::getSDPath"];

    
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
                params[i] = Externalstorage_makeInstanceByRubyObject(argv[i]);
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
        
        [rb_Externalstorage_getSDPath_caller getSDPath_in_thread:[rb_Externalstorage_getSDPath_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    else {
        // we do not have callback
        
        [rb_Externalstorage_getSDPath_caller getSDPath:[rb_Externalstorage_getSDPath_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    VALUE resValue = rho_ruby_get_NIL();
    if ((callbackURL == nil) && (callbackMethod == 0) && (method_return_result)) {
        resValue = [methodResult toRuby];
    }
    return resValue;
}


VALUE rb_s_Externalstorage_getSDPath(int argc, VALUE *argv) {

    id<IExternalstorageFactory> factory = [ExternalstorageFactorySingleton getExternalstorageFactoryInstance];
    id<IExternalstorageSingleton> singleton = [factory getExternalstorageSingleton];
    return rb_Externalstorage_getSDPath_Obj(argc, argv, singleton);

}









