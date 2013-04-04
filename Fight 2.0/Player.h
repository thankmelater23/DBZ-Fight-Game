//
//  Player.h
//  Fight 2.0
//
//  Created by Andre on 3/14/13.
//  Copyright (c) 2013 HnG Studios. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Player : NSObject
{
    Player      *other;
    
    @public
    //Attack Levels
    int punchesInARow,      punchesTotal;
    int kickInArow,         kicksTotal;
    int superAtackInARow,   superAttackTotal;
    
    //Special Holders
    int punchSpecial1, punchSpecial2;
    int kickSpecial1, kickSpecial2;
    int superSpecail1, superSpecail2;
    BOOL isFirstPlayer;
}

//Properties
@property(nonatomic, strong)    NSString    *name;
@property(nonatomic, readwrite) int         potions;
@property(nonatomic, readwrite) int         health;

//Methods

//Setting Methods
-(Player*) init:(NSString*) name;
-(void) mergeEnemy: (Player*) opponent;

//GamnePlay Methods
//Attacks
-(NSString*) punchOpp;
-(NSString*) kickOpp;
-(NSString*) superAtackOpp;
-(NSString*) specialAttack1;
-(NSString*) specil1Attack2;
-(NSString*) specil1Attack3;
-(void)      takeDamage:(int) damage;


//Other Player Options
-(NSString*) usePotion;
-(NSString*) showHealth;
-(BOOL)      isDead;
-(NSString*) swapLife;



@end
