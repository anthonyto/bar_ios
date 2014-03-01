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
    
    self.sliderValue = slider.value;
    
    // Set slider view to reflect sliderValue
    [slider setValue:self.sliderValue animated:YES];

    // Update the label view to reflect updated sliderValue
	[scoreLabel setText:[NSString stringWithFormat:@"%d", self.sliderValue]];

    // Get a reference to the users score location
    Firebase* scoreRef = [[Firebase alloc] initWithUrl:@"https://fiery-fire-2615.firebaseio.com/class/stats101/students/3"];
    [[scoreRef childByAppendingPath:@"score"] setValue:[NSString stringWithFormat:@"%d", self.sliderValue]];
}

@end


