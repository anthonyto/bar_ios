//
//  LandingPageViewController.h
//  bar
//
//  Created by Anthony To on 2/28/14.
//  Copyright (c) 2014 Anthony To. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LandingPageViewController : UIViewController
{
    
    IBOutlet UITextField *classLabel;
    IBOutlet UIButton *joinButton;
}
- (IBAction)joinButtonPressed:(id)sender;

@end
