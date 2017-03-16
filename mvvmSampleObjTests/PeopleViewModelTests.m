//
//  PeopleViewModelTests.m
//  mvvmSampleObj
//
//  Created by Saurabh Verma on 16/03/2017.
//  Copyright © 2017 Outware. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CharacterViewModel.h"
#import "PeopleViewModel.h"
#import "Character.h"
#import "People.h"

@interface PeopleViewModelTests : XCTestCase

@end

@implementation PeopleViewModelTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testPeopleViewModelValues {

    Character* character = [[Character alloc] init];
    character.name = @"Luke Skywalker";
    character.height = @"1.72 m";
    character.birthYear = @"19 BBY";
    character.gender = @"Male";

    People* people = [[People alloc] init];
    people.count = @"87";
    people.characters = (NSArray<Character>*)[NSArray arrayWithObjects:character, nil];

    PeopleViewModel* peopleViewModel = [[PeopleViewModel alloc] initWithPeople:people];

    XCTAssertTrue([peopleViewModel.characterViewModels[0].nameText isEqualToString:@"Luke Skywalker"]);
    XCTAssertTrue([peopleViewModel.characterViewModels[0].heightText isEqualToString:@"1.72 m"]);
    XCTAssertTrue([peopleViewModel.characterViewModels[0].birthYearText isEqualToString:@"19 BBY"]);
    XCTAssertTrue([peopleViewModel.characterViewModels[0].genderText isEqualToString:@"Male"]);
    XCTAssertTrue([peopleViewModel.totalCountText isEqualToString:@"87 People in total"]);
    XCTAssertTrue([peopleViewModel.noMoreResultsText isEqualToString: @"That's all folks!!!"]);
    XCTAssertTrue([peopleViewModel.emptyScreenText isEqualToString:@"No results"]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
