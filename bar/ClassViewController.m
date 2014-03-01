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
    NSMutableData *_fapiReceiver;
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
    
    _fapiReceiver = [[NSMutableData alloc] init];
		
    slider.minimumValue = 0;
    slider.maximumValue = 100;
    slider.value = 50;
    slider.continuous = NO;
    self.sliderValue = 50;
    
    aveScores.progress = .5;
    
    
//    scoreLabel.text = @"50";
    classLabel.text = self.className;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)changeSliderValue:(id)sender
{
    // Get device UID
    UIDevice *device = [UIDevice currentDevice];
    self.uid = [[device identifierForVendor]UUIDString];
    
    // Set slider stuff
    self.sliderValue = slider.value;
    [slider setValue:self.sliderValue animated:YES];
//	[scoreLabel setText:[NSString stringWithFormat:@"%d", self.sliderValue]];
    

    // Begin HTTP request
    NSURL *url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"http://clickerfire.herokuapp.com/event?event=%@&uid=%d&score=%d", self.className, 200, self.sliderValue]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection start];
    
    // Listen realtime for class average from firebase
    Firebase* scoreRef = [[Firebase alloc] initWithUrl:[NSString stringWithFormat:@"https://blistering-fire-5490.firebaseio.com/class/%@/score", self.className]];
    [scoreRef observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot)
    {
        NSLog(@"%@", snapshot.value);
        float floatVal = (snapshot.value == [NSNull null] ? 0 : [snapshot.value floatValue]);
//        classAverageLabel.text = [NSString stringWithFormat:@"Average is %@", snapshot.value];
        // Update progress bar
        aveScores.progress = floatVal/100;
    }];
    
}

// Used for HTTP request
- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    _fapiReceiver = [[NSMutableData alloc] init];
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_fapiReceiver appendData:data];
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSError *error = nil;
//    NSDictionary *data = [NSJSONSerialization JSONObjectWithData:_fapiReceiver options:NSJSONReadingAllowFragments error:&error];
    
    [connection cancel];
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Error During Connection: %@", [error description]);
}

@end


