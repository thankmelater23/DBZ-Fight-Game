//
//  MenuViewController.m
//  Fight 2.0
//
//  Created by Andre on 3/14/13.
//  Copyright (c) 2013 HnG Studios. All rights reserved.
//

#import "MenuViewController.h"
#import "Globals:Constants.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

//System Methods
-(id)        initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)      viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //Loads Click Sound
    NSURL *buttonURL = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"click" ofType: @"mp3"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)buttonURL, &click);
}
-(BOOL)      shouldAutorotate
{
    return YES;
}
-(NSUInteger) supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}
-(void)       didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//Engine Methods
-(IBAction)startButton {
    AudioServicesPlaySystemSound(click);
    
}
-(IBAction)otherButton {
    AudioServicesPlaySystemSound(click);
}
-(IBAction)goButton
{
    player1Name = self.player1NameField.text;
    player2Name = self.player2NameFiled.text;
}
@end
