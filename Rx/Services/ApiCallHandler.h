//
//  ApiCallHandler.h
//  railpass
//
//  Created by Ajay on 16/03/14.
//  Copyright (c) 2014 Rail Pass / Synapsys Technosolutions Tech. All rights reserved.
//

#import <Foundation/Foundation.h>

/*** blocks ***/
typedef void(^ CallCompletionBlock) (id response, NSError *error);

//typedef void(^ AppStartUpCompletionBlock) (id response, NSError *error);
//typedef void(^ TicketScanCompletionHandler) (id ticket, NSError *error);

@interface ApiCallHandler : NSObject

+(ApiCallHandler *) sharedHandler;

- (void)sendPNR:(NSString *)pnr withCompletionBlock:(CallCompletionBlock) block;
- (void)sendCaptcha:(NSString *)captcha forPNR:(NSString *)pnr withCompletionBlock:(CallCompletionBlock)block;

@end
