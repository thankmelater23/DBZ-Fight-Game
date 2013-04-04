//
//  StringFunctions.h
//  Fight 2.0
//
//  Created by Andre on 3/15/13.
//  Copyright (c) 2013 HnG Studios. All rights reserved.
//

#ifndef Fight_2_0_StringFunctions_h
#define Fight_2_0_StringFunctions_h

#import <Foundation/Foundation.h>
#import "Player.h"
#import <AudioToolbox/AudioToolbox.h>
#import "Globals:Constants.h"

//NSString *punched(Player *attacker, Player *defender);

NSString *punched(Player *attacker, Player *defender)
{
    NSString *string;
    
    string = [NSString stringWithFormat: @"%@ punched %@, and did %i damage points \nLife: %i \nLife: %i", [attacker name], [defender name], 3, [attacker health], [defender health]];
    
    return string;
}

#endif
