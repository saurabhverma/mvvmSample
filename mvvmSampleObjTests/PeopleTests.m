//
//  PeopleTests.m
//  mvvmSampleObj
//
//  Created by Saurabh Verma on 17/03/2017.
//  Copyright © 2017 Outware. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "People.h"

@interface PeopleTests : XCTestCase

@end

@implementation PeopleTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testPeopleConstructorWithHappyValues {

    NSDictionary* jsonDict = @{
        @"count": @87,
        @"next": @"http://swapi.co/api/people/?page=2",
        @"previous": [NSNull null],
        @"results": @[
                @{
                    @"name": @"Luke Skywalker",
                    @"height": @"172",
                    @"mass": @"77",
                    @"hair_color": @"blond",
                    @"skin_color": @"fair",
                    @"eye_color": @"blue",
                    @"birth_year": @"19BBY",
                    @"gender": @"male",
                    @"homeworld": @"http://swapi.co/api/planets/1/",
                    @"created": @"2014-12-09T13:50:51.644000Z",
                    @"edited": @"2014-12-20T21:17:56.891000Z",
                    @"url": @"http://swapi.co/api/people/1/"
                    }
                ]
    };


    NSError* jsonModelError;
    People *people = [[People alloc] initWithDictionary:jsonDict error:&jsonModelError];

    XCTAssertNotNil(people);

    XCTAssertTrue([people.count isEqualToString:@"87"]);
    XCTAssertTrue([people.nextPageUrl isEqualToString:@"http://swapi.co/api/people/?page=2"]);
    XCTAssertNil(people.prevPageUrl);

    XCTAssertNotNil(people.characters);

    Character* character = people.characters[0];
    XCTAssertTrue([character.name isEqualToString:@"Luke Skywalker"]);
    XCTAssertTrue([character.height isEqualToString:@"172"]);
    XCTAssertTrue([character.gender isEqualToString:@"male"]);
    XCTAssertTrue([character.birthYear isEqualToString:@"19BBY"]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
