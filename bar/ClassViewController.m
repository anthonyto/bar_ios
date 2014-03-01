//
//  ClassViewController.m
//  bar
//
//  Created by Anthony To on 2/28/14.
//  Copyright (c) 2014 Anthony To. All rights reserved.
//

#import "ClassViewController.h"



@interface ClassViewController ()
{
    NSMutableData *fapiReceiver;
}

@end

@implementation ClassViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    fapiReceiver = [[NSMutableData alloc] init];
		
    slider.minimumValue = 0;
    slider.maximumValue = 10;
    slider.value = 5;
    slider.continuous = NO;
    scoreLabel.text = @"5";
    self.sliderValue = 5;
    classLabel.text = self.className;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)changeSliderValue:(id)sender
{
    NSLog(@"%@", self.className);
    UIDevice *device = [UIDevice currentDevice];
    self.uid = [[device identifierForVendor]UUIDString];
    NSLog(@"UID in the slider change: %@", self.uid);
    self.sliderValue = slider.value;
    
    // Set slider view to reflect sliderValue
    [slider setValue:self.sliderValue animated:YES];

    // Update the label view to reflect updated sliderValue
	[scoreLabel setText:[NSString stringWithFormat:@"%d", self.sliderValue]];

    // Begin HTTP
//    NSURL *url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"http://clickerfire.herokuapp.com/create?event=%@&uid=%@&score=%d",
//                                                self.className, self.uid, self.sliderValue]];
//    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:url];
//    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:req delegate:self];
//    [connection start];
    
    // Get a reference to the users score location
    Firebase* scoreRef = [[Firebase alloc] initWithUrl:[NSString stringWithFormat:@"https://fiery-fire-2615.firebaseio.com/class/%@/students/%@", self.className, self.uid]];
    [[scoreRef childByAppendingPath:@"score"] setValue:[NSString stringWithFormat:@"%d", self.sliderValue]];
}

#pragma mark NSURLConnection Methods
// Used for HTTP request 
- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSError *error = nil;
    NSDictionary *data = [NSJSONSerialization JSONObjectWithData:fapiReceiver options:NSJSONReadingAllowFragments error:&error];
    
    [connection cancel];
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Error During Connection: %@", [error description]);
}

@end


