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
    
    [_gameTextBox setText:[self punchMethGuts]];
    //[_gameTextBox setText:[whosTurn() punchOpp]];
    changeTurn();
    [self screenForPlayer];
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
-(NSString*) punchMethGuts
{
    int hitOrMiss = randomNumber(punchMinPerc, punchMaxPerc);//Returns if player will hit or miss
    int hitPoins = punchDamage;
    NSString *damageDoneString;
    Player *currPlayer = whosTurn();
    Player *other = whosNotTurn();
    
    //Hit miss rand
    if (hitOrMiss != 2)
    {
        if (currPlayer == player1)
        {
            [_player1Image setImage:[UIImage imageNamed:@"player1 right punch.png"]];
            //[NSTimer timerWithTimeInterval:1.0 target:nil  selector:@selector([_player1Image setImage:[UIImage imageNamed:@"player1 powerup"]]) userInfo:nil repeats:NO];
        }
        
        else
        {
            [_player2Image setImage:[UIImage imageNamed:@"player2 punch.png"]];
        }
        //Punch hit
        playSound(sIDPunch);
        currPlayer->punchesInARow++;
        currPlayer->punchesTotal++;
        
        if (currPlayer->punchesInARow == punchSpecail1Attainer1)
        {
            NSLog(@"punches in a row: %i", currPlayer->punchesInARow);
            currPlayer->punchesInARow = 0;
            //Do code to make special happen
            currPlayer->punchSpecial1++;
        }
        
        if (currPlayer->punchesTotal == punchSpecail1Attainer2)
        {
            NSLog(@"punches total: %i", currPlayer->punchesTotal);
            currPlayer->punchesTotal = 0;
            //Do code to make special happen
            currPlayer->punchSpecial2++;
        }
        
        
        //Set up damage and health change
        [other takeDamage:hitPoins];
        
        damageDoneString = [NSString stringWithFormat: @"%@ punch hit, damage of: %i\n%@ life: %i", [currPlayer name],hitPoins, [other name], [other health]];
        
        //Add timer for hurt sound
        playSound(sIDPain);
        
        //Retrn string
        return damageDoneString;
    }
    
    else
    {
        //Play punch missed sound
        playSound(sIDMissed);
        
        //Reset some feauturs for hit being missed
        currPlayer->punchesInARow = 0;
        
        //Return string of hit being missed
        damageDoneString = [NSString stringWithFormat:@"%@ punch missed", [currPlayer name]];
        
        return damageDoneString;
    }
}

- (IBAction)Go
{
    go++;
}



//Visual methods
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
        [self disableButtons];
    }
    
    if ([player2 isDead])
    {
        [self disableButtons];
    }
}//Sets up health bars and button to represent players health



//Engine methods
-(void) disableButtons
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
    
}//Enables buttons interaction to allow gameplay selection/Non text


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
@end
