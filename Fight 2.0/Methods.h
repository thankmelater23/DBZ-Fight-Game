//
//  Methods.h
//  Fight 2.0
//
//  Created by Andre on 3/16/13.
//  Copyright (c) 2013 HnG Studios. All rights reserved.
//

#ifndef Fight_2_0_Methods_h
#define Fight_2_0_Methods_h

#import <Foundation/Foundation.h>


@class Player;//Might casue a problem



//Declared
void   initResources();
void   initVariables();
void   initAudio    ();
int    randomNumber (int min, int max);
void   changeTurn   ();
Player *whosTurn    ();
Player *whosNotTurn ();
//Conditions
NSString* winOrLoose(Player* player);
//SFX
void playSound();
void punchSound();
void kickSound();
void superSound();
void missedSound();

void turnGenerator();
#endif
