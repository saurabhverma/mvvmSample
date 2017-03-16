//
//  PeopleViewModel.m
//  mvvmSampleObj
//
//  Created by Saurabh Verma on 15/03/2017.
//  Copyright © 2017 Outware. All rights reserved.
//

#import "PeopleViewModel.h"
#import "People.h"

@interface PeopleViewModel ()

@property(nonatomic) People *people;
@end

@implementation PeopleViewModel

- (instancetype)initWithPeople:(People*)people {
    self = [super init];

    if (self) {
        _people = people;

        NSMutableArray* charViewModels = [NSMutableArray array];
        for (Character* character in _people.characters) {
            @autoreleasepool {
                CharacterViewModel* charViewModel = [[CharacterViewModel alloc] initWithcharacter:character];
                [charViewModels addObject:charViewModel];
            }
        }
        _characterViewModels = charViewModels;

        //We would never need characters on people model after this. All characters are with CharacterViewModel now.
        _people.characters = nil;
    }
    return self;
}

- (NSString*)noMoreResultsText {
    return @"That's all folks!!!";
}
- (NSString*)emptyScreenText {
    return @"No results";
}
- (NSString*)totalCountText {
    //return  self.people.count;
    return [NSString stringWithFormat:@"%@ People in total", self.people.count];
}
@end
