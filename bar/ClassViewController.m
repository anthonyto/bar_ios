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
    scoreLabel.text = @"50";
    self.sliderValue = 50;
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
    NSURL *url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"http://clickerfire.herokuapp.com/event?event=%@&uid=%d&score=%d", self.className, 200, self.sliderValue]];
//    NSURL *url = [[NSURL alloc] initWithString:[@"http://clickerfire.herokuapp.com/event"]];
//    NSString *post = [NSString stringWithFormat:@"event=%@&uid=%@&score=%d", self.className, self.uid, self.sliderValue];
//    NSString *post = [NSString stringWithFormat:@"event=%@&uid=%d&score=%d", self.className, 200, self.sliderValue];
//    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
//    NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
//    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://clickerfire.herokuapp.com/event"]]];
//    [request setHTTPMethod:@"POST"];
//    NSMutableData *body = [[NSMutableData alloc] init];
//    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
//    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Current-Type"];
//    [request setHTTPBody:postData];
//    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    
    [connection start];
    
    NSLog(@"Before firebase");
    // Listen to class average and update THIS IS BREAKING SHIT
//    Firebase* scoreRef = [[Firebase alloc] initWithUrl:[NSString stringWithFormat:@"https://blistering-fire-5490.firebaseio.com/class/%@", self.className]];
////    [[scoreRef childByAppendingPath:@"score"] setValue:[NSString stringWithFormat:@"%d", self.sliderValue]];
//    [scoreRef observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
//        classAverageLabel.text = snapshot.value;
//    }];
    NSLog(@"After firebase");
}

// Used for HTTP request
- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    _fapiReceiver = [[NSMutableData alloc] init];
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
        NSLog(@"DRD");
    [_fapiReceiver appendData:data];
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"connDFL");
    NSError *error = nil;
    NSDictionary *data = [NSJSONSerialization JSONObjectWithData:_fapiReceiver options:NSJSONReadingAllowFragments error:&error];
    
    [connection cancel];
    NSLog(@"CDFL Done");
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Error During Connection: %@", [error description]);
}

@end


