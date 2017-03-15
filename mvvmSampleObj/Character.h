//
//  Character.h
//  mvvmSampleObj
//
//  Created by Saurabh Verma on 14/03/2017.
//  Copyright © 2017 Outware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>

@interface Character : JSONModel

//properties
@property(nonatomic) NSString* name;
@property(nonatomic) NSString <Optional>* height;
@property(nonatomic) NSString <Optional>* gender;
@property(nonatomic) NSString <Optional>* birthYear;

@end
