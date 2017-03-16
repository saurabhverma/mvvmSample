//
//  People.m
//  mvvmSampleObj
//
//  Created by Saurabh Verma on 16/03/2017.
//  Copyright © 2017 Outware. All rights reserved.
//

#import "People.h"

@implementation People

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"count": @"count",
                                                                  @"nextPageUrl": @"next",
                                                                  @"prevPageUrl": @"previous",
                                                                  @"characters": @"results"
                                                                  }];
}
@end
