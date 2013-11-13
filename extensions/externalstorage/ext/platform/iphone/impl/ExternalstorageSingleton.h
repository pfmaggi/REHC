
#import "IExternalstorage.h"
#import "ExternalstorageSingletonBase.h"

@interface ExternalstorageSingleton : ExternalstorageSingletonBase<IExternalstorageSingleton> {
}


-(NSString*)getInitialDefaultID;


-(void) enumerate:(id<IMethodResult>)methodResult;




@end