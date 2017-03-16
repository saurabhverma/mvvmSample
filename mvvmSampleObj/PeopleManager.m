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
@end

@implementation PeopleManager
#pragma mark - Public Methods

- (instancetype)init {
    self = [super init];

    serialQueue = dispatch_queue_create([NSStringFromClass([self class]) UTF8String], DISPATCH_QUEUE_SERIAL);

    return self;
}
- (void)getStarWarsPeople:(PMStarWarsPeopleBlock)completionHandler {


    NMRequestBlock block = nil;
    block = ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

        [self executeBlock:^{

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

                dispatch_async(dispatch_get_main_queue(), ^{


                    if (responseError) {
                        success = NO;
                        peopleViewModel.errorMessageText = responseError.localizedDescription;
                    }
                    completionHandler(peopleViewModel, success);
                });
            }
        }];
    };

    [[NetworkManager sharedManager] requestWithURL:peopleURL completionHandler:block];
}
#pragma mark - Private Methods
- (void)executeBlock:(void (^)())block {
    dispatch_async(serialQueue, block);
}
@end
