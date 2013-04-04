//
//  Attack.h
//  Fight 2.0
//
//  Created by Andre on 3/16/13.
//  Copyright (c) 2013 HnG Studios. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Player;

@interface Attack : NSObject
{
    
    int attackHlth, defenderHlth;
    int attackPoints;
    int level1, level2, level3;
}

-(id) init;
@end
