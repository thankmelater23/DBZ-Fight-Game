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
    //Opposing player object
    Player      *other;
    
    @public
    //Attack Levels
    int punchesInARow,      punchesTotal;
    int kickInArow,         kicksTotal;
    int superAtackInARow,   superAttackTotal;
    
    //Other
    int potionDuds;//Keeps count of how many potions didn't work
    
    //Special Holders
    BOOL isFirstPlayer;
}

//Properties
@property(nonatomic, strong)    NSString    *name;
@property(nonatomic, readwrite) int         potions;
@property(nonatomic, readwrite) int         health;
@property(nonatomic, readwrite) int         doublePunch;
@property(nonatomic, readwrite) int         tripleKick;
@property(nonatomic, readwrite) int         superPunch;

//Methods

//Setting Methods
-(Player*) init:(NSString*) name;
-(void) mergeEnemy: (Player*) opponent;

//GamnePlay Methods
//Attacks
-(NSMutableArray*) punchOpp:(UIImageView*) p1Image player2Image:(UIImageView*) p2Image textBox:(UITextView*) textBox;
-(NSMutableArray*) kickOpp:(UIImageView*) p1Image player2Image:(UIImageView*) p2Image textBox:(UITextView*) textBox;
-(NSMutableArray*) superOpp:(UIImageView*) p1Image player2Image:(UIImageView*) p2Image textBox:(UITextView*) textBox;
-(NSMutableArray*) doublePunchSpecial:(UIImageView*) p1Image player2Image:(UIImageView*) p2Image textBox:(UITextView*) textBox;
-(NSMutableArray*) tripleKickSpecial:(UIImageView*) p1Image player2Image:(UIImageView*) p2Image textBox:(UITextView*) textBox;
-(NSMutableArray*) superPunchSpecial:(UIImageView*) p1Image player2Image:(UIImageView*) p2Image textBox:(UITextView*) textBox;
-(NSMutableArray*) usePotion:(UIImageView*) p1Image player2Image:(UIImageView*) p2Image textBox:(UITextView*) textBox;
-(NSMutableArray*) swapLife:(UIImageView*) p1Image player2Image:(UIImageView*) p2Image textBox:(UITextView*) textBox;


//Game methods
-(BOOL) isDead;
-(void) takeDamage:         (int) damage;
-(void) addHealth:          (int)addedHealth;
-(void) setPlayerImageTimer:(UIImageView*) playerImg            imageName:(NSString*) string;


@end
