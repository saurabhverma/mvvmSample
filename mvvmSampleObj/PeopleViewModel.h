//
//  PeopleViewModel.h
//  mvvmSampleObj
//
//  Created by Saurabh Verma on 15/03/2017.
//  Copyright © 2017 Outware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CharacterViewModel.h"

@interface PeopleViewModel : NSObject

@property(nonatomic, readonly) NSString* emptyScreenText;
@property(nonatomic, readonly) NSString* noMoreResultsText;
@property(nonatomic) NSString* errorMessageText;
@property(nonatomic) NSString* totalCountText;
@property(nonatomic) NSArray<CharacterViewModel*> *people;
@end
