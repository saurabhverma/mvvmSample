//
//  People.h
//  mvvmSampleObj
//
//  Created by Saurabh Verma on 16/03/2017.
//  Copyright © 2017 Outware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>
#import "Character.h"

@interface People : JSONModel

@property(nonatomic) NSString <Optional> * count;
@property(nonatomic) NSString <Optional>* nextPageUrl;
@property(nonatomic) NSString <Optional>* prevPageUrl;
@property(nonatomic) NSArray <Character> * characters;
@end
