//
//  PeopleViewModel.h
//  mvvmSampleObj
//
//  Created by Saurabh Verma on 15/03/2017.
//  Copyright © 2017 Outware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CharacterViewModel.h"

@class People;
@interface PeopleViewModel : NSObject

@property(nonatomic) NSString* emptyScreenText;
@property(nonatomic) NSString* noMoreResultsText;
@property(nonatomic) NSString* errorMessageText;
@property(nonatomic) NSString* totalCountText;
@property(nonatomic) NSArray <CharacterViewModel*> * characterViewModels;

- (instancetype)initWithPeople:(People*)people;
@end
