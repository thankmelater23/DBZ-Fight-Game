//
//  MenuViewController.h
//  Fight 2.0
//
//  Created by Andre on 3/14/13.
//  Copyright (c) 2013 HnG Studios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@interface MenuViewController : UIViewController
{
    SystemSoundID click;
}
- (IBAction)startButton;

- (IBAction)otherButton;
@property (weak, nonatomic) IBOutlet UITextField *player1NameField;
@property (weak, nonatomic) IBOutlet UITextField *player2NameFiled;
- (IBAction)goButton;
@end
