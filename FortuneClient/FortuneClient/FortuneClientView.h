//
//  FortuneClientView.h
//  FortuneClient
//
//  Created by Oleksii Kozulin on 2/11/15.
//  Copyright (c) 2015 Oleksii Kozulin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FortuneClientView : NSObject

- (void)getUser:(NSString*)email withOption:(NSDictionary*)option;
- (void)getAdress:(NSString*)newOne withOption:(NSDictionary*)option;
- (void)getFlights:(NSString*)lastOne withOption:(NSDictionary*)option;

@end