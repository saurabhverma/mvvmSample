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

NSString* _Nonnull peopleURL = @"http://swapi.co/api/people/";

@interface PeopleManager ()
{
    dispatch_queue_t serialQueue;
}
- (void)executeBlock:(void (^)())block;
- (void)parsePeopleJSON:(NSDictionary*)jsonDict
                 forKey:(NSString*)key
      completionHandler:(void (^)(NSArray<CharacterViewModel*>* result, NSError* error))completionHandler;
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

            __block PeopleViewModel* peopleViewModel = [[PeopleViewModel alloc] init];
            NSError* responseError;

            @try{

                if (!error) {
                    NSError *jsonError;
                    //Get the Json dictionary out of Data
                    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data
                                                                             options:0
                                                                               error:&jsonError];

                    if (!jsonError) {

                        if (jsonDict[@"results"]) {
                            [self parsePeopleJSON:jsonDict
                                           forKey:@"results"
                                completionHandler:^(NSArray<CharacterViewModel *> *result, NSError *error) {
                                    peopleViewModel.people = result;
                                }];
                        }
                        if (jsonDict[@"count"]) {
                            peopleViewModel.totalCountText = [NSString stringWithFormat:@"%@ People in total", jsonDict[@"count"]];
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
                NSLog(@"%@", exception.reason);
            }
            @finally {

                dispatch_async(dispatch_get_main_queue(), ^{

                    bool success = YES;
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
- (void)parsePeopleJSON:(NSDictionary*)jsonDict
                 forKey:(NSString*)key
      completionHandler:(void (^)(NSArray<CharacterViewModel*>* result, NSError* error))completionHandler {


    NSMutableArray<CharacterViewModel *>* characterViewModels = [NSMutableArray array];
    NSError* parseError;

    for (NSDictionary* json in [jsonDict objectForKey:key]) {

        @autoreleasepool {

            Character* character = [[Character alloc] initWithDictionary:json error:&parseError];

            if (!parseError) {
                CharacterViewModel* charViewModel = [[CharacterViewModel alloc] initWithcharacter:character];
                [characterViewModels addObject:charViewModel];
            }
        }
    }

    completionHandler(characterViewModels, parseError);
}
- (void)executeBlock:(void (^)())block {
    dispatch_async(serialQueue, block);
}
@end
