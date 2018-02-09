//
//  ApiCallHandler.m
//  railpass
//
//  Created by Ajay on 16/03/14.
//  Copyright (c) 2014 Rail Pass / Synapsys Technosolutions Tech. All rights reserved.
//

#import "ApiCallHandler.h"

#import "ServerConnectionManager.h"
#import "ServerApiCall.h"

@implementation ApiCallHandler
{
    NSMutableDictionary *requestQueue;
}

#pragma mark - Class Methods
static ApiCallHandler *staticInstance = nil;
+(ApiCallHandler *) sharedHandler
{
    if(!staticInstance)
    {
        staticInstance = [[ApiCallHandler alloc] init];
    }
    return staticInstance;
}


#pragma mark - Instance Methods
#pragma mark -


- (void)sendPNR:(NSString *)pnr withCompletionBlock:(CallCompletionBlock)block
{
    ServerApiCall *newCall = [[ServerApiCall alloc] init];
    newCall.apiName = @"pnrstatus";
    
    NSDictionary *reqParams = @{
                                @"pnr":pnr
                                };
    
    newCall.apiParams = [NSMutableDictionary dictionaryWithDictionary:reqParams];
    
    ServerConnectionManager *manager = [[ServerConnectionManager alloc] init];
    manager.serverApiCall = newCall;
    [manager startConnectionWithCompletionBlock:^(id response, NSError *error) {
        block(response, error);
    }];
}

- (void)sendCaptcha:(NSString *)captcha forPNR:(NSString *)pnr withCompletionBlock:(CallCompletionBlock)block
{
    ServerApiCall *newCall = [[ServerApiCall alloc] init];
    newCall.apiName = [NSString stringWithFormat:@"http://10.0.0.101/testcodes/captcha.php?pnrno=%@&captcha_result=%@", pnr, captcha];
    
    NSDictionary *reqParams = @{
                                @"pnr":pnr,
                                @"captcha":captcha
                                };
    
    newCall.apiParams = [NSMutableDictionary dictionaryWithDictionary:reqParams];
    
    ServerConnectionManager *manager = [[ServerConnectionManager alloc] init];
    manager.serverApiCall = newCall;
    [manager startConnectionWithCompletionBlock:^(id response, NSError *error) {
        block(response, error);
    }];
}

@end
