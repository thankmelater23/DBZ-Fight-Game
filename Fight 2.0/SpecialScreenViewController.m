//
//  SpecialScreenViewController.m
//  Fight 2.0
//
//  Created by Andre on 4/6/13.
//  Copyright (c) 2013 Bing Bang Boom Studios. All rights reserved.
//

#import "SpecialScreenViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import "Player.h"
#import "Globals:Constants.h"
#import "Methods.h"

@interface SpecialScreenViewController ()

@end

@implementation SpecialScreenViewController

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
    [self setSpecialScreen];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setSpecialScreen
{
    [self.specPlayerName setTitle:[whosTurn() name] forState:UIControlStateNormal];
    [self.specPlayerHealthBar setValue:[whosTurn() health]];
    [self.specPlayerHealthLabel setText:[NSString stringWithFormat:@"%i",[whosTurn() health]]];
    
    if (whosTurn() == player1)
    {
        [self.specPlayerImage setImage:[UIImage imageNamed:@"player1 powerup.png"]];
        
    }
    
    
    else
    {
        [self.specPlayerImage setImage:[UIImage imageNamed:@"player2 powerup.png"]];
    }
}

@end
