//
//  FortuneHeaderGenerator.m
//  FortuneClient
//
//  Created by Oleksii Kozulin on 2/11/15.
//  Copyright (c) 2015 Oleksii Kozulin. All rights reserved.
//

#import "FortuneHeaderGenerator.h"

@implementation FortuneHeaderGenerator

- (NSString*)stringForGetMethod:(NSString*)methodName andAdditionalParameterName:(NSString*)addName
{
    //- (void)getUser:(NSString*)email withOption:(NSDictionary*)option;
    if(addName)
    {
        NSString *formatString = @"-(void)get%@:(NSString*)%@ withOption:(NSDictionary*)option";
        return [NSString stringWithFormat:formatString, methodName, addName];
    }
    else
    {
        NSString *formatString = @"-(void)get%@WithOption:(NSDictionary*)option";
        return [NSString stringWithFormat:formatString, methodName];
    }
    
};

- (NSString*)getHeaderForClientInterface
{
    return @"//  FortuneClientView.h\n//  FortuneClient\n//\n//  Created by Oleksii Kozulin on 2/11/15.\n//  Copyright (c) 2015 Oleksii Kozulin. All rights reserved.\n\n\n#import <Foundation/Foundation.h>\n\n@interface FortuneClientView : NSObject\n\n";
}

- (NSString*)getFooterForClientInterface
{
    return @"\n@end";
}

- (NSString*)generateHeaderFileForJsonResource:(NSString*)resourceName
{
    NSMutableString *resultString = [NSMutableString new];
    NSData *jsonData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:resourceName ofType:nil]];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
    NSArray *objects = jsonDictionary[@"resources"];
    [resultString appendString:[self getHeaderForClientInterface]];
    for(NSDictionary *request in objects)
    {
        NSString *route = [request[@"route"] capitalizedString];
        NSString *additionalParameterName = nil;
        if(request[@"modelOptions"][@"pk"])
        {
            additionalParameterName = request[@"modelOptions"][@"pk"];
        }
        [resultString appendFormat:@"%@\n", [self stringForGetMethod:route andAdditionalParameterName:additionalParameterName]];
        
    }
    [resultString appendString:[self getFooterForClientInterface]];
    return resultString;
}

@end
