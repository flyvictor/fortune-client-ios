//
//  FortuneClientView.m
//  FortuneClient
//
//  Created by Oleksii Kozulin on 2/11/15.
//  Copyright (c) 2015 Oleksii Kozulin. All rights reserved.
//

#import "FortuneClientView.h"

@implementation FortuneClientView

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    NSString *argumentURL;
    [anInvocation getArgument:&argumentURL atIndex:2];
    NSDictionary * __unsafe_unretained unretainedDictionary;
    NSDictionary *optionDictionary;
    [anInvocation getArgument:&unretainedDictionary atIndex:3];
    optionDictionary = unretainedDictionary;
    SEL originalSelector = [anInvocation selector];
    NSString *selectorName = NSStringFromSelector(originalSelector);
    NSString *firstString = [[selectorName componentsSeparatedByString:@":"] objectAtIndex:0];
    NSString *methodName = [[firstString stringByReplacingOccurrencesOfString:@"get" withString:@""] lowercaseString];
    
    [self getRequestWithURL:methodName URLParam:argumentURL andParams:optionDictionary];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    return [[self class] instanceMethodSignatureForSelector:@selector(getRequestWithURL:URLParam:andParams:)];
}

- (void)getRequestWithURL:(NSString*)url URLParam:(NSString*)urlParam andParams:(NSDictionary*)params
{
    //raised
    NSLog(@"Building url get reaquest for GET method: %@, parameterURL: %@ and options: %@", url, urlParam, params);
}

@end