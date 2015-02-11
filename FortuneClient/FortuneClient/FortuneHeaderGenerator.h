//
//  FortuneHeaderGenerator.h
//  FortuneClient
//
//  Created by Oleksii Kozulin on 2/11/15.
//  Copyright (c) 2015 Oleksii Kozulin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FortuneHeaderGenerator : NSObject

- (NSString*)generateHeaderFileForJsonResource:(NSString*)resourceName;
@end
