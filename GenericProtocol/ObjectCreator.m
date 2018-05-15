//
//  ObjectCreator.m
//  GenericProtocol
//
//  Created by Tibo on 21/07/2017.
//  Copyright © 2017 Tibo. All rights reserved.
//

#import "ObjectCreator.h"

@implementation ObjectCreator
    
+ (Class)create:(NSString *)className
{
    Class daClass = NSClassFromString(className);
    return [daClass new];
}

@end
