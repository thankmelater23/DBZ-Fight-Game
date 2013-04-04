//
//  Player.m
//  Fight 2.0
//
//  Created by Andre on 3/14/13.
//  Copyright (c) 2013 HnG Studios. All rights reserved.
//

#import "Player.h"
#import "Globals:Constants.h"
#import "Methods.h"

@implementation Player
-(Player*) init:(NSString*) name
{
    self     = [super init];
    _name    = name;
    _potions = 3;//Initialized with #define
    _health  = healthMax;   //Initialized with #define
     
    //Attack Levels init
    punchesInARow   = 0;
    punchesTotal    = 0;
    kickInArow      = 0;
    kicksTotal      = 0;
    superAtackInARow = 0;
    superAttackTotal = 0;
    
    return self;
}

-(void) mergeEnemy: (Player*) opponent
{
    other = opponent;
}//Merg Player * pointer variable to opponent to make changes of that player with that pointer

-(NSString*) punchOpp
{
    int hitOrMiss = randomNumber(punchMinPerc, punchMaxPerc);//Returns if player will hit or miss
    int hitPoins = punchDamage;
    NSString *damageDoneString;
    
    //Hit miss rand
    if (hitOrMiss != 2)
    {
        //Punch hit
        playSound(sIDPunch);
        punchesInARow++;
        punchesTotal++;
        
        if (punchesInARow == punchSpecail1Attainer1)
        {
            NSLog(@"punches in a row: %i", punchesInARow);
            punchesInARow = 0;
            //Do code to make special happen
            punchSpecial1++;
        }
        
        if (punchesTotal == punchSpecail1Attainer2)
        {
            NSLog(@"punches total: %i", punchesTotal);
            punchesTotal = 0;
            //Do code to make special happen
            punchSpecial2++;
        }
        
        
        //Set up damage and health change
        [other takeDamage:hitPoins];
        
        damageDoneString = [NSString stringWithFormat: @"%@ punch hit, damage of: %i\n%@ life: %i", [self name],hitPoins, [other name], [other health]];
    
        //Add timer for hurt sound
        playSound(sIDPain);
        
        //Retrn string
        return damageDoneString;
    }
    
    else
    {
        //Play punch missed sound
        playSound(sIDMissed);
        
        //Reset some feauturs for hit being missed
        punchesInARow = 0;
       
        //Return string of hit being missed
        damageDoneString = [NSString stringWithFormat:@"%@ punch missed", [self name]];
        
        return damageDoneString;
    }
}

-(NSString*) kickOpp
{
    int hitOrMiss = randomNumber(kickMinPerc, kickMaxPerc);//Returns if player will hit or miss
    int hitPoins = kickDamage;
    NSString *damageDoneString;
    
    //Hit miss rand
    if (hitOrMiss == 1 || hitOrMiss == 3)
    {
        //Kick Hit
        playSound(sIDKick);
        kickInArow++;
        kicksTotal++;
        
        if (kickInArow == kickSpecail1Attainer1)
        {
            NSLog(@"punches in a row: %i", kickInArow);
            kickInArow = 0;
            //Do code to make special happen
            kickSpecial1++;
            
        }
        
        if (kicksTotal == kickSpecail1Attainer2)
        {
            NSLog(@"punches total: %i", kicksTotal);
            kicksTotal = 0;
            //Do code to make special happen
            kickSpecial2++;
        }
        
        
        //Set up damage and health change
        [other takeDamage:hitPoins];
        
        damageDoneString = [NSString stringWithFormat: @"%@ kick hit, damage of: %i\n%@ life: %i", [self name], hitPoins, [other name], [other health]];
        
        //Add timer for hurt sound
        playSound(sIDPain);
        
        //Retrn string
        return damageDoneString;
    }
    
    else
    {
        //Play punch missed sound
        playSound(sIDMissed);
        
        //Reset some feauturs for hit being missed
        kickInArow = 0;
        
        //Return string of hit being missed
        damageDoneString = [NSString stringWithFormat:@"%@ kick missed", [self name]];
        
        return damageDoneString;
    }
}

-(NSString*) superAtackOpp
{
    int hitOrMiss = randomNumber(superMinPerc, superMaxPerc);//Returns if player will hit or miss
    int hitPoins = superDamage;
    NSString *damageDoneString;
    
    //Hit miss rand
    if (hitOrMiss == 1 || hitOrMiss == 3)
    {
        playSound(sIDSuper);
       
        superAtackInARow++;
        superAttackTotal++;
        
        if (superAtackInARow == superSpecail1Attainer1)
        {
            NSLog(@"super in a row: %i", superAtackInARow);
            superAtackInARow = 0;
            //Do code to make special happen
            superSpecail1++;
        }
        
        if (kicksTotal == superSpecail1Attainer2)
        {
            NSLog(@"super total: %i", kicksTotal);
            kicksTotal = 0;
            //Do code to make special happen
            superSpecail2++;
        }
        
        
        //Set up damage and health change
        [other takeDamage:hitPoins];
        
        damageDoneString = [NSString stringWithFormat: @"%@ Super hit, damage of: %i\n%@ life: %i", [self name], hitPoins, [other name], [other health]];
        
        //Add timer for hurt sound
        playSound(sIDPain);
        
        //Retrn string
        return damageDoneString;

    }
    
    else
    {
        //Play punch missed sound
        playSound(sIDMissed);
        
        //Reset some feauturs for hit being missed
        superAtackInARow = 0;
        
        //Return string of hit being missed
        damageDoneString = [NSString stringWithFormat:@"%@ Super missed and stumbled, %@ counters and get another turn", [self name], [other name]];
        changeTurn();
        
        
        skipTurn = YES;
        
        return damageDoneString;
    }
}

-(NSString*) specialAttack1
{
    NSString* string = [[NSString alloc]initWithFormat:@"here"];
    return string;
}

-(NSString*) specil1Attack2
{
    NSString* string = [[NSString alloc]initWithFormat:@"here"];
    return string;
}

-(NSString*) specil1Attack3
{
    NSString* string = [[NSString alloc]initWithFormat:@"here"];
    return string;
}

-(BOOL) isDead
{
    if (_health <= 0)
    {
        NSLog(@"is Dead");
        return YES;
    }
    
    else
        return NO;
}//Returns bool if player life is 0 or below

-(void) takeDamage:(int) damage
{
    _health -= damage;
    if (_health < 0)
    {
        _health = 0;
    }
    NSLog(@"Health was tooken of %i, health is now %i", damage, _health);
}//Takes life away of the int value put into damage

-(NSString*) usePotion
{
    NSString *string;
    
    if (_potions > 0)
    {
    _potions--;
    int num = randomNumber(potionChanceMin, potionChanceMax);
    
    if (num == 1 || num == 3)
    {
        playSound(sIDPotion);
        _health += potionStrength;
        if (_health >= healthMax)
        {
            _health = healthMax;
        }
        
        return string = [NSString stringWithFormat:@"%@ potion worked, %i health addded\nHealth: %i\nPotions: %i", [self name], potionStrength,[self health], [self potions]];
    }
    
    else
    {
        NSLog(@"Potion did not work");
        
        return string = [NSString stringWithFormat:@"%@ potion did not work\nPotions: %i", [self name] ,[self potions]];
        
    }
    }
    
    else
    {
        [self setPotions:0];
        return string = [NSString stringWithFormat:@"No potions left\nPotions: %i", [self potions]];
    }
    
}

-(NSString*) swapLife
{
    int num = randomNumber(swapLifeChanceMin, swapLifeChanceMax);
    NSString *string = [[NSString alloc]init];
    
    if  (num == 2 && swapLifeUses >= 1)
    {
        playSound(sIDSwapLife);
        int tempHealth = self.health;
        self.health = other.health;
        other.health = tempHealth;
        
        NSLog(@"Life switches");
        return string = [NSString stringWithFormat:@"Life Swap succesfucl\nPrevious Health:\n%@ Health: %i\n%@ Health: %i\n\nNew Health:\n%@ Health: %i\n%@ Health: %i", [self name], [self health], [other name], [other health], [self name], [self health], [other name], [other health]];
    }
    
    else if (swapLifeUses < 0)
    {
        NSLog(@"Life swap unavailable");
        return string = [NSString stringWithFormat:@"Life Swap Unavailable"];
    }
    else
    {
        NSLog(@"Life Not switched");
        return string = [NSString stringWithFormat:@"Life Swap unsuccesful"];
    }
    swapLifeUses--;
}

@end
