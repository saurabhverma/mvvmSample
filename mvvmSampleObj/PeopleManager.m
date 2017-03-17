//
//  PeopleManager.m
//  mvvmSampleObj
//
//  Created by Saurabh Verma on 14/03/2017.
//  Copyright © 2017 Outware. All rights reserved.
//

#import "PeopleManager.h"
#import "NetworkManager.h"
#import <objc/objc-runtime.h>
#import "People.h"

NSString* _Nonnull peopleURL = @"http://swapi.co/api/people/";

@interface PeopleManager ()
{
    dispatch_queue_t serialQueue;
}
- (void)executeBlock:(void (^)())block;
- (void)getStarWarsPeopleFromAPI:(PMStarWarsPeopleBlock)completionHandler;
- (void)callAPIWithURL:(NSString * _Nonnull )url completionHandler:(NMRequestBlock)completionHandler;
@end

@implementation PeopleManager
#pragma mark - Public Methods

- (instancetype)init {
    self = [super init];

    serialQueue = dispatch_queue_create([NSStringFromClass([self class]) UTF8String], DISPATCH_QUEUE_SERIAL);

    return self;
}
- (void)getStarWarsPeople:(PMStarWarsPeopleBlock)completionHandler {

    //Where do you want to get this data from? Goto 1. for API and 2. for Local DB

    //1. API
    [self executeBlock:^{   //Use Serial queue to call api followed by json parsing
        [self getStarWarsPeopleFromAPI:^(PeopleViewModel * _Nonnull result, bool success) {

            //return the result on main queue
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(result, success);
            });
        }];
    }];


    //2. Local DB
}
#pragma mark - Private Methods
- (void)getStarWarsPeopleFromAPI:(PMStarWarsPeopleBlock)completionHandler {

    [self callAPIWithURL:peopleURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        __block bool success = YES;
        NSError* responseError;
        PeopleViewModel* peopleViewModel = nil;

        @try{

            NSUInteger statusCode = ((NSHTTPURLResponse *)response).statusCode;
            if (!error && statusCode == HTTPCodesNo200OK) {
                NSError *jsonError;

                //Get the Json dictionary out of Data
                id jsonDict = [NSJSONSerialization JSONObjectWithData:data
                                                              options:0
                                                                error:&jsonError];

                if (!jsonError && [jsonDict isKindOfClass:[NSDictionary class]]) {

                    NSError* jsonModelError;
                    People* people = [[People alloc] initWithDictionary:jsonDict error:&jsonModelError];


                    if (!jsonModelError) {
                        peopleViewModel = [[PeopleViewModel alloc] initWithPeople:people];
                    }
                    else {
                        responseError = jsonModelError;
                    }
                }
                else {
                    responseError = jsonError;
                }
            }
            else {
                responseError = error;
            }
        }
        @catch (NSException *exception){

            success = NO;
            peopleViewModel.errorMessageText = exception.reason;
        }
        @finally {

            if (responseError) {
                success = NO;
                peopleViewModel.errorMessageText = responseError.localizedDescription;
            }
            completionHandler(peopleViewModel, success);
        }
    }];

}
- (void)callAPIWithURL:(NSString * _Nonnull )url completionHandler:(NMRequestBlock)completionHandler {

    NMRequestBlock block = nil;
    block = ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        completionHandler(data, response, error);
    };
    [[NetworkManager sharedManager] requestWithURL:url completionHandler:block];

}
- (void)executeBlock:(void (^)())block {
    dispatch_async(serialQueue, block);
}
@end
