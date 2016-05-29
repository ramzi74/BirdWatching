//
//  DataHolder.h
//  BirdWatching
//
//  Created by Ramzi on 8/10/14.
//  Copyright (c) 2014 RamziHijazi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataHolder : NSObject

+ (DataHolder *)sharedInstance;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *location;
@property (nonatomic) NSDate *date;

-(void) saveData;
-(void) loadData;

@end