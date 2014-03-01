//
//  LandingPageViewController.h
//  bar
//
//  Created by Anthony To on 2/28/14.
//  Copyright (c) 2014 Anthony To. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassViewController.h"

@interface LandingPageViewController : UIViewController
{
    
    IBOutlet UILabel *classLabel;
    IBOutlet UIButton *joinButton;
    IBOutlet UITextField *classTextField;
}
- (IBAction)joinButtonPressed:(id)sender;
@property (nonatomic, assign) NSString *className;

@end
