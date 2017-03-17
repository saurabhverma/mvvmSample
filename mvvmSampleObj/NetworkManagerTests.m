//
//  NetworkManagerTests.m
//  mvvmSampleObj
//
//  Created by Saurabh Verma on 16/03/2017.
//  Copyright © 2017 Outware. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NetworkManager.h"

@interface NetworkManagerTests : XCTestCase

@end

@implementation NetworkManagerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void)testRequestWithUrlMethodHappyDay {

    XCTestExpectation* completionExpectation = [self expectationWithDescription:@"API call"];

    NMRequestBlock block = nil;
    block = ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

        XCTAssertNotNil(data);
        XCTAssertNotNil(response);
        XCTAssertNil(error);

        NSUInteger statusCode = ((NSHTTPURLResponse *)response).statusCode;
        XCTAssertEqual(statusCode, HTTPCodesNo200OK);

        [completionExpectation fulfill];
    };
    [[[NetworkManager alloc] init] requestWithURL:@"http://swapi.co/api/people/"
                                completionHandler:block];

    [self waitForExpectationsWithTimeout:5.0 handler:nil];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
