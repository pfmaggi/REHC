
#import "IExternalstorage.h"
#import "ExternalstorageSingletonBase.h"

@interface ExternalstorageSingleton : ExternalstorageSingletonBase<IExternalstorageSingleton> {
}



-(void) getSDPath:(id<IMethodResult>)methodResult;




@end