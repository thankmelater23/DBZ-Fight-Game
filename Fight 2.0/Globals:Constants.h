//
//  Globals:Constants.h
//  Fight 2.0
//
//  Created by Andre on 3/14/13.
//  Copyright (c) 2013 HnG Studios. All rights reserved.
//
#ifndef Fight_2_0_Globals_Constants_h
#define Fight_2_0_Globals_Constants_h


#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

@class Player;


typedef enum
{
    enumPlayer1, enumPlayer2
}playerTurn;

//Global Variables
//Players
Player   *player1,     *player2;
NSString *player1Name, *player2Name;
//Enum
playerTurn turn;

//Sound ID's
SystemSoundID sIDPunch;
SystemSoundID sIDKick;
SystemSoundID sIDSuper;
SystemSoundID sIDMissed;
SystemSoundID sIDPain;
SystemSoundID sIDPotion;
SystemSoundID sIDSwapLife;

//Game BOOL's
BOOL continueTextBool;
BOOL newGame;
BOOL swapLifeUsed;
BOOL skipTurn;

//Global Game Vars
int turnsCompleted;

//Vars for SpecialScreenViewController
int specialViewToViewControllerPlaceHolder;

//Defines

//Player attributes
#define healthMax             100
#define initialPotions        3
#define specialsAndPotionsMax 3

//Attacks
#define punchDamage         3
#define kickDamage          6
#define superDamage         10
#define doublePunchDamage   5
#define tripleKickMinDamage 1
#define tripleKickMaxDamage 5
#define superPunchDamage    10
//Minimun to max for attacks
#define punchMinPerc   0
#define punchMaxPerc   9
#define kickMinPerc    0
#define kickMaxPerc    9
#define superMinPerc   0
#define superMaxPerc   5
#define doublePunchMin 0
#define doublePunchMax 3//Make doublePunch chance 2/3 success
#define superPunchMin  0
#define superPunchMax  5//Make superPunch chance 3/5 success

//Health defines
#define potionChanceMin   0
#define potionChanceMax   5
#define swapLifeChanceMin 0 
#define swapLifeChanceMax 4
#define potionStrength    15

//Player setting defines
//Define specails
#define punchSpecail1Attainer1   4
#define punchSpecail1Attainer2   10
#define kickSpecail1Attainer1    3
#define kickSpecail1Attainer2    7
#define superSpecail1Attainer1   2
#define superSpecail1Attainer2   4

//Special attacks defines
#define bloodFlowHealthPoints   20
#define desperationHealthPoints 20

//Game setting define
#define specialScreenImagesFadeOut 0.3
#define specialScreenImagesFadeIn  1.0


#endif
