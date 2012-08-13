//
//  GDataXMLElement-Extras.h
//  bbPressTest
//
//  Created by Jun Tao Luo on 2012-08-13.
//  Copyright (c) 2012 Jun Tao Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDataXMLNode.h"

@interface GDataXMLElement (Extras)

- (GDataXMLElement *)elementForChild:(NSString *)childName;
- (NSString *)valueForChild:(NSString *)childName;

@end
