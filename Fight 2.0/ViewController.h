//
//  ViewController.h
//  Fight 2.0
//
//  Created by Andre on 3/14/13.
//  Copyright (c) 2013 HnG Studios. All rights reserved.
// Users/helloagain/Documents/Projects 2012/Projecs/Fight 2.0/Fight 2.0

#import "ViewController.h"


@interface ViewController : UIViewController
{
    NSMutableArray *stringTextHolder;
    int stringTextHolderCount;
    int stringTextHolderCurrentCount;
    BOOL blinkingBoxBool;
    NSTimer *blinkingBoxTimer;
    NSTimer *healthBarUpdater;
}
//GameScreen
//Button Properties
@property (retain, nonatomic) IBOutlet UIButton *playerNameButton;
@property (weak, nonatomic) IBOutlet UIButton   *punchButton;
@property (weak, nonatomic) IBOutlet UIButton   *kickButton;
@property (weak, nonatomic) IBOutlet UIButton   *superButton;
@property (weak, nonatomic) IBOutlet UIButton   *potionButton;
@property (weak, nonatomic) IBOutlet UIButton   *specialButton;
@property (weak, nonatomic) IBOutlet UIButton   *goButton;
@property (weak, nonatomic) IBOutlet UIButton  *swapLifeButton;

//Text Field Property
@property (weak, nonatomic) IBOutlet UITextView *gameTextBox;
@property (weak, nonatomic) IBOutlet UIButton *okTextButton;

//HealthBars Property
@property (weak, nonatomic) IBOutlet UISlider *player1HealthBar;
@property (weak, nonatomic) IBOutlet UISlider *player2HealthBar;
@property (weak, nonatomic) IBOutlet UILabel  *player1HealthButton;
@property (weak, nonatomic) IBOutlet UILabel  *player2HealthButton;
//Potions
@property (weak, nonatomic) IBOutlet UIImageView *p1Potion1;
@property (weak, nonatomic) IBOutlet UIImageView *p1Potion2;
@property (weak, nonatomic) IBOutlet UIImageView *p1Potion3;
@property (weak, nonatomic) IBOutlet UIImageView *p2Potion1;
@property (weak, nonatomic) IBOutlet UIImageView *p2Potion2;
@property (weak, nonatomic) IBOutlet UIImageView *p2Potion3;

//UIImages
@property (weak, nonatomic) IBOutlet UIImageView *player1Image;
@property (weak, nonatomic) IBOutlet UIImageView *player2Image;
@property (weak, nonatomic) IBOutlet UIImageView *player1BackGroundColor;
@property (weak, nonatomic) IBOutlet UIImageView *player2BackGroundColor;




//Gameplay
//User Interaction
-(IBAction) punch;
-(IBAction) kick;
-(IBAction) Super;
-(IBAction) potion;
-(IBAction) swapLife;
- (IBAction)continueText;

//Visual methods
-(void) setUniqueLookForCurrentPlayerTurn;
-(void) setScreen;
-(void) setHealthBar;

//Engine methods
-(void) textBoxEnabled;
-(void) enableButtons;
@end
