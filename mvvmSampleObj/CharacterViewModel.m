//
//  CharacterViewModel.m
//  mvvmSampleObj
//
//  Created by Saurabh Verma on 14/03/2017.
//  Copyright © 2017 Outware. All rights reserved.
//

#import "CharacterViewModel.h"
#import "Character.h"

@interface CharacterViewModel()

@property(nonatomic) Character* character;
@end

@implementation CharacterViewModel

- (instancetype)initWithcharacter:(Character*)character {
    self = [super init];

    if (self) {
        _character = character;
    }
    return self;
}

- (NSString*)nameText {
    return self.character.name;
}

- (NSString*)genderText {
    return  self.character.gender;
}

- (NSString*)heightText {
    return self.character.height;
}

- (NSString*)birthYearText {
    return self.character.birthYear;
}
@end
