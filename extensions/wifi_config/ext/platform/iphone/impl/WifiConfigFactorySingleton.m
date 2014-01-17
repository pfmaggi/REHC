
#import "IWifiConfig.h"
#import "WifiConfigFactoryBase.h"

static WifiConfigFactoryBase* ourWifiConfigFactory = nil;

@implementation WifiConfigFactorySingleton

+(id<IWifiConfigFactory>) getWifiConfigFactoryInstance {
    if (ourWifiConfigFactory == nil) {
        ourWifiConfigFactory = [[WifiConfigFactoryBase alloc] init];
    }
    return ourWifiConfigFactory;
}

@end