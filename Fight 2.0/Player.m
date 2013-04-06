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
    if(self     = [super init])
    {
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
        
        //Special Holders
        doublePunch = 0;
        tripleKick =  0;
        SuperPunch =  0;
    }
    
    return self;
}

-(void) mergeEnemy: (Player*) opponent
{
    other = opponent;
}//Merg Player * pointer variable to opponent to make changes of that player with that pointer

-(NSMutableArray*) punchOpp:(UIImageView*) p1Image player2Image:(UIImageView*) p2Image textBox:(UITextView*) textBox
{
    NSString *damageDoneString;
    NSString *special1String;
    NSString *special2String;
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:3];
    
    int hitOrMiss = randomNumber(punchMinPerc, punchMaxPerc);//Returns if player will hit or miss
    int hitPoins = punchDamage;
    
    
    //Hit miss rand
    if (hitOrMiss != 2)
    {
        //Punch hit
        playSound(sIDPunch);
        //Add timer for hurt sound
        playSound(sIDPain);
        punchesInARow++;
        punchesTotal++;
        [other takeDamage:hitPoins];
        
        damageDoneString = [NSString stringWithFormat: @"%@ punch hit, damage of: %i\n%@ life: %i", [self name],hitPoins, [other name], [other health]];
        
        if (self == player1)
        {
            [p1Image setImage:[UIImage imageNamed:@"player1 right punch.png"]];
            //[NSTimer timerWithTimeInterval:1.0 target:nil  selector:@selector([_player1Image setImage:[UIImage imageNamed:@"player1 powerup"]]) userInfo:nil repeats:NO];
        }
        
        else
        {
            [p2Image setImage:[UIImage imageNamed:@"player2 punch.png"]];
        }
        
        
        if (punchesInARow == punchSpecail1Attainer1)
        {
            special1String = [NSString stringWithFormat: @"Special attack added after landing %i consecutive punches", punchSpecail1Attainer1];
            doublePunch++;
            punchesInARow = 0;
            NSLog(@"punches in a row: %i", punchesInARow);
            
            //Do code to make special happen
        }
        
        if (punchesTotal == punchSpecail1Attainer2)
        {
            special2String = [NSString stringWithFormat: @"Special attack added after landing %i total punches", punchSpecail1Attainer2];
            punchesTotal = 0;
            
            NSLog(@"punches total: %i", punchesTotal);
            //Do code to make special happen
        }
        
    }
    
    else
    {
        //Play punch missed sound
        playSound(sIDMissed);
        
        //Reset some feauturs for hit being missed
        punchesInARow = 0;
        damageDoneString = [NSString stringWithFormat:@"%@ punch missed", [self name]];
    }
    
    if (damageDoneString != nil)
    {
        [array addObject:damageDoneString];
    }
    
    if (special1String != nil)
    {
        [array addObject:special1String];
    }
    
    if (special2String != nil)
    {
        [array addObject:special2String];
    }
    
    return array;
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
            tripleKick++;
            
        }
        
        if (kicksTotal == kickSpecail1Attainer2)
        {
            NSLog(@"punches total: %i", kicksTotal);
            kicksTotal = 0;
            //Do code to make special happen
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
            SuperPunch++;
        }
        
        if (kicksTotal == superSpecail1Attainer2)
        {
            NSLog(@"super total: %i", kicksTotal);
            kicksTotal = 0;
            //Do code to make special happen
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
    NSString *string;
    
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

-(NSMutableArray*)test
{
    NSString *one, *two;
    
    one = @"Hey there";
    two = @"Who is that?";
    
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:2];
    [array addObject:one];
    [array addObject:two];
    return array;
    
    
}

@end
