//
//  Methods.m
//  Fight 2.0
//
//  Created by Andre on 3/16/13.
//  Copyright (c) 2013 HnG Studios. All rights reserved.
//

#include "Methods.h"
#import "Player.h"
#import <AudioToolbox/AudioToolbox.h>
#import "Globals:Constants.h"


//Implementations
//Initialize
void   initResources()
{
    initVariables();
    initAudio();
    turnGenerator();
}

void initVariables()
{
    //Set Player Vars
    player1 = [[Player alloc]init:player1Name];
    player2 = [[Player alloc]init:player2Name];
    player1->isFirstPlayer = YES;
    player2->isFirstPlayer = NO;
    [player1 mergeEnemy:player2];
    [player2 mergeEnemy:player1];
    
    //Other Vars
    swapLifeUses = swapLifeAmount;
    skipTurn = NO;
    continueTextBool = NO;
    
}

//System turn methods
void   changeTurn()
{
    if (skipTurn == YES)
    {
        skipTurn = NO;
        changeTurn();
    }
    
    NSLog(@"Turn Changing");
    if (turn == enumPlayer1)
    {
        turn = enumPlayer2;
    }
    
    else
    {
        turn = enumPlayer1;
    }
    
    turnsCompleted++;
}

Player *whosTurn()
{
    if (turn == enumPlayer1)
    {
        NSLog(@"Player1 Turn");
        return player1;
    }
    
    else
    {
        NSLog(@"Player2 Turn");
        return player2;
    }
}

Player *whosNotTurn()
{
    if (turn != enumPlayer1)
    {
        NSLog(@"Not Player1 Turn");
        return player1;
    }
    
    else
    {
        NSLog(@"Not Player2 Turn");
        return player2;
    }
}

//SFX
void   initAudio()
{
    NSURL *punchUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"punch" ofType: @"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)punchUrl, &sIDPunch);
    
    NSURL *kickUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"kick" ofType: @"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)kickUrl, &sIDKick);
    
    NSURL *superUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"razor slate" ofType: @"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)superUrl, &sIDSuper);
    
    NSURL *missedUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"swoosh 3" ofType: @"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)missedUrl, &sIDMissed);
    
    NSURL *hurtUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"pain" ofType: @"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)hurtUrl, &sIDPain);
    
    NSURL *potionURL = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"powerhum" ofType: @"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)potionURL, &sIDPotion);
    
    NSURL *swapLifeURL = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"Magic Tree" ofType: @"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)swapLifeURL, &sIDSwapLife);
    
}

void playSound(SystemSoundID soundID)
{
    AudioServicesPlaySystemSound(soundID);
}

//Game Engine Methods
int    randomNumber(int min, int max)
{
    int num;
    
    num = min + arc4random() % max;
    
    while (num > max)
    {
        num = min + arc4random() % max;
    }
    
    return num;
}

void turnGenerator()//Remake turn generator from view controller
{
    int num = randomNumber(1, 2);
    if ( num == 1)
    {
        turn = enumPlayer1;
    }
    
    else
    {
        turn = enumPlayer2;
    }
}