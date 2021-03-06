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
#import <AVFoundation/AVFoundation.h>


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
    swapLifeUsed = NO;
    skipTurn = NO;
    continueTextBool = NO;
    specialViewToViewControllerPlaceHolder = 0;
    tripleKickBool = NO;
    superPunchMissBool = NO;
    gameOver = NO;
    
    menuMusicSetUpAndPlay();
}


//System turn methods
void   changeTurn()
{
    if (skipTurn == NO)
    {    
    NSLog(@"Turn Changing");
    if (turn == enumPlayer1)
    {
        turn = enumPlayer2;
    }
    
    else
    {
        turn = enumPlayer1;
    } 
    }
    
    else
    {
       skipTurn = NO;
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
}//Return the player who turn it is by using enum if statements to alternate each time the method is called and skip turn isnt enabled to skip turn and change players
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
}//Returns whos turn its not right now
void   turnGenerator()
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
}//Generates a random player to be able to go first


//SFX
void   initAudio()
{
    NSURL *punchUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"strongpunch" ofType: @"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)punchUrl, &sIDPunch);
    
    NSURL *kickUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"strongkick" ofType: @"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)kickUrl, &sIDKick);
    
    NSURL *superUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"fingerlaser" ofType: @"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)superUrl, &sIDSuper);
    
    NSURL *missedUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"meleemiss2" ofType: @"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)missedUrl, &sIDMissed);
    
    NSURL *hurtUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"pain2" ofType: @"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)hurtUrl, &sIDPain);
    
    NSURL *potionURL = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"scream2 1" ofType: @"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)potionURL, &sIDPotion);
    
    NSURL *swapLifeURL = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"sbc_charge" ofType: @"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)swapLifeURL, &sIDSwapLife);
    
    NSURL *dieURL = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"scream1" ofType: @"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)dieURL, &sIDDead);
    
    NSURL *failURL = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"failed" ofType: @"mp3"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)failURL, &sIDFailed);
    
}
void   playSound(SystemSoundID soundID)
{
    AudioServicesPlaySystemSound(soundID);
}//Allocates and initialize all systemSound id's with audio


//Game Engine Methods
int  randomNumber(int min, int max)
{
    int num;
    
    num = min + arc4random() % max;
    
    while (num > max)
    {
        num = min + arc4random() % max;
    }
    
    NSLog(@"random number generated from: \nMIN:%i\nMAX:%i\nNumber:%i", min, max, num);
    return num;
}//returns a random integer between the min & max paramaters
void setToNumber(int var, int setNumber)
{
    if (var >= setNumber)
    {
        var = setNumber;
    }
}//Assigns var to setNumber if car is more then setNumber(Method to keep vars from going past max


//File methods
void saveGame(int place)
{
    
}
void LoadGame(int place)
{
    
}

void menuMusicSetUpAndPlay()
{
    audioPlayer = nil;
    NSURL *gamePlayMusicUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"DBZ-Goku vs Vegeta Theme" ofType: @"m4a"]];
    NSError *error;
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:gamePlayMusicUrl error:&error];
    [audioPlayer setNumberOfLoops:100];
    [audioPlayer numberOfLoops];
    [audioPlayer setVolume:gamePlayMusicVolume];
    [audioPlayer play];
}



//
//
//End of file