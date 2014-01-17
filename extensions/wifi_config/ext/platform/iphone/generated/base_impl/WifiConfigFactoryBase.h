
#import "IWifiConfig.h"

@interface WifiConfigFactoryBase : NSObject<IWifiConfigFactory> {
    NSMutableDictionary* mWifiConfigInstances;
    id<IWifiConfigSingleton> mWifiConfigSingleton;
}

-(id)init;

-(id<IWifiConfigSingleton>) getWifiConfigSingleton;
-(id<IWifiConfig>) getWifiConfigByID:(NSString*)ID;

-(void) destroyObjectByID:(NSString*)ID;

-(id<IWifiConfig>)createWifiConfigByID:(NSString*)ID;

-(void)dealloc;

@end