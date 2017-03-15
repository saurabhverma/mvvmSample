//
//  CharacterViewModel.h
//  mvvmSampleObj
//
//  Created by Saurabh Verma on 14/03/2017.
//  Copyright © 2017 Outware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Character.h"

@interface CharacterViewModel : NSObject

@property(nonatomic) Character* character;

//Texts
@property(nonatomic) NSString* nameText;
@property(nonatomic) NSString* heightText;
@property(nonatomic) NSString* genderText;
@property(nonatomic) NSString* birthYearText;

- (instancetype)initWithcharacter:(Character*)character;
@end
