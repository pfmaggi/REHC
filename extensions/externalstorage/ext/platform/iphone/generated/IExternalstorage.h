
#import <Foundation/Foundation.h>

#import "api_generator/iphone/IMethodResult.h"


// hash keys used in properties and parameters


@protocol IExternalstorage <NSObject>



// NOTE: if you want to hold methodResult(for example periodically call callbacks) you should release it manually when you stop using it!
@end


@protocol IExternalstorageSingleton <NSObject>




-(void) getSDPath:(id<IMethodResult>)methodResult;


@end


@protocol IExternalstorageFactory <NSObject>
-(id<IExternalstorageSingleton>) getExternalstorageSingleton;
-(id<IExternalstorage>) getExternalstorageByID:(NSString*)ID;
-(void) destroyObjectByID:(NSString*)ID;
@end


@interface ExternalstorageFactorySingleton : NSObject {
}
+(id<IExternalstorageFactory>) getExternalstorageFactoryInstance;
@end


