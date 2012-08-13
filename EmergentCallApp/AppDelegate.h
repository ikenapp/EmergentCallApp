//
//  AppDelegate.h
//  EmergentCallApp
//
//  Created by Tai Ken on 12/5/1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "SettingsViewController.h"
#import "CoreTelephony/CTCallCenter.h"
#import "CoreTelephony/CTCall.h"
#import <MediaPlayer/MediaPlayer.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate,UITabBarControllerDelegate>{
    UINavigationController *nav;
    CTCallCenter *callCenter;
    MPMusicPlayerController *musicPlayer ;
}

@property (strong, nonatomic) UIWindow *window;

@end
