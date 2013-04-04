//
//  GlobalMeths.h
//  Fight 2.0
//
//  Created by Andre on 3/16/13.
//  Copyright (c) 2013 HnG Studios. All rights reserved.
//

#ifndef Fight_2_0_GlobalMeths_h
#define Fight_2_0_GlobalMeths_h

#import <Foundation/Foundation.h>
#import "Player.h"
#import <AudioToolbox/AudioToolbox.h>
#import "Globals:Constants.h"

@class Player;//Might casue a problem



//Declared
void   initResources();
void   initAudio();
int    randomNumber(int min, int max);
void   changeTurn();
Player *whosTurn();
Player *whosNotTurn();
//Strings
NSString *instructionString();
NSString *chooseAttackString(Player *p1, Player *p2);
//Conditions
NSString* winOrLoose(Player* player);
//SFX
void punchSound();
void kickSound();
void superSound();
void missedSound();


//Implementations
void   initResources()
{
    turn = enumPlayer1;
    player1 = [[Player alloc]init:player1Name];
    player2 = [[Player alloc]init:player2Name];
    [player1 mergeEnemy:player2];
    [player2 mergeEnemy:player1];
    initAudio();
    
    //Vars init
    swapLifeUses = 0;
    
}

void   initAudio()
{
    NSURL *punchUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"punch" ofType: @"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)punchUrl, &sIDPunch);
    
    NSURL *kickUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"kick" ofType: @"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)kickUrl, &sIDKick);
    
    NSURL *superUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"strike" ofType: @"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)superUrl, &sIDSuper);
    
    NSURL *missedUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"swoosh 3" ofType: @"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)missedUrl, &sIDMissed);
}

int    randomNumber(int min, int max)
{
    int num;
    
    num = (arc4random() % max) + min;
    
    return num;
}

void   turnGenerator()
{
    if ((randomNumber(0, 1)) == 0)
    {
        turn = enumPlayer1;
    }
    
    else
    {
        turn = enumPlayer2;
    }
    
}

void   changeTurn()
{
    NSLog(@"Turn Changing");
    if (turn == enumPlayer1)
    {
        turn = enumPlayer2;
    }
    
    else
        turn = enumPlayer1;
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

//Strings

//Conditions
NSString* winOrLoose(Player* player)
{
    return [NSString stringWithFormat:@"%@ has died", [player name]];
}


//SFX
void punchSound()
{
    AudioServicesPlaySystemSound(sIDPunch);
    NSLog(@"Punch");
}
void kickSound()
{
    AudioServicesPlaySystemSound(sIDKick);
    NSLog(@"Kick");
}
void superSound()
{
    AudioServicesPlaySystemSound(sIDSuper);
    NSLog(@"Super");
}

void missedSound()
{
    AudioServicesPlaySystemSound(sIDMissed);
    NSLog(@"Missed");
}

#endif
