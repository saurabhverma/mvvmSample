//
//  CharacterViewModelTests.m
//  mvvmSampleObj
//
//  Created by Saurabh Verma on 15/03/2017.
//  Copyright © 2017 Outware. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CharacterViewModel.h"

@interface CharacterViewModelTests : XCTestCase

@end

@implementation CharacterViewModelTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCharacterViewModelValues {

    Character* character = [[Character alloc] init];
    character.name = @"Luke Skywalker";
    character.height = @"1.72 m";
    character.birthYear = @"19 BBY";
    character.gender = @"Male";

    CharacterViewModel* charViewModel = [[CharacterViewModel alloc] initWithcharacter:character];

    XCTAssertEqual(charViewModel.nameText, @"Luke Skywalker");
    XCTAssertEqual(charViewModel.heightText, @"1.72 m");
    XCTAssertEqual(charViewModel.birthYearText, @"19 BBY");
    XCTAssertEqual(charViewModel.genderText, @"Male");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
