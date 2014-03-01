//
//  ClassViewController.h
//  bar
//
//  Created by Anthony To on 2/28/14.
//  Copyright (c) 2014 Anthony To. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Firebase/Firebase.h>

@interface ClassViewController : UIViewController
{
    
    IBOutlet UILabel *classLabel;
    IBOutlet UILabel *scoreLabel;
    IBOutlet UISlider *slider;
}

//@property (strong, nonatomic) NSMutableData *fapiReceiver;
@property (nonatomic, assign) NSInteger sliderValue;


- (IBAction)changeSliderValue:(id)sender;


@end
