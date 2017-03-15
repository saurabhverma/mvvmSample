//
//  PeopleManager.h
//  mvvmSampleObj
//
//  Created by Saurabh Verma on 14/03/2017.
//  Copyright © 2017 Outware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PeopleViewModel.h"

typedef void(^ _Nullable PMStarWarsPeopleBlock)(PeopleViewModel * _Nonnull result, bool success);

@interface PeopleManager : NSObject

- (void)getStarWarsPeople:(PMStarWarsPeopleBlock)completionHandler;
@end
