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

//Defines

//Player attributes
#define healthMax 100
#define initialPotions 3

//Attacks
#define punchDamage 3
#define kickDamage  6
#define superDamage 10
//Minimun to max for attacks
#define punchMinPerc  1
#define punchMaxPerc  3
#define kickMinPerc   1
#define kickMaxPerc   4
#define superMinPerc  1
#define superMaxPerc  4

//Create Directives of how many in a row and total attacks to certin feture

//Health Directives
#define potionChanceMin 1
#define potionChanceMax 5
#define swapLifeChanceMin 1 
#define swapLifeChanceMax 4
//Others
#define potionStrength 15
#define swapLifeAmount 1


//Global Variables
//Players
Player *player1, *player2;
NSString *player1Name, *player2Name;

//Enum
playerTurn turn;

//Global Game Vars
int swapLifeUses;
int go;
BOOL skipTurn;

//game stats
int turnsCompleted;

//Sound ID's
SystemSoundID sIDPunch;
SystemSoundID sIDKick;
SystemSoundID sIDSuper;
SystemSoundID sIDMissed;
SystemSoundID sIDPain;
SystemSoundID sIDPotion;
SystemSoundID sIDSwapLife;


//Define specails
#define punchSpecail1Attainer1   3
#define punchSpecail1Attainer2   7
#define kickSpecail1Attainer1    3
#define kickSpecail1Attainer2    6
#define superSpecail1Attainer1   2
#define superSpecail1Attainer2   4


#endif
