//
//  Character.m
//  mvvmSampleObj
//
//  Created by Saurabh Verma on 14/03/2017.
//  Copyright © 2017 Outware. All rights reserved.
//

#import "Character.h"

@implementation Character

+ (JSONKeyMapper *)keyMapper
{
    return [JSONKeyMapper mapperForSnakeCase];
}
@end
