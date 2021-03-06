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
        _doublePunch = 0;
        _tripleKick =  0;
        _superPunch =  0;
        
        //Others
        potionDuds = 0;
        
    }
    
    return self;
}
-(void) mergeEnemy: (Player*) opponent
{
    other = opponent;
}//Merg Player * pointer variable to opponent to make changes of that player with that pointer


//Attacks
-(NSMutableArray*) punchOpp:(UIImageView*) p1Image player2Image:(UIImageView*) p2Image textBox:(UITextView*) textBox
{
    NSString *damageDoneString;
    NSString *special1String;
    NSString *totalPunchesLandedString;
    NSString *adrenalineString;
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:4];
    
    int hitOrMiss = randomNumber(punchMinPerc, punchMaxPerc);//Returns if player will hit or miss
    int hitPoins = punchDamage;
    
    
    //Hit miss rand
    if (hitOrMiss != 0 && hitOrMiss != 4 && hitOrMiss != 8)
    {
        //Punch hit
        playSound(sIDPunch);
        playSound(sIDPain);
        punchesInARow++;
        punchesTotal++;
        [other takeDamage:hitPoins];
        
        damageDoneString = [NSString stringWithFormat: @"%@ punch hit, damage of: %i\n%@ life: %i", [self name],hitPoins, [other name], [other health]];
        
        if (isFirstPlayer == YES)
        {
            [self setPlayerImageTimer:p1Image imageName:@"player1 right punch.png"];
            [self setPlayerImageTimer:p2Image imageName:@"player2 hit.png"];
        }
        
        else
        {
            [self setPlayerImageTimer:p2Image imageName:@"player2 punch.png"];
            [self setPlayerImageTimer:p1Image imageName:@"player1 hit.png"];
        }
        
        
        if (punchesInARow == punchSpecail1Attainer1)
        {
            special1String = [NSString stringWithFormat: @"Special attack added after landing %i consecutive punches", punchSpecail1Attainer1];
            self.doublePunch++;
            setToNumber(self.doublePunch, specialsAndPotionsMax);
            
            punchesInARow = 0;
            NSLog(@"punches in a row: %i", punchesInARow);
        }
        
        if (punchesTotal == punchSpecail1Attainer2)
        {
            totalPunchesLandedString = [NSString stringWithFormat: @"%@ landed %i total punches", [self name], punchSpecail1Attainer2];
            adrenalineString = [self adrenaline];
            
            NSLog(@"punches total: %i", punchesTotal);
        }
        
    }
    
    else
    {
        //Play punch missed sound
        playSound(sIDMissed);
        if (isFirstPlayer == YES)
        {
            [self setPlayerImageTimer:p1Image imageName:@"player1 right punch.png"];
            [self setPlayerImageTimer:p2Image imageName:@"player2 miss.png"];
            //NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(setPlayerImageTimer:) userInfo:p1Image repeats:NO];
            
            
        }
        
        else
        {
            [self setPlayerImageTimer:p2Image imageName:@"player2 punch.png"];
            [self setPlayerImageTimer:p1Image imageName:@"player1 miss.png"];
        }
        
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
    
    if (totalPunchesLandedString != nil)
    {
        [array addObject:totalPunchesLandedString];
    }
    
    if (adrenalineString != nil)
    {
        [array addObject:adrenalineString];
    }
    
    return array;
}
-(NSMutableArray*) kickOpp:(UIImageView*)  p1Image player2Image:(UIImageView*) p2Image textBox:(UITextView*) textBox
{
    NSString *damageDoneString;
    NSString *special1String;
    NSString *special2String;
    NSString *special2AttackString;
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:4];
    
    int hitOrMiss = randomNumber(kickMinPerc, kickMaxPerc);//Returns if player will hit or miss
    int hitPoints = kickDamage;
    
    //Hit miss rand
    if (hitOrMiss != 0 && hitOrMiss != 2 && hitOrMiss != 4 && hitOrMiss != 6)
    {
        //Kick Hit
        playSound(sIDKick);
        playSound(sIDPain);
        kickInArow++;
        kicksTotal++;
        [other takeDamage:hitPoints];
        
        damageDoneString = [NSString stringWithFormat: @"%@ kick hit, damage of: %i\n%@ life: %i", [self name], hitPoints, [other name], [other health]];
        
        if (isFirstPlayer == YES)
        {
            [self setPlayerImageTimer:p1Image imageName:@"player1 kick.png"];
            [self setPlayerImageTimer:p2Image imageName:@"player2 hit.png"];
            
            
        }
        
        else
        {
            [self setPlayerImageTimer:p2Image imageName:@"player2 kick.png"];
            [self setPlayerImageTimer:p1Image imageName:@"player1 hit.png"];
        }
        
        if (kickInArow == kickSpecail1Attainer1)
        {
            special1String = [NSString stringWithFormat: @"Special attack added after landing %i consecutive punches", punchSpecail1Attainer1];
            self.tripleKick++;
            setToNumber(self.tripleKick, specialsAndPotionsMax);
            
            kickInArow = 0;
            
            NSLog(@"kicks in a row: %i", kickInArow);
        }
        
        if (kicksTotal == kickSpecail1Attainer2)
        {
            special2String = [NSString stringWithFormat: @"Special attack activated after landing %i total kicks", kickSpecail1Attainer2];
            
            special2AttackString = nil;//Enter in right method special
            
            kicksTotal = 0;
            
            NSLog(@"kicks total: %i", kicksTotal);
        }
    }
    
    else
    {
        //Play punch missed sound
        playSound(sIDMissed);
        if (isFirstPlayer == YES)
        {
            [self setPlayerImageTimer:p1Image imageName:@"player1 kick.png"];
            [self setPlayerImageTimer:p2Image imageName:@"player2 miss.png"];
            //NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(setPlayerImageTimer:) userInfo:p1Image repeats:NO];
            
            
        }
        
        else
        {
            [self setPlayerImageTimer:p2Image imageName:@"player2 kick.png"];
            [self setPlayerImageTimer:p1Image imageName:@"player1 miss.png"];
        }
        
        //Reset some feauturs for hit being missed
        kickInArow = 0;
        damageDoneString = [NSString stringWithFormat:@"%@ kick missed", [self name]];
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
-(NSMutableArray*) superOpp:(UIImageView*) p1Image player2Image:(UIImageView*) p2Image textBox:(UITextView*) textBox
{
    NSString *damageDoneString;
    NSString *special1String;
    NSString *special2String;
    NSString *deathBlowString;
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:4];
    
    int hitOrMiss = randomNumber(superMinPerc, superMaxPerc);//Returns if player will hit or miss
    int hitPoins = superDamage;
    
    //Hit miss rand
    if (hitOrMiss == 0 || hitOrMiss == 4)
    {
        playSound(sIDSuper);
        playSound(sIDPain);
        superAtackInARow++;
        superAttackTotal++;
        [other takeDamage:hitPoins];
        
        damageDoneString = [NSString stringWithFormat: @"%@ Super hit, damage of: %i\n%@ life: %i", [self name], hitPoins, [other name], [other health]];
        
        if (isFirstPlayer == YES)
        {
            [self setPlayerImageTimer:p1Image imageName:@"player1 super"];
            [self setPlayerImageTimer:p2Image imageName:@"player2 hit.png"];
            
            
        }
        
        else
        {
            [self setPlayerImageTimer:p2Image imageName:@"player2 super"];
            [self setPlayerImageTimer:p1Image imageName:@"player1 hit.png"];
        }
        
        if (superAtackInARow == superSpecail1Attainer1)
        {
            special1String = [NSString stringWithFormat: @"Special attack added after landing %i consecutive Super Hits", superSpecail1Attainer1];
            self.superPunch++;
            setToNumber(self.superPunch, specialsAndPotionsMax);
            
            superAtackInARow = 0;
            
            NSLog(@"super in a row: %i", superAtackInARow);
        }
        
        if (superAttackTotal == superSpecail1Attainer2)
        {
            special2String = [NSString stringWithFormat: @"%@ landed %i total kicks", [self name], superSpecail1Attainer2];
            
            deathBlowString = [self deathBlow];
            
            NSLog(@"super total: %i", superAttackTotal);
            }
    }
    
    else
    {
        //Play punch missed sound
        playSound(sIDMissed);
        if (isFirstPlayer == YES)
        {
            [self setPlayerImageTimer:p1Image imageName:@"player1 super.png"];
            [self setPlayerImageTimer:p2Image imageName:@"player2 miss.png"];
        }
        
        else
        {
            [self setPlayerImageTimer:p2Image imageName:@"player2 super.png"];
            [self setPlayerImageTimer:p1Image imageName:@"player1 miss.png"];
        }
        
        //Reset some feauturs for hit being missed
        superAtackInARow = 0;
        
        //Return string of hit being missed
        damageDoneString = [NSString stringWithFormat:@"%@ Super missed and stumbled, %@ counters and get another turn", [self name], [other name]];
        superPunchMissBool = YES;
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
    
    if (deathBlowString != nil)
    {
        [array addObject:deathBlowString];
    }
    
    return array;
}
//Specials
-(NSMutableArray*) doublePunchSpecial:(UIImageView*)  p1Image player2Image:(UIImageView*) p2Image textBox:(UITextView*) textBox;
{
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:1];
    [whosTurn() setDoublePunch:([whosTurn() doublePunch] - 1)];
    [array addObject:@"Not Implemented yet"];
    
    return array;
}//Set up on vars for this method(Unfinished)
-(NSMutableArray*) tripleKickSpecial: (UIImageView*)  p1Image player2Image:(UIImageView*) p2Image textBox:(UITextView*) textBox
{
    NSString       *damageDoneString;
    NSString       *damageDoneString2;
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:4];
    [whosTurn() setTripleKick:([whosTurn() tripleKick] - 1)];
    
    int hitOrMiss       = randomNumber(kickMinPerc, kickMaxPerc);//Returns if player will hit or miss
    int numberOfAttacks = randomNumber(3, (5+1));
    int hitPoints       = 0;
    tripleKickBool       = YES;
    
    //Hit miss rand
    if (hitOrMiss != 0 && hitOrMiss != 2 && hitOrMiss != 4 && hitOrMiss != 6)
    {
        int sum = 0;
        
        for (int i = 1; i < numberOfAttacks; i++)
        {
            hitPoints = randomNumber(tripleKickMinDamage, tripleKickMaxDamage);
            sum += hitPoints;
            if (i == 1)
            {
                [array addObject:damageDoneString = [NSString stringWithFormat: @"TRIPLE KICK ACTIVATED!\nKick %i did: %i damage", i, hitPoints]];
            }
            else
            {
            [array addObject:[NSString stringWithFormat:@"Kick %i did: %i damage", i, hitPoints]];
            }
        }
        [other takeDamage:sum];

        [array addObject:damageDoneString2 = [NSString stringWithFormat: @"%@ took total damage of:%i\n%@ Health:%i\nLanded %i kicks", [other name], sum, [other name], [other health], (numberOfAttacks - 1)]]
        ;
        
        if (isFirstPlayer == YES)
        {
            [self setPlayerImageTimer:p1Image imageName:@"player1 kick.png"];
            [self setPlayerImageTimer:p2Image imageName:@"player2 hit.png"];
            
            
            
        }
        
        else
        {
            [self setPlayerImageTimer:p2Image imageName:@"player2 kick.png"];
            [self setPlayerImageTimer:p1Image imageName:@"player1 hit.png"];
        }
        playSound(sIDKick);
        playSound(sIDPain);
        
    }
    
    else
    {
        [array addObject:damageDoneString = [NSString stringWithFormat: @"TRIPLE KICK NOT ACTIVATED"]];
        //Play punch missed sound
        playSound(sIDFailed);
        if (isFirstPlayer == YES)
        {
            [self setPlayerImageTimer:p1Image imageName:@"player1 kick.png"];
            [self setPlayerImageTimer:p2Image imageName:@"player2 miss.png"];
            
            
        }
        
        else
        {
            [self setPlayerImageTimer:p2Image imageName:@"player2 kick.png"];
            [self setPlayerImageTimer:p1Image imageName:@"player1 miss.png"];
        }
    }
    return array;
}//Set up on vars for this method(Unfinished)
-(NSMutableArray*) superPunchSpecial: (UIImageView*)  p1Image player2Image:(UIImageView*) p2Image textBox:(UITextView*) textBox;
{
    NSString *damageDoneString;
    NSString *damageDoneString2;
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:2];
    
    int hitOrMiss = randomNumber(superPunchMin, superPunchMax);//Returns if player will hit or miss
    int hitPoins = superPunchDamage;
    [whosTurn() setSuperPunch:([whosTurn() superPunch] - 1)];
    
    
    //Hit miss rand
    if (hitOrMiss != 1)
    {
        //Punch hit
        playSound(sIDPunch);//Add right sound for super punch
        playSound(sIDPain);
        [other takeDamage:hitPoins];
        skipTurn = YES;
        
        damageDoneString = [NSString stringWithFormat: @"SUPER PUNCH Activated!\n%@ did damage of: %i\n%@ life: %i", [self name],hitPoins, [other name], [other health]];
        damageDoneString2 = [NSString stringWithFormat: @"%@ is stunned, %@ get another turn\nSuper Punches:%i", [other name], [self name], [self superPunch]];
        
        if (isFirstPlayer == YES)
        {
            [self setPlayerImageTimer:p1Image imageName:@"player1 right punch.png"];
            [self setPlayerImageTimer:p2Image imageName:@"player2 hit.png"];
        }
        
        else
        {
            [self setPlayerImageTimer:p2Image imageName:@"player2 punch.png"];
            [self setPlayerImageTimer:p1Image imageName:@"player1 hit.png"];
        }
    }
    
    else
    {
        damageDoneString = [NSString stringWithFormat: @"SUPER PUNCH Failed!"];
        damageDoneString2 = [NSString stringWithFormat: @"Super Punches:%i", [self superPunch]];
        playSound(sIDFailed);
        
    }
    
    if (damageDoneString != nil)
    {
        [array addObject:damageDoneString];
    }
    
    if (damageDoneString2 != nil)
    {
        [array addObject:damageDoneString2];
    }
    
    return array;
}//Set up on vars for this method(Unfinished)Also set up images and sounds need to be added and initialized
//Auto Specials
-(NSString*)       desperation
{
    NSString *string;
    string = [NSString stringWithFormat:@"DESPERATION ACTIVATED!\nNone of the potions worked, %@ became desperate!\n%@ recieved %i health points", [self name], [self name], desperationHealthPoints];
    [self addHealth:desperationHealthPoints];
    
    return string;
    
}//When no potions has worked this special is activated does variable settings and returns a string
-(NSString*)       adrenaline
{
    [self addHealth:adrenalineHealthPoints];
    NSString *string = [NSString stringWithFormat: @"ADRENALINE ACTIVATED!\n%@ recieved %i health points", [self name], adrenalineHealthPoints];
    
    punchesTotal = 0;
    
    return string;
}
-(NSString*)       deathBlow
{
    [other resetStats];
    NSString *string = [NSString stringWithFormat:@"DEATH BLOW ACTIVATED!\nAll %@: attacks in a row and total attack to specials has been reseted to zero", [other name]];
    superAttackTotal = 0;
    
    NSLog(@"Death Blow Activated");
    return string;
}
-(NSMutableArray*) kickAndGrab
{
    NSMutableArray *array;
    return array;
}
-(NSMutableArray*) usePotion:(UIImageView*) p1Image player2Image:(UIImageView*) p2Image textBox:(UITextView*) textBox
{
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:2];
    NSString *string;
    NSString *desperationString;
    
    if (self.potions > 0)
    {
        self.potions--;
        int num = randomNumber(potionChanceMin, potionChanceMax);
        
        if (num == 0 || num == 2 || num == 4)
        {
            playSound(sIDPotion);
            [self addHealth:potionStrength];

            string = [NSString stringWithFormat:@"%@ potion worked, %i health addded\nHealth: %i\nPotions: %i", [self name], potionStrength,[self health], [self potions]];
            
            if (isFirstPlayer == YES)
            {
                [self setPlayerImageTimer:p1Image imageName:@"player1 powerup.png"];
                
            }
            
            else
            {
                [self setPlayerImageTimer:p2Image imageName:@"player2 powerup.png"];
            }
            
        }
        
        else
        {
            playSound(sIDFailed);
            NSLog(@"Potion did not work");
            potionDuds++;
            string = [NSString stringWithFormat:@"%@ potion did not work\nPotions: %i", [self name] ,[self potions]];
            
            if (potionDuds == 3)
            {
                desperationString = [self desperation];
            }
        }
    }
    
    else
    {
        [self setPotions:0];
        string = [NSString stringWithFormat:@"No potions left\nPotions: %i", [self potions]];
        skipTurn = YES;
        turnsCompleted--;
    }
    
    if (string != nil)
    {
        [array addObject:string];
    }
    
    if (desperationString != nil)
    {
        [array addObject:desperationString];
    }
    
    return array;
}//Gives player health if potion is successful
-(NSMutableArray*) swapLife: (UIImageView*) p1Image player2Image:(UIImageView*) p2Image textBox:(UITextView*) textBox
{
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:2];
    NSString *string;
    NSString *string2;
    NSString *string3;
    int num = randomNumber(swapLifeChanceMin, swapLifeChanceMax);
    
    if  ((num == 2 && swapLifeUsed == NO) || (num == 0 && swapLifeUsed == NO))
    {
        playSound(sIDSwapLife);
        int tempHealth = self.health;
        self.health = other.health;
        other.health = tempHealth;
        
        NSLog(@"Life switches");
        swapLifeUsed = YES;
        string = [NSString stringWithFormat:@"Life Swap succesfucl"];
        string2 = [NSString stringWithFormat:@"Previous Health:\n%@ Health: %i\n%@ Health: %i", [self name], [self health], [other name], [other health]];
        string3 = [NSString stringWithFormat:@"New Health:\n%@ Health: %i\n%@ Health: %i", [self name], [self health], [other name], [other health]];
    }
    
    else if (swapLifeUsed == YES)
    {
        NSLog(@"Life swap unavailable");
        string = [NSString stringWithFormat:@"Life Swap Unavailable"];
        skipTurn = YES;
        turnsCompleted--;
    }
    else
    {
        NSLog(@"Life Not switched");
        swapLifeUsed = YES;
        string = [NSString stringWithFormat:@"Life Swap unsuccesful"];
        playSound(sIDFailed);
    }
    
    if (string != nil)
    {
        [array addObject:string];
    }
    
    if (string2 != nil)
    {
        [array addObject:string2];
    }
    
    if (string3 != nil)
    {
        [array addObject:string3];
    }
    return array;
}//Swaps players life if successful


//Game methods
-(BOOL) isDead
{
    if (self.health <= 0)
    {
        NSLog(@"%@ is Dead", [self name]);
        return YES;
    }
    
    else
        return NO;
}//Returns bool if player life is 0 or below
-(void) takeDamage:         (int) damage
{
    self.health -= damage;
    if (self.health < 0)
    {
        self.health = 0;
    }
    NSLog(@"Health was tooken of %i, health is now %i", damage, self.health);
}//Takes life away of the int value put into damage
-(void) addHealth:          (int)addedHealth
{
    self.health += addedHealth;
    if (self.health >= healthMax)
    {
        self.health = healthMax;
    }
}//Adds health to player and doesnt let it exceed the maximum health points
-(void) setPlayerImageTimer:(UIImageView*) playerImg imageName:(NSString*) string
{
    [playerImg setImage:[UIImage imageNamed:string]];
    
}

//other
-(void)resetStats
{
    punchesInARow     = 0;
    punchesTotal      = 0;
    kickInArow        = 0;
    kicksTotal        = 0;
    superAtackInARow = 0;
    superAttackTotal = 0;
}



@end
