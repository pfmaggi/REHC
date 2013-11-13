
#import "IExternalstorage.h"
#import "ExternalstorageFactoryBase.h"

static ExternalstorageFactoryBase* ourExternalstorageFactory = nil;

@implementation ExternalstorageFactorySingleton

+(id<IExternalstorageFactory>) getExternalstorageFactoryInstance {
    if (ourExternalstorageFactory == nil) {
        ourExternalstorageFactory = [[ExternalstorageFactoryBase alloc] init];
    }
    return ourExternalstorageFactory;
}

@end