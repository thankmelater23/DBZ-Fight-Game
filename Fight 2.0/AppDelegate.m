//
//  AppDelegate.m
//  Fight 2.0
//
//  Created by Andre on 3/14/13.
//  Copyright (c) 2013 HnG Studios. All rights reserved.
//

#import "AppDelegate.h"
#import "Globals:Constants.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self playMenuMusic];
    [self printAppInfo];
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


-(void)playMenuMusic
{
    NSURL *menuMusicUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"Dragon Ball Z Theme Song" ofType: @"wav"]];
    NSError *error;
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:menuMusicUrl error:&error];
    [audioPlayer setNumberOfLoops:10];
    [audioPlayer numberOfLoops];
    [audioPlayer play];
}
- (void)printAppInfo{
    NSString * CFBundleShortVersionString = [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleShortVersionString"];
    NSString * CFBundleDevelopmentRegion = [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleDevelopmentRegion"];
    NSString * CFBundleDisplayName = [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleDisplayName"];
    NSString * CFBundleDocumentTypes = [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleDocumentTypes"];
    NSString * CFBundleDeCFBundleExecutablevelopmentRegion = [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleDeCFBundleExecutablevelopmentRegion"];
    NSString * CFBundleIconFile = [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleIconFile"];
    NSString * CFBundleIcons = [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleIcons"];
    NSString * CFBundleIdentifier = [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleIdentifier"];
    NSString * CFBundleLocalizations = [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleLocalizations"];
    NSString * CFBundleName = [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleName"];
    NSString * CFBundlePackageType = [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundlePackageType"];
    NSString * CFBundleSignature = [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleSignature"];
    NSString * CFBundleSpokenName = [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleSpokenName"];
    NSString * CFBundleURLTypes = [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleURLTypes"];
    NSString * CFBundleVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleVersion"];
    NSString * CFBundleTypeName = [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleTypeName"];
    NSString * LSHandlerRank = [[NSBundle mainBundle] objectForInfoDictionaryKey: @"LSHandlerRank"];
    
    
    //    printf(CFBundleShortVersionString);
    //    printf(CFBundleDevelopmentRegion);
    //    printf(CFBundleDisplayName);
    //    printf(CFBundleDocumentTypes);
    //    printf(CFBundleDeCFBundleExecutablevelopmentRegion);
    //    printf(CFBundleIconFile);
    //    printf(CFBundleIcons);
    //    printf(CFBundleIdentifier);
    //    printf(CFBundleLocalizations);
    //    printf(CFBundleName);
    //    printf(CFBundleSignature);
    //    printf(CFBundleSpokenName);
    //    printf(CFBundleURLTypes);
    //    printf(CFBundleVersion);
    //    printf(CFBundleTypeName);
    //    printf(LSHandlerRank);
    //    printf(CFBundlePackageType);
    
}
@end
