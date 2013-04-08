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
#import <AudioToolbox/AudioToolbox.h>

@class Player;


//Initialize
void   initResources();
void   initVariables();


//System turn methods
void   changeTurn    ();
Player *whosTurn     ();
Player *whosNotTurn  ();
void   turnGenerator ();


//SFX
void   initAudio ();
void playSound   (SystemSoundID soundID);


//Game Engine Methods
int  randomNumber (int min, int max);
void setToNumber  (int var, int setNumber);
#endif
