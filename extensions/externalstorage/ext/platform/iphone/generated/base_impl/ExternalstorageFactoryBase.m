
#import "ExternalstorageFactoryBase.h"
#import "Externalstorage.h"
#import "ExternalstorageSingleton.h"



@implementation ExternalstorageFactoryBase

-(id)init {
    self = [super init];
    mExternalstorageInstances = [[NSMutableDictionary dictionaryWithCapacity:4] retain];
    mExternalstorageSingleton = nil;
    return self;
}

-(id<IExternalstorage>) getExternalstorageByID:(NSString*)ID {
    Externalstorage* obj = (Externalstorage*)[mExternalstorageInstances objectForKey:ID];
    if (obj == nil) {
        obj = [self createExternalstorageByID:ID];
        [mExternalstorageInstances setObject:obj forKey:ID];
    }
    return obj;
}

-(void) destroyObjectByID:(NSString*)ID {
    Externalstorage* obj = [mExternalstorageInstances objectForKey:ID];
    if (obj != nil) {
        [mExternalstorageInstances removeObjectForKey:ID];
    }
}


-(id<IExternalstorage>)createExternalstorageByID:(NSString*)ID {
    Externalstorage* obj = [[Externalstorage alloc] init];

    return obj;
}


-(id<IExternalstorageSingleton>) getExternalstorageSingleton {
    if (mExternalstorageSingleton == nil) {
        mExternalstorageSingleton = [[ExternalstorageSingleton alloc] init];
    }
    return mExternalstorageSingleton;
}

-(void)dealloc {
    [mExternalstorageInstances release];
    [super dealloc];
}


@end