//
//  ServerConnectionManager.h
//  railpass
//
//  Created by Mehul Bhavani on 16/03/14.
//  Copyright (c) 2014 Rail Pass / Synapsys Technosolutions Tech. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ServerApiCall.h"

/*** blocks ***/
typedef void(^ ServerConnectionCompletionBlock) (id response, NSError *error);
//typedef void(^ DownloadCompletionBlock) (id response, NSError *error);

@interface ServerConnectionManager : NSObject

//+(ServerConnectionManager *) sharedManager;

@property (nonatomic, retain) ServerApiCall *serverApiCall;

- (void)startConnectionWithCompletionBlock:(ServerConnectionCompletionBlock)block;

@end
