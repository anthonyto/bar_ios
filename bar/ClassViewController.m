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
    if (self) {
        // Custom initialization
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
		
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeSliderValue:(id)sender 
{
	int sliderValue;
    sliderValue = lroundf(slider.value);
    [slider setValue:sliderValue animated:YES];
	NSLog(@"Slider Value: %f: ", slider.value);
	[scoreLabel setText:[NSString stringWithFormat:@"%d", sliderValue]];
    
    NSURL *url = [[]
}

#pragma mark NSURLConnection Methods

- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [fapiReceiver setLength:0];
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [fapiReceiver appendData:data];
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


