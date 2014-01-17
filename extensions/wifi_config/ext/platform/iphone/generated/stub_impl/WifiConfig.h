
#import "IWifiConfig.h"
#import "WifiConfigBase.h"

@interface WifiConfig : WifiConfigBase<IWifiConfig> {
}

-(void) get_EAP_Identity:(NSString*)a methodResult:(id<IMethodResult>)methodResult;



@end