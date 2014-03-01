//
//  ClassViewController.h
//  bar
//
//  Created by Anthony To on 2/28/14.
//  Copyright (c) 2014 Anthony To. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassViewController : UIViewController
{
    
    IBOutlet UILabel *classLabel;
    IBOutlet UILabel *scoreLabel;
    IBOutlet UISlider *slider;
    
}

@property (strong, nonatomic) NSMutableData *fapiReceiver;

- (IBAction)changeSliderValue:(id)sender;


@end
