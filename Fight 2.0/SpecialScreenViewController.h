//
//  SpecialScreenViewController.h
//  Fight 2.0
//
//  Created by Andre on 4/6/13.
//  Copyright (c) 2013 Bing Bang Boom Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpecialScreenViewController : UIViewController
//Special Screen Outlets
@property (weak, nonatomic) IBOutlet UISlider   *specPlayerHealthBar;
@property (weak, nonatomic) IBOutlet UILabel    *specPlayerHealthLabel;
@property (weak, nonatomic) IBOutlet UIButton   *specPlayerName;
@property (weak, nonatomic) IBOutlet UIImageView *specPlayerImage;
@property (weak, nonatomic) IBOutlet UIImageView *specPlayerPot1;
@property (weak, nonatomic) IBOutlet UIImageView *specPlayerPot2;
@property (weak, nonatomic) IBOutlet UIImageView *specPlayerPot3;
@property (weak, nonatomic) IBOutlet UIImageView *specialOneCheck1;
@property (weak, nonatomic) IBOutlet UIImageView *specialOneCheck2;
@property (weak, nonatomic) IBOutlet UIImageView *specialOneCheck3;
@property (weak, nonatomic) IBOutlet UIImageView *specialTwoCheck1;
@property (weak, nonatomic) IBOutlet UIImageView *specialTwoCheck2;
@property (weak, nonatomic) IBOutlet UIImageView *specialTwoCheck3;
@property (weak, nonatomic) IBOutlet UIImageView *specialThreeCheck1;
@property (weak, nonatomic) IBOutlet UIImageView *specialThreeCheck2;
@property (weak, nonatomic) IBOutlet UIImageView *specialThreeCheck3;

//Methods
//Screen Setters
- (void) setSpecialScreen;
-(void) setPotionsImages;
-(void) setSpecial1Images;
-(void) setSpecial2Images;
-(void) setSpecial3Images;


//Special Attacks
-(IBAction) doublePunchButton;
-(IBAction) tripleKickButton;
-(IBAction) superPunchButton;
@end
