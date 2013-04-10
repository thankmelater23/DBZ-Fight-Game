//
//  ViewController.m
//  Fight 2.0
//
//  Created by Andre on 3/14/13.
//  Copyright (c) 2013 HnG Studios. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import "Player.h"
#import "Globals:Constants.h"
#import "Methods.h"



@interface ViewController ()

@end

@implementation ViewController

//System Methods
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (newGame == NO)
    {
        initResources();
        blinkingBoxBool = YES;
        newGame = YES;
        
        [healthBarUpdater invalidate];
        healthBarUpdater = nil;
        healthBarUpdater = [NSTimer scheduledTimerWithTimeInterval:.5 target:self selector:@selector(setHealthBar) userInfo:nil repeats:YES];
    }

    [self enableButtons];
    [self setScreen];
    [self.gameTextBox setText:[NSString stringWithFormat:@"%@ turn", [whosTurn() name]]];
}
- (void)     didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)     shouldAutorotate
{
    return NO;
}
- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}



//Gameplay
//User Interaction
-(IBAction) punch
{
    [self textLoader:[whosTurn() punchOpp:self.player1Image player2Image:self.player2Image textBox:self.gameTextBox]];
    [self textBoxEnabled];
    
}//Punch button
-(IBAction) kick
{    
    [self textLoader:[whosTurn() kickOpp:self.player1Image player2Image:self.player2Image textBox:self.gameTextBox]];
    [self textBoxEnabled];
}//Kick Button
-(IBAction) Super
{
    [self.gameTextBox setText:[whosTurn() superAtackOpp]];
    [self setScreen];
}//Super attack button
-(IBAction) potion
{
    [self textLoader:[whosTurn() usePotion]];
    [self textBoxEnabled];
    [self setScreen];
}//Potion button
-(IBAction) swapLife
{
    [self textLoader:[whosTurn() swapLife]];
    [self textBoxEnabled];
    [self setScreen];
}//Swaps players life only can be used once a game and also has a low percentage


//Engine methods
-(void) textBoxEnabled
{
    [self.playerNameButton setUserInteractionEnabled:NO];
    [self.punchButton setUserInteractionEnabled:NO];
    [self.kickButton setUserInteractionEnabled:NO];
    [self.superButton setUserInteractionEnabled:NO];
    [self.potionButton setUserInteractionEnabled:NO];
    [self.specialButton setUserInteractionEnabled:NO];
    [self.swapLifeButton setUserInteractionEnabled:NO];
    
    [self.goButton setHidden:NO];
    [self.goButton setUserInteractionEnabled:YES];
    
    blinkingBoxTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(blinkingOkButton) userInfo:nil repeats:YES];
    
}//Disable all buttons only leaves ok button available to get through text
-(void) enableButtons
{
    [self.playerNameButton setUserInteractionEnabled:YES];
    [self.punchButton setUserInteractionEnabled:YES];
    [self.kickButton setUserInteractionEnabled:YES];
    [self.superButton setUserInteractionEnabled:YES];
    [self.potionButton setUserInteractionEnabled:YES];
    [self.specialButton setUserInteractionEnabled:YES];
    [self.swapLifeButton setUserInteractionEnabled:YES];
    
    [self.goButton setHidden:YES];
    [self.goButton setUserInteractionEnabled:NO];
    
    [blinkingBoxTimer invalidate];
    blinkingBoxTimer = nil;
    
}//Enables buttons interaction to allow gameplay selection/Non text


//Game Screen Update Methods
-(void) setUniqueLookForCurrentPlayerTurn
{
    Player *currentPlayerTurn = whosTurn();
    
    if (currentPlayerTurn == player1)
    {
        [self.playerNameButton setTitle:[currentPlayerTurn name] forState:UIControlStateNormal];
        self.view.backgroundColor = [UIColor redColor];
        self.playerNameButton.tintColor = [UIColor blackColor];
        [self.playerNameButton setTitleColor: [UIColor redColor] forState:UIControlStateNormal];
        [[self player1BackGroundColor]setHidden:NO];
        [[self player2BackGroundColor]setHidden:YES];
    }
    
    
    if (currentPlayerTurn == player2)
    {
        [self.playerNameButton setTitle:[currentPlayerTurn name] forState:UIControlStateNormal];
        self.view.backgroundColor = [UIColor blueColor];
        self.playerNameButton.tintColor = [UIColor blackColor];
        [self.playerNameButton setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];
        [[self player1BackGroundColor]setHidden:YES];
        [[self player2BackGroundColor]setHidden:NO];
    }
}//Sets screen color and button name for which player turn it is
-(void) setScreen
{
    [self setHealthBar];
    [self setPotionsImage];
    [self setUniqueLookForCurrentPlayerTurn];
    
    
}//Sets all buttons to a certin color
-(void) setHealthBar
{
    if ([player1 health] >= healthMax)
    {
        [player1 setHealth:healthMax];
    }
    
    if ([player2 health] >= healthMax)
    {
        [player2 setHealth:healthMax];
    }
    
    if ([player1 health] <= 0)
    {
        [player1 setHealth:0];
    }
    
    if ([player2 health] <= 0)
    {
        [player2 setHealth:0];
    }
    
    
    [self.player1HealthBar setValue: 100 - ([player1 health])];
    [self.player2HealthBar setValue: [player2 health]];
    [self.player1HealthButton setText:[NSString stringWithFormat:@"%i", [player1 health]]];
    [self.player2HealthButton setText:[NSString stringWithFormat:@"%i", [player2 health]]];
    
    if ([player1 isDead])
    {
        [self textBoxEnabled];
    }
    
    if ([player2 isDead])
    {
        [self textBoxEnabled];
    }
    
    if (swapLifeUsed == YES)
    {
        [[self swapLifeButton]setAlpha:specialScreenImagesFadeOut];
    }
    
    else
    {
        [[self swapLifeButton]setAlpha:specialScreenImagesFadeIn];
    }
}//Sets up health bars and button to represent players health
-(void) setPotionsImage
{
    switch ([player1 potions])
    {
        case 3:
        {
            [self.p1Potion1 setAlpha:specialScreenImagesFadeIn];
            [self.p1Potion2 setAlpha:specialScreenImagesFadeIn];
            [self.p1Potion3 setAlpha:specialScreenImagesFadeIn];
            break;
        }
            
        case 2:
        {
            [self.p1Potion1 setAlpha:specialScreenImagesFadeIn];
            [self.p1Potion2 setAlpha:specialScreenImagesFadeIn];
            [self.p1Potion3 setAlpha:specialScreenImagesFadeOut];
            break;
        }
            
        case 1:
        {
            [self.p1Potion1 setAlpha:specialScreenImagesFadeIn];
            [self.p1Potion2 setAlpha:specialScreenImagesFadeOut];
            [self.p1Potion3 setAlpha:specialScreenImagesFadeOut];
            break;
        }
            
        default:
        {
            [self.p1Potion1 setAlpha:specialScreenImagesFadeOut];
            [self.p1Potion2 setAlpha:specialScreenImagesFadeOut];
            [self.p1Potion3 setAlpha:specialScreenImagesFadeOut];
            break;
        }
    }
    
    switch ([player2 potions])
    {
        case 3:
        {
            [self.p2Potion1 setAlpha:specialScreenImagesFadeIn];
            [self.p2Potion2 setAlpha:specialScreenImagesFadeIn];
            [self.p2Potion3 setAlpha:specialScreenImagesFadeIn];
            break;
        }
            
        case 2:
        {
            [self.p2Potion1 setAlpha:specialScreenImagesFadeIn];
            [self.p2Potion2 setAlpha:specialScreenImagesFadeIn];
            [self.p2Potion3 setAlpha:specialScreenImagesFadeOut];
            break;
        }
            
        case 1:
        {
            [self.p2Potion1 setAlpha:specialScreenImagesFadeIn];
            [self.p2Potion2 setAlpha:specialScreenImagesFadeOut];
            [self.p2Potion3 setAlpha:specialScreenImagesFadeOut];
            break;
        }
            
        case 0:
        {
            [self.p2Potion1 setAlpha:specialScreenImagesFadeOut];
            [self.p2Potion2 setAlpha:specialScreenImagesFadeOut];
            [self.p2Potion3 setAlpha:specialScreenImagesFadeOut];
            break;
        }
            
        default:
        {
            NSLog(@"issue with setPotionsImage(variable is giving out wrong number");
            [self.p2Potion1 setAlpha:specialScreenImagesFadeOut];
            [self.p2Potion2 setAlpha:specialScreenImagesFadeOut];
            [self.p2Potion3 setAlpha:specialScreenImagesFadeOut];
            break;
        }
    }
}


//Text Box Methods
-(void)    textLoader:       (NSMutableArray*) array
{
    stringTextHolder = array;
    stringTextHolderCount = [array count];
    stringTextHolderCurrentCount = 0;
    [self.gameTextBox setText:stringTextHolder[stringTextHolderCurrentCount]];
}
-(IBAction)continueText
{
    ++stringTextHolderCurrentCount;
    if (stringTextHolderCurrentCount >= stringTextHolderCount)
    {
        [self enableButtons];
        [self setScreen];
        [self.gameTextBox setText:[NSString stringWithFormat:@"%@ turn", [whosTurn() name]]];
    }
    
    else
    {
        
        [self.gameTextBox setText:stringTextHolder[stringTextHolderCurrentCount]];
    }
}
-(void)    blinkingOkButton
{
    if (blinkingBoxBool == YES)
    {
        [self.goButton setBackgroundImage:[UIImage imageNamed:@"yellowBox.png"] forState:UIControlStateNormal];
        blinkingBoxBool = NO;
    }
    
    else
    {
        [self.goButton setBackgroundImage:[UIImage imageNamed:@"whiteBox.png"] forState:UIControlStateNormal];
        blinkingBoxBool = YES;
    }
}


@end
