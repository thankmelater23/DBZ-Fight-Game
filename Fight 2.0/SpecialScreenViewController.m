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
    [self setPotionsImages];
    [self setSpecial1Images];
    [self setSpecial2Images];
    [self setSpecial3Images];
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

-(void) setPotionsImages
{
    switch ([whosTurn() potions])
    {
        case 3:
        {
            [self.specPlayerPot1 setAlpha:specialScreenImagesFadeIn];
            [self.specPlayerPot2 setAlpha:specialScreenImagesFadeIn];
            [self.specPlayerPot3 setAlpha:specialScreenImagesFadeIn];
            break;
        }
            
        case 2:
        {
            [self.specPlayerPot1 setAlpha:specialScreenImagesFadeIn];
            [self.specPlayerPot2 setAlpha:specialScreenImagesFadeIn];
            [self.specPlayerPot3 setAlpha:specialScreenImagesFadeOut];
            break;
        }
            
        case 1:
        {
            [self.specPlayerPot1 setAlpha:specialScreenImagesFadeIn];
            [self.specPlayerPot2 setAlpha:specialScreenImagesFadeOut];
            [self.specPlayerPot3 setAlpha:specialScreenImagesFadeOut];
            break;
        }
            
        case 0:
        {
            NSLog(@"issue with setSpecial1Images(variable is giving out wrong number");
            [self.specPlayerPot1 setAlpha:specialScreenImagesFadeOut];
            [self.specPlayerPot2 setAlpha:specialScreenImagesFadeOut];
            [self.specPlayerPot3 setAlpha:specialScreenImagesFadeOut];
            break;
        }
            
        default:
        {
            NSLog(@"issue with setSpecial1Images(variable is giving out wrong number");
            [self.specPlayerPot1 setAlpha:specialScreenImagesFadeOut];
            [self.specPlayerPot2 setAlpha:specialScreenImagesFadeOut];
            [self.specPlayerPot3 setAlpha:specialScreenImagesFadeOut];
            break;
        }
    }
}

-(void) setSpecial1Images
{
    switch ([whosTurn() doublePunch])
    {
        case 3:
        {
            [self.specialOneCheck1 setAlpha:specialScreenImagesFadeIn];
            [self.specialOneCheck2 setAlpha:specialScreenImagesFadeIn];
            [self.specialOneCheck3 setAlpha:specialScreenImagesFadeIn];
            break;
        }
            
        case 2:
        {
            [self.specialOneCheck1 setAlpha:specialScreenImagesFadeIn];
            [self.specialOneCheck2 setAlpha:specialScreenImagesFadeIn];
            [self.specialOneCheck3 setAlpha:specialScreenImagesFadeOut];
            break;
        }
            
        case 1:
        {
            [self.specialOneCheck1 setAlpha:specialScreenImagesFadeIn];
            [self.specialOneCheck2 setAlpha:specialScreenImagesFadeOut];
            [self.specialOneCheck3 setAlpha:specialScreenImagesFadeOut];
            break;
        }
            
        case 0:
        {
            [self.specialOneCheck1 setAlpha:specialScreenImagesFadeOut];
            [self.specialOneCheck2 setAlpha:specialScreenImagesFadeOut];
            [self.specialOneCheck3 setAlpha:specialScreenImagesFadeOut];
            break;
        }
            
        default:
        {
            NSLog(@"issue with setSpecial1Images(variable is giving out wrong number");
            [self.specialOneCheck1 setAlpha:specialScreenImagesFadeOut];
            [self.specialOneCheck2 setAlpha:specialScreenImagesFadeOut];
            [self.specialOneCheck3 setAlpha:specialScreenImagesFadeOut];
            break;
        }
    }
}

-(void) setSpecial2Images
{
    switch ([whosTurn() tripleKick])
    {
        case 3:
        {
            [self.specialTwoCheck1 setAlpha:specialScreenImagesFadeIn];
            [self.specialTwoCheck2 setAlpha:specialScreenImagesFadeIn];
            [self.specialTwoCheck3 setAlpha:specialScreenImagesFadeIn];
            break;
        }
            
        case 2:
        {
            [self.specialTwoCheck1 setAlpha:specialScreenImagesFadeIn];
            [self.specialTwoCheck2 setAlpha:specialScreenImagesFadeIn];
            [self.specialTwoCheck3 setAlpha:specialScreenImagesFadeOut];
            break;
        }
            
        case 1:
        {
            [self.specialTwoCheck1 setAlpha:specialScreenImagesFadeIn];
            [self.specialTwoCheck2 setAlpha:specialScreenImagesFadeOut];
            [self.specialTwoCheck3 setAlpha:specialScreenImagesFadeOut];
            break;
        }
            
        case 0:
        {
            [self.specialTwoCheck1 setAlpha:specialScreenImagesFadeOut];
            [self.specialTwoCheck2 setAlpha:specialScreenImagesFadeOut];
            [self.specialTwoCheck3 setAlpha:specialScreenImagesFadeOut];
            break;
        }
            
        default:
        {
            NSLog(@"issue with setSpecial2Images(variable is giving out wrong number");
            [self.specialTwoCheck1 setAlpha:specialScreenImagesFadeOut];
            [self.specialTwoCheck2 setAlpha:specialScreenImagesFadeOut];
            [self.specialTwoCheck3 setAlpha:specialScreenImagesFadeOut];
            break;
        }
    }
}

-(void) setSpecial3Images
{
    switch ([whosTurn() superPunch])
    {
        case 3:
        {
            [self.specialThreeCheck1 setAlpha:specialScreenImagesFadeIn];
            [self.specialThreeCheck2 setAlpha:specialScreenImagesFadeIn];
            [self.specialThreeCheck3 setAlpha:specialScreenImagesFadeIn];
            break;
        }
            
        case 2:
        {
            [self.specialThreeCheck1 setAlpha:specialScreenImagesFadeIn];
            [self.specialThreeCheck2 setAlpha:specialScreenImagesFadeIn];
            [self.specialThreeCheck3 setAlpha:specialScreenImagesFadeOut];
            break;
        }
            
        case 1:
        {
            [self.specialThreeCheck1 setAlpha:specialScreenImagesFadeIn];
            [self.specialThreeCheck2 setAlpha:specialScreenImagesFadeOut];
            [self.specialThreeCheck3 setAlpha:specialScreenImagesFadeOut];
            break;
        }
            
        case 0:
        {
            [self.specialThreeCheck1 setAlpha:specialScreenImagesFadeOut];
            [self.specialThreeCheck2 setAlpha:specialScreenImagesFadeOut];
            [self.specialThreeCheck3 setAlpha:specialScreenImagesFadeOut];
            break;
        }
            
        default:
        {
            NSLog(@"issue with setSpecial3Images(variable is giving out wrong number");
            [self.specialThreeCheck1 setAlpha:specialScreenImagesFadeOut];
            [self.specialThreeCheck2 setAlpha:specialScreenImagesFadeOut];
            [self.specialThreeCheck3 setAlpha:specialScreenImagesFadeOut];
            break;
        }
    }
}

@end
