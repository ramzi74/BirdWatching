//
//  DataHolder.m
//  BirdWatching
//
//  Created by Ramzi on 8/10/14.
//  Copyright (c) 2014 RamziHijazi. All rights reserved.
//

#import "DataHolder.h"

NSString * const kName = @"kName";
NSString * const kLocation = @"kLocation";
NSString * const kDate = @"kDate";

@implementation DataHolder

- (id) init
{
  self = [super init];
  if (self)
  {
    _name = @"";
    _location = @"";
    _date = [NSDate date];
  }
  return self;
}

+ (DataHolder *)sharedInstance
{
  static DataHolder *_sharedInstance = nil;
  static dispatch_once_t onceSecurePredicate;
  dispatch_once(&onceSecurePredicate,^
                {
                  _sharedInstance = [[self alloc] init];
                });
  
  return _sharedInstance;
}

//in this example you are saving data to NSUserDefault's
//you could save it also to a file or to some more complex
//data structure: depends on what you need, really

-(void)saveData
{
  [[NSUserDefaults standardUserDefaults] setObject:self.name forKey:kName];
  [[NSUserDefaults standardUserDefaults] setObject:self.location forKey:kLocation];
  [[NSUserDefaults standardUserDefaults] setObject:self.date forKey:kDate];
  
  [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void)loadData
{
  if ([[NSUserDefaults standardUserDefaults] objectForKey:kName])
  {
    self.name = (NSString *)[[NSUserDefaults standardUserDefaults] objectForKey:kName];
    self.location = (NSString *)[[NSUserDefaults standardUserDefaults] objectForKey:kLocation];
    self.date = (NSDate *)[[NSUserDefaults standardUserDefaults] objectForKey:kDate];
  }
  else
  {
    self.name = @"";
    self.location = @"";
    self.date = nil;
  }
}
@end