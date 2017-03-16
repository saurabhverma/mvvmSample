//
//  NetworkManager.h
//  mvvmSampleObj
//
//  Created by Saurabh Verma on 15/03/2017.
//  Copyright © 2017 Outware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPStatusCodes.h"

typedef void(^ _Nullable NMRequestBlock)(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error);

@interface NetworkManager : NSURLSession

+ (NetworkManager* _Nonnull)sharedManager;

- (void)requestWithURL:(NSString * _Nonnull)url completionHandler:(NMRequestBlock)completionHandler;
@end
