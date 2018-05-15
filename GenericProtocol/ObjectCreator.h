//
//  ObjectCreator.h
//  GenericProtocol
//
//  Created by Tibo on 21/07/2017.
//  Copyright © 2017 Tibo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ObjectCreator : NSObject

+ (id)create:(NSString *)className;
    
@end
