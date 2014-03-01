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
//    NSMutableData *fapiReceiver;
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
    
//    fapiReceiver = [[NSMutableData alloc] init];
    
    // Create a reference to a firebase location
    Firebase* fapi = [[Firebase alloc] initWithUrl:@"https://resplendent-fire-2962.firebaseIO.com"];
		
    slider.minimumValue = 0;
    slider.maximumValue = 10;
    slider.value = 5;
    slider.continuous = NO;
    scoreLabel.text = @"5";
    self.sliderValue = 5;
		
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeSliderValue:(id)sender 
{
    self.sliderValue = slider.value;
    [slider setValue:self.sliderValue animated:YES];
	NSLog(@"Slider Value: %f: ", slider.value);
	[scoreLabel setText:[NSString stringWithFormat:@"%d", self.sliderValue]];
    
    // Get a reference to the users score location
    Firebase* scoreRef = [[Firebase alloc] initWithUrl:@"https://resplendent-fire-2962.firebaseio.com/class/stats102/students"];

    [[scoreRef childByAppendingPath:@"to"] setValue:[NSString stringWithFormat:@"%d", self.sliderValue]];
//    [[scoreRef childByAppendingPath:@"to"] setValue:self.sliderValue];
}

@end


