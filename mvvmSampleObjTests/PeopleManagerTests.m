//
//  PeopleManagerTests.m
//  mvvmSampleObj
//
//  Created by Saurabh Verma on 15/03/2017.
//  Copyright © 2017 Outware. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PeopleManager.h"

@interface PeopleManagerTests : XCTestCase

@end

@implementation PeopleManagerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testPeopleManagerGetStarWarPeopleExists {

    PeopleManager* peopleManager = [[PeopleManager alloc] init];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
