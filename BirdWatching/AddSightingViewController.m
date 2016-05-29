//
//  AddSightingViewController.m
//  BirdWatching
//
//  Created by Ramzi on 8/19/13.
//  Copyright (c) 2013 RamziHijazi. All rights reserved.
//

#import "AddSightingViewController.h"
#import "BirdSighting.h"

@interface AddSightingViewController ()

@end

@implementation AddSightingViewController
{
  CLLocationManager *locationManager;
}
/*
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/
- (void)viewDidLoad
{
  [super viewDidLoad];
  
  // Uncomment the following line to preserve selection between presentations.
  // self.clearsSelectionOnViewWillAppear = NO;
  
  // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
  // self.navigationItem.rightBarButtonItem = self.editButtonItem;
  
  locationManager = [[CLLocationManager alloc] init];

  self.myCell.textLabel.text = @"";
  self.btDone.enabled = NO;
  [self startStandardUpdates]; //start tracking gps location..

}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

-(void)viewWillDisappear:(BOOL)animated{
  [self stopUpdatingLocation];
}
#pragma mark - Location Services
- (void)startStandardUpdates
{
  
  // Create the location manager if this object does not
  // already have one.
  if (nil == locationManager)
    locationManager = [[CLLocationManager alloc] init];
  
  locationManager.delegate = self;
  locationManager.desiredAccuracy = kCLLocationAccuracyBest; // kCLLocationAccuracyKilometer;
  
  // Set a movement threshold for new events.
//  locationManager.distanceFilter = 500; // meters
  locationManager.distanceFilter = kCLDistanceFilterNone; // meters
  
  [locationManager startUpdatingLocation];
}

// Delegate method from the CLLocationManagerDelegate protocol.
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
  // If it's a relatively recent event, turn off updates to save power.
  CLLocation* location = [locations lastObject];
  NSDate* eventDate = location.timestamp;
  NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
  if (abs(howRecent) < 15.0) {
    // If the event is recent, do something with it.
    NSLog(@"latitude %+.6f, longitude %+.6f\n", location.coordinate.latitude, location.coordinate.longitude);
    self.myCell.textLabel.text = [NSString stringWithFormat:@"%+.6f %+.6f", location.coordinate.latitude, location.coordinate.longitude];
    [self stopUpdatingLocation];
  }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
  // The location "unknown" error simply means the manager is currently unable to get the location.
  NSLog(@"locationManager Error: location unknown.");
  if ([error code] != kCLErrorLocationUnknown) {
    [self stopUpdatingLocation];
  }
}

- (void)stopUpdatingLocation{
  [locationManager stopUpdatingLocation];
  locationManager.delegate = nil;
}

#pragma mark - Table view data source
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}
 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate
/*
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
 
}
*/
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([[segue identifier] isEqualToString:@"ReturnInput"]) {
    if ([self.birdNameInput.text length] || [self.locationInput.text length]) {
      BirdSighting *sighting;
      NSDate *today = [NSDate date];
      sighting = [[BirdSighting alloc] initWithName:self.birdNameInput.text location:self.locationInput.text date:today];
      self.birdSighting = sighting;
    }
  }
}

#pragma mark - TextField Delegates
- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    if ((textField == self.birdNameInput) || (textField == self.locationInput))
        [textField resignFirstResponder];
    return YES;
}
-(BOOL) textFieldShouldBeginEditing:(UITextField *)textField
{
  return YES;
}


- (IBAction)txtNameEditingBegan:(UITextField *)sender {

}

- (IBAction)txtNameEditingEnded:(UITextField *)sender {
  if (sender == self.birdNameInput){
    if ([sender.text isEqualToString:@""]){
      self.btDone.enabled = NO;
      //self.myCell.textLabel.text = @"";
    }
    else{
      self.btDone.enabled = YES;
    }
  }
}

@end
