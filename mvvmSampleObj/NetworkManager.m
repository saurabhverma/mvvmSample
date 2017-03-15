//
//  NetworkManager.m
//  mvvmSampleObj
//
//  Created by Saurabh Verma on 15/03/2017.
//  Copyright © 2017 Outware. All rights reserved.
//

#import "NetworkManager.h"

static NetworkManager* sharedManager;
@implementation NetworkManager

+ (NetworkManager* _Nonnull)sharedManager {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[NetworkManager alloc] init];
    });

    return sharedManager;
}
- (void)requestWithURL:(NSString * _Nonnull)url completionHandler:(NMRequestBlock)completionHandler {

    NSURLSession* session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];

    NSURL* requestURL = [NSURL URLWithString:url];
    NSURLSessionDataTask* task = [session dataTaskWithURL:requestURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(data, response, error);
        });

    }];
    [task resume];
}
@end
