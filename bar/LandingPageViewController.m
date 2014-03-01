//
//  LandingPageViewController.m
//  bar
//
//  Created by Anthony To on 2/28/14.
//  Copyright (c) 2014 Anthony To. All rights reserved.
//

#import "LandingPageViewController.h"
#import <Firebase/Firebase.h>
#import "ClassViewController.h"


@interface LandingPageViewController ()

@end

@implementation LandingPageViewController

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
    
//    self.view.backgroundColor = [UIColor colorWith]
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)joinButtonPressed:(id)sender
{
    self.className = classTextField.text;
    Firebase* classChecker = [[Firebase alloc] initWithUrl:[NSString stringWithFormat:@"https://resplendent-fire-2962.firebaseio.com/class/%@", _className]];
    [classChecker observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
        if(snapshot.value == [NSNull null])
        {
            classTextField.layer.borderColor=[[UIColor redColor]CGColor];
            classTextField.layer.borderWidth=1.0;
            classLabel.text=@"Class does not exist.";
        }
        else if (![classTextField.text length])
        {
            classTextField.layer.borderColor=[[UIColor redColor]CGColor];
            classTextField.layer.borderWidth=1.0;
            classLabel.text=@"No class entered.";
        }
        else
        {
            [self performSegueWithIdentifier:@"validClassNameToClassView" sender:sender];

        }
    }];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"Foo");
//    if([segue.identifier isEqualToString:@"sendClassNameSegue"])
//    {
//        UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
//        ClassViewController *controller = (ClassViewController *)navController.topViewController;
//        controller.className = @"foo";
//    }
    if([segue.identifier isEqualToString:@"validClassNameToClassView"])
    {
        ClassViewController *controller = (ClassViewController *)segue.destinationViewController;
        controller.className = classTextField.text;
    }
}
@end
