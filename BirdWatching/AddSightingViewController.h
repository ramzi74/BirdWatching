//
//  AddSightingViewController.h
//  BirdWatching
//
//  Created by Ramzi on 8/19/13.
//  Copyright (c) 2013 RamziHijazi. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "BirdSighting.h"
#import <CoreLocation/CoreLocation.h>

@class BirdSighting;

@interface AddSightingViewController : UITableViewController <UITextFieldDelegate, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *birdNameInput;
@property (weak, nonatomic) IBOutlet UITextField *locationInput;
@property (strong, nonatomic) BirdSighting *birdSighting;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btDone;
@property (weak, nonatomic) IBOutlet UITableViewCell *myCell;
- (IBAction)txtNameEditingBegan:(UITextField *)sender;
- (IBAction)txtNameEditingEnded:(UITextField *)sender;

@end
