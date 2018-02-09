//
//  ServerConnectionManager.m
//  railpass
//
//  Created by Mehul Bhavani on 16/03/14.
//  Copyright (c) 2014 Rail Pass / Synapsys Technosolutions Tech. All rights reserved.
//

//#define kDefaultApiUrlString @"http://railpass.synapsys.co.in/app/api/api.php"

#import "ServerConnectionManager.h"
#import "AFNetworking.h"

@implementation ServerConnectionManager
{
    NSURLSessionDataTask *currentOperation;
}

@synthesize serverApiCall = _serverApiCall;

#pragma mark - Instance Methods



- (void)startConnectionWithCompletionBlock:(ServerConnectionCompletionBlock)block
{
    if(!_serverApiCall)
    {
        NSLog(@"Server Api Call NOT SET or NULL");
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSError *error = [[NSError alloc] initWithDomain:@"app.error.domain" code:404 userInfo:@{}];
            block(nil, error);
        });
        return;
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    NSString *urlString = @"http://10.0.0.101/testslim/apps/api/sampleinfo/v1/api.php";
    
    NSDictionary *requestParams = @{
                              @"request": @{
                                      @"api":_serverApiCall.apiName,
                                      @"params": _serverApiCall.apiParams,
                                      }
                              };
    
    NSLog(@"%@\n%@", urlString, requestParams);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        /*
        currentOperation = [manager GET:urlString
                             parameters:nil
                               progress:^(NSProgress * _Nonnull downloadProgress) {}
                                success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                    NSLog(@"%@", responseObject);
//                                    NSLog(@"\n%@ %@", _serverApiCall.apiName, [[NSString alloc] initWithData:(NSData *)responseObject encoding:NSUTF8StringEncoding]);
                                    NSError *err = nil;
                                    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:&err];
                                    NSLog(@"%@ %@", NSStringFromClass(dict.class), dict);
                                    NSLog(@"%@", err);
                                    dispatch_async(dispatch_get_main_queue(), ^{
                                        block(dict, nil);
                                    });
                                }
                                failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                    NSLog(@"%@", error.userInfo);
                                    dispatch_async(dispatch_get_main_queue(), ^{
                                        block(nil, error);
                                    });
                                }
                            ];
         */
        
        currentOperation = [manager POST:urlString
                              parameters:requestParams
                                progress:^(NSProgress * _Nonnull uploadProgress) {}
                                 success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//                                     NSLog(@"\n%@ %@", _serverApiCall.apiName, [[NSString alloc] initWithData:(NSData *)responseObject encoding:NSUTF8StringEncoding]);
                                     NSLog(@"%@", responseObject);
                                     if([responseObject isKindOfClass:[NSDictionary class]])
                                     {
                                         NSDictionary *responseDict = (NSDictionary *)responseObject;
                                         if(![[responseDict objectForKey:@"error"] isEqual:[NSNull null]])
                                         {
                                             NSDictionary *errDict = [responseDict objectForKey:@"error"];
                                             NSError *error = [[NSError alloc] initWithDomain:@"app.error.domain" code:[errDict[@"code"] integerValue] userInfo:errDict];
                                             
                                             dispatch_async(dispatch_get_main_queue(), ^{
                                                 block(responseObject, error);
                                             });
                                         }
                                         else
                                         {
                                             dispatch_async(dispatch_get_main_queue(), ^{
                                                 block(responseDict, nil);
                                             });
                                             
                                         }
                                     }
                                 }
                                 failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                     dispatch_async(dispatch_get_main_queue(), ^{
                                         block(nil, error);
                                     });
                                     NSLog(@"\n%@ Response ERROR %@\n%@", _serverApiCall.apiName, error, error.userInfo[@"response_obj"]);
                                 }
                            ];
        
    });
}

@end
