//
//  BirdsMasterViewController.h
//  BirdWatching
//
//  Created by Ramzi on 8/18/13.
//  Copyright (c) 2013 RamziHijazi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BirdSightingDataController; //forward class declaration...

@interface BirdsMasterViewController : UITableViewController

@property (strong, nonatomic) BirdSightingDataController *dataController;
- (IBAction)done:(UIStoryboardSegue *)segue;
- (IBAction)cancel:(UIStoryboardSegue *)segue;

@end
