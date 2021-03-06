
#import "WifiConfigBase.h"
#import "api_generator/iphone/CMethodResult.h"





@implementation WifiConfigBase

- (void) resetAllPropertiesToDefault {
    mDeclaredProperties = [[NSSet setWithObjects:@"simpleStringProperty", nil] retain];

    mProperties = [[NSMutableDictionary dictionaryWithCapacity:3] retain];
    
    [self setProperty:@"simpleStringProperty" propertyValue:@"" methodResult:nil];

}

- (id) init {
    self = [super init];
    [self resetAllPropertiesToDefault];
    return self;
}



+(NSString*) applyAliasesToPropertyName:(NSString*)prop_name {
return prop_name;

}

+(NSDictionary*) applyAliasesToDictionary:(NSDictionary*)dict {
return dict;

}




-(void) getProperty:(NSString*)propertyName methodResult:(id<IMethodResult>)methodResult {
    [methodResult setResult:[mProperties objectForKey:[WifiConfigBase applyAliasesToPropertyName:propertyName]]];
}

-(void) setProperty:(NSString*)propertyName propertyValue:(NSString*)propertyValue methodResult:(id<IMethodResult>)methodResult {
    NSObject* value = propertyValue;
    NSString* strValue = propertyValue;
    if ([value isKindOfClass:[NSNumber class]]) {
        NSNumber* numValue = (NSNumber*)value;
        if ([CMethodResult isBoolInsideNumber:numValue]) {
            BOOL boolValue = [numValue boolValue];
            if (boolValue) {
                strValue = @"true";
            }
            else {
                strValue = @"false";
            }
        }
        else if ([CMethodResult isIntInsideNumber:numValue]) {
            strValue =  [NSString stringWithFormat:@"%@", numValue];
        }
        else if ([CMethodResult isFloatInsideNumber:numValue]) {
            strValue =  [NSString stringWithFormat:@"%@", numValue];
        }
        else {
            // error !
            NSLog(@"WifiConfig.setProperty(\"%@\", value) UNSUPPORTED VALUE TYPE ! MUST BE STRING !!!", propertyName);
        }
    }
    else if ([value isKindOfClass:[NSString class]]) {
        //is OK!
    }
    else {
        // error !
        NSLog(@"WifiConfig.setProperty(\"%@\", value) UNSUPPORTED VALUE TYPE ! MUST BE STRING !!!", propertyName);

    }

   [mProperties setObject:strValue forKey:[WifiConfigBase applyAliasesToPropertyName:propertyName]];
}

-(void) getProperties:(NSArray*)arrayofNames methodResult:(id<IMethodResult>)methodResult {
    NSMutableDictionary* dict = [NSMutableDictionary dictionaryWithCapacity:[arrayofNames count]];
    NSArray* keys = arrayofNames;
    CMethodResult_SimpleHolder* resultHolder = [CMethodResult_SimpleHolder makeEmptyHolder];
    int i;
    for (i = 0; i < [keys count]; i++) {
        NSString* key = (NSString*)[keys objectAtIndex:i];
        [resultHolder setResult:nil];
        [self getProperty:key methodResult:resultHolder];
        if ([resultHolder getResult] != nil) {
            NSString* value = (NSString*)[resultHolder getResult];
            [dict setObject:value forKey:key];
        } 
        else {
          [dict setObject:@"" forKey:key];
        }
    }
    [methodResult setResult:dict];
}

-(void) getAllProperties:(id<IMethodResult>)methodResult {
    [self getProperties:[mProperties allKeys] methodResult:methodResult];
}


-(void) setProperties:(NSDictionary*)propertyMap methodResult:(id<IMethodResult>)methodResult {
    NSArray* keys = [propertyMap allKeys];
    int i;
    for (i = 0; i < [keys count]; i++) {
        NSString* key = (NSString*)[keys objectAtIndex:i];
        NSString* value = (NSString*)[propertyMap objectForKey:key];
        [self setProperty:key propertyValue:value methodResult:methodResult];
    }
}

-(void) clearAllProperties:(id<IMethodResult>)methodResult {
   [mProperties removeAllObjects];
   [self resetAllPropertiesToDefault];
}










-(void) getSimpleStringProperty:(id<IMethodResult>)methodResult {

    CMethodResult_SimpleHolder* resultHolder = [CMethodResult_SimpleHolder makeEmptyHolder];
    [self getProperty:@"simpleStringProperty" methodResult:resultHolder];
    if ([resultHolder getResult] != nil) {
        NSString* strResult = (NSString*)[resultHolder getResult];
        NSString* typedResult = strResult;
        [methodResult setResult:typedResult];
    }
    else {
        [methodResult setResult:nil];
    }

}

-(void) setSimpleStringProperty:(NSString*)simpleStringProperty methodResult:(id<IMethodResult>)methodResult {

    NSString* strValue = [NSString stringWithFormat:@"%@", simpleStringProperty];
    [self setProperty:@"simpleStringProperty" propertyValue:strValue methodResult:methodResult];

}




-(void) dealloc {

    [mProperties release];
    [mDeclaredProperties release];

    [super dealloc];
}

@end