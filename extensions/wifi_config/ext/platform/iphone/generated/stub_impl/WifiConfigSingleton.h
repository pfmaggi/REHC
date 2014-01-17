
#import "IWifiConfig.h"
#import "WifiConfigSingletonBase.h"

@interface WifiConfigSingleton : WifiConfigSingletonBase<IWifiConfigSingleton> {
}


-(NSString*)getInitialDefaultID;


-(void) enumerate:(id<IMethodResult>)methodResult;




@end