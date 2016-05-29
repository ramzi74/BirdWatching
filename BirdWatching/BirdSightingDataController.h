//
//  BirdsSightingDataController.h
//  BirdWatching
//
//  Created by Ramzi on 8/19/13.
//  Copyright (c) 2013 RamziHijazi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BirdSighting;

@interface BirdSightingDataController : NSObject

@property (nonatomic, copy) NSMutableArray *masterBirdSightingList;

- (NSUInteger)countOfList;
- (BirdSighting *)objectInListAtIndex:(NSUInteger)theIndex;
- (void)addBirdSightingWithSighting:(BirdSighting *)sighting;
-(void)removeObjectFromMasterBirdSightingListAtIndex:(NSUInteger)index;

@end
