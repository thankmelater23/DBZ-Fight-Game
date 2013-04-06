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
    initResources();
    [self enableButtons];
    [self screenForPlayer];
    [[UIButton appearance] setTintColor:[UIColor orangeColor]];
    [_gameTextBox setText:[NSString stringWithFormat:@"%@ turn", [whosTurn() name]]];
    
    blinkingBoxBool = YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)shouldAutorotate
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
    [_gameTextBox setText:[whosTurn() kickOpp]];
    changeTurn();
    [self screenForPlayer];
}//Kick Button
-(IBAction) Super
{
    [_gameTextBox setText:[whosTurn() superAtackOpp]];
    [self screenForPlayer];
}//Super attack button
-(IBAction) potion
{
    [_gameTextBox setText:[whosTurn() usePotion]];
    [self screenForPlayer];
    changeTurn();
}//Potion button
-(IBAction) swapLife
{
    [_gameTextBox setText:[whosTurn() swapLife]];
    [self screenForPlayer];
    changeTurn();
}//Swaps players life only can be used once a game and also has a low percentage


//Engine methods
-(void) textBoxEnabled
{
    [_playerNameButton setUserInteractionEnabled:NO];
    [_punchButton setUserInteractionEnabled:NO];
    [_kickButton setUserInteractionEnabled:NO];
    [_superButton setUserInteractionEnabled:NO];
    [_potionButton setUserInteractionEnabled:NO];
    [_specialButton setUserInteractionEnabled:NO];
    [_swapLifeButton setUserInteractionEnabled:NO];
    
    [_goButton setHidden:NO];
    [_goButton setUserInteractionEnabled:YES];
    
    blinkingBoxTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(blinkingOkButton) userInfo:nil repeats:YES];
    
}//Disable all buttons only leaves ok button available to get through text
-(void) enableButtons
{
    [_playerNameButton setUserInteractionEnabled:YES];
    [_punchButton setUserInteractionEnabled:YES];
    [_kickButton setUserInteractionEnabled:YES];
    [_superButton setUserInteractionEnabled:YES];
    [_potionButton setUserInteractionEnabled:YES];
    [_specialButton setUserInteractionEnabled:YES];
    
    [_goButton setHidden:YES];
    [_goButton setUserInteractionEnabled:NO];
    
    [blinkingBoxTimer invalidate];
    blinkingBoxTimer = nil;
    
}//Enables buttons interaction to allow gameplay selection/Non text


//Game Screen Update Methods
-(void) screenForPlayer
{
    Player *currentPlayerTurn = whosTurn();
    
    if (currentPlayerTurn == player1)
    {
        [_playerNameButton setTitle:[currentPlayerTurn name] forState:UIControlStateNormal];
        self.view.backgroundColor = [UIColor redColor];
        _playerNameButton.tintColor = [UIColor blackColor];
        [_playerNameButton setTitleColor: [UIColor redColor] forState:UIControlStateNormal];
        [self setHealthBar];
    }
    
    
    if (currentPlayerTurn == player2)
    {
        [_playerNameButton setTitle:[currentPlayerTurn name] forState:UIControlStateNormal];
        self.view.backgroundColor = [UIColor blueColor];
        _playerNameButton.tintColor = [UIColor blackColor];
        [_playerNameButton setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];
        [self setHealthBar];
    }
    
    [self setScreen];
    
}//Sets screen color and button name for which player turn it is
-(void) setScreen
{
    [self setPotionsImage];
    
    
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
    
    
    [_player1HealthBar setValue: [player1 health]];
    [_player2HealthBar setValue: [player2 health]];
    [_player1HealthButton setText:[NSString stringWithFormat:@"%i", [player1 health]]];
    [_player2HealthButton setText:[NSString stringWithFormat:@"%i", [player2 health]]];
    
    if ([player1 isDead])
    {
        [self textBoxEnabled];
    }
    
    if ([player2 isDead])
    {
        [self textBoxEnabled];
    }
}//Sets up health bars and button to represent players health
-(void) setPotionsImage
{
    switch ([player1 potions])
    {
        case 3:
        {
            [_p1Potion1 setHidden:NO];
            [_p1Potion2 setHidden:NO];
            [_p1Potion3 setHidden:NO];
            break;
        }
            
        case 2:
        {
            [_p1Potion1 setHidden:NO];
            [_p1Potion2 setHidden:NO];
            [_p1Potion3 setHidden:YES];
            break;
        }
            
        case 1:
        {
            [_p1Potion1 setHidden:NO];
            [_p1Potion2 setHidden:YES];
            [_p1Potion3 setHidden:YES];
            break;
        }
            
        default:
        {
            [_p1Potion1 setHidden:YES];
            [_p1Potion2 setHidden:YES];
            [_p1Potion3 setHidden:YES];
            break;
        }
    }
    
    switch ([player2 potions])
    {
        case 3:
        {
            [_p2Potion1 setHidden:NO];
            [_p2Potion2 setHidden:NO];
            [_p2Potion3 setHidden:NO];
            break;
        }
            
        case 2:
        {
            [_p2Potion1 setHidden:NO];
            [_p2Potion2 setHidden:NO];
            [_p2Potion3 setHidden:YES];
            break;
        }
            
        case 1:
        {
            [_p2Potion1 setHidden:NO];
            [_p2Potion2 setHidden:YES];
            [_p2Potion3 setHidden:YES];
            break;
        }
            
        default:
        {
            [_p2Potion1 setHidden:YES];
            [_p2Potion2 setHidden:YES];
            [_p2Potion3 setHidden:YES];
            break;
        }
    }
}


//Text Box Methods
-(void) textLoader:(NSMutableArray*) array
{
    stringTextHolder = array;
    stringTextHolderCount = [array count];
    stringTextHolderCurrentCount = 0;
    [_gameTextBox setText:stringTextHolder[stringTextHolderCurrentCount]];
}
- (IBAction)continueText
{
    ++stringTextHolderCurrentCount;
    if (stringTextHolderCurrentCount >= stringTextHolderCount)
    {
        [self enableButtons];
        changeTurn();
        [self screenForPlayer];
        [_gameTextBox setText:[NSString stringWithFormat:@"%@ turn", [whosTurn() name]]];
    }
    
    else
    {
        
        [_gameTextBox setText:stringTextHolder[stringTextHolderCurrentCount]];
    }
}
-(void) blinkingOkButton
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

/**************************************************/
//Special Screen Methods

@end
