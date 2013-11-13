#import <Foundation/Foundation.h>
#include "common/app_build_capabilities.h"

extern void Init_Externalstorage_API();

void Init_Externalstorage_extension()
{
    Init_Externalstorage_API();
}