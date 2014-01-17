#import <Foundation/Foundation.h>
#include "common/app_build_capabilities.h"

extern void Init_WifiConfig_API();

void Init_WifiConfig_extension()
{
    Init_WifiConfig_API();
}