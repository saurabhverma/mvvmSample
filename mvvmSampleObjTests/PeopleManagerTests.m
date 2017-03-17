//
//  PeopleManagerTests.m
//  mvvmSampleObj
//
//  Created by Saurabh Verma on 15/03/2017.
//  Copyright © 2017 Outware. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PeopleManager.h"
#import "HTTPStatusCodes.h"
#import "NetworkManager.h"

@interface PeopleManagerTests : XCTestCase

@end

@interface PeopleManager (Test)

- (void)callAPIWithURL:(NSString * _Nonnull )url completionHandler:(NMRequestBlock)completionHandler;
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

- (void)testPeopleManagerGetStarWarPeopleMethod {

    XCTestExpectation* completionExpectation = [self expectationWithDescription:@"API call"];

    [[[PeopleManager alloc] init] getStarWarsPeople:^(PeopleViewModel * _Nonnull result, bool success) {

        XCTAssertNotNil(result);

        [completionExpectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:5.0 handler:nil];
}

- (void)testCallAPIMethodHappyDay {

    XCTestExpectation* completionExpectation = [self expectationWithDescription:@"API call"];

    NMRequestBlock block = nil;
    block = ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

        XCTAssertNotNil(data);
        XCTAssertNotNil(response);
        XCTAssertNil(error);

        NSUInteger statusCode = ((NSHTTPURLResponse *)response).statusCode;
        XCTAssertEqual(statusCode, HTTPCodesNo200OK);


        NSError* jsonParseError;
        NSDictionary* jsonDict = [NSJSONSerialization JSONObjectWithData:data
                                                                 options:0
                                                                   error:&jsonParseError];

        XCTAssertNotNil(jsonDict);
        XCTAssertTrue([jsonDict isKindOfClass:[NSDictionary class]]);

        XCTAssertTrue(jsonDict[@"count"]);

        XCTAssertTrue(jsonDict[@"results"]);
        XCTAssertTrue([jsonDict[@"results"] isKindOfClass:[NSArray class]]);

        if (((NSArray*)jsonDict[@"results"]).count != 0) {

            //results should contain array of dictionaries
            XCTAssertTrue([[((NSArray*)jsonDict[@"results"]) firstObject] isKindOfClass:[NSDictionary class]]);

            NSDictionary* firstObject = [((NSArray*)jsonDict[@"results"]) firstObject];
            XCTAssertTrue(firstObject[@"name"]);
            XCTAssertTrue(firstObject[@"height"]);
            XCTAssertTrue(firstObject[@"gender"]);
            XCTAssertTrue(firstObject[@"birth_year"]);

        }

        [completionExpectation fulfill];
    };
    [[[PeopleManager alloc] init] callAPIWithURL:@"http://swapi.co/api/people/"
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
