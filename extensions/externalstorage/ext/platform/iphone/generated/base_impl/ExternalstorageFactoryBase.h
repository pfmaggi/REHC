
#import "IExternalstorage.h"

@interface ExternalstorageFactoryBase : NSObject<IExternalstorageFactory> {
    NSMutableDictionary* mExternalstorageInstances;
    id<IExternalstorageSingleton> mExternalstorageSingleton;
}

-(id)init;

-(id<IExternalstorageSingleton>) getExternalstorageSingleton;
-(id<IExternalstorage>) getExternalstorageByID:(NSString*)ID;

-(void) destroyObjectByID:(NSString*)ID;

-(id<IExternalstorage>)createExternalstorageByID:(NSString*)ID;

-(void)dealloc;

@end