
#import "WifiConfigFactoryBase.h"
#import "WifiConfig.h"
#import "WifiConfigSingleton.h"



@implementation WifiConfigFactoryBase

-(id)init {
    self = [super init];
    mWifiConfigInstances = [[NSMutableDictionary dictionaryWithCapacity:4] retain];
    mWifiConfigSingleton = nil;
    return self;
}

-(id<IWifiConfig>) getWifiConfigByID:(NSString*)ID {
    WifiConfig* obj = (WifiConfig*)[mWifiConfigInstances objectForKey:ID];
    if (obj == nil) {
        obj = [self createWifiConfigByID:ID];
        [mWifiConfigInstances setObject:obj forKey:ID];
    }
    return obj;
}

-(void) destroyObjectByID:(NSString*)ID {
    WifiConfig* obj = [mWifiConfigInstances objectForKey:ID];
    if (obj != nil) {
        [mWifiConfigInstances removeObjectForKey:ID];
    }
}


-(id<IWifiConfig>)createWifiConfigByID:(NSString*)ID {
    WifiConfig* obj = [[WifiConfig alloc] init];

    [obj setProperty:@"ID" propertyValue:ID methodResult:nil];

    return obj;
}


-(id<IWifiConfigSingleton>) getWifiConfigSingleton {
    if (mWifiConfigSingleton == nil) {
        mWifiConfigSingleton = [[WifiConfigSingleton alloc] init];
    }
    return mWifiConfigSingleton;
}

-(void)dealloc {
    [mWifiConfigInstances release];
    [super dealloc];
}


@end