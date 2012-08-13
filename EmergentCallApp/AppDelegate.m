//
//  AppDelegate.m
//  EmergentCallApp
//
//  Created by Tai Ken on 12/5/1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;

- (void)dealloc
{
    [_window release];
    [nav release];
    [callCenter release];
    [super dealloc];
}

- (void) initApp{
    nav = [[UINavigationController alloc] init];
    nav.navigationBar.barStyle = UIBarStyleBlackOpaque;
    MainViewController * main = [[MainViewController alloc]init];
    [main.tabBarItem initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:21];
    SettingsViewController * settings = [[SettingsViewController alloc]init];
    [settings.tabBarItem initWithTabBarSystemItem:UITabBarSystemItemMore tag:1];
    UITabBarController * tabBar = [[UITabBarController alloc]init];
    tabBar.title =@"Main";
    tabBar.delegate = self;
    tabBar.viewControllers = [NSArray arrayWithObjects:main,settings, nil];
    [main release];    
    [settings release];
    [nav pushViewController:tabBar animated:NO];
    [tabBar release];
    [self.window addSubview:nav.view];
    UIDevice* device = [UIDevice currentDevice];
    BOOL backgroundSupported = NO;
    if ([device respondsToSelector:@selector(isMultitaskingSupported)])
        
        backgroundSupported = device.multitaskingSupported;
    
    NSLog(@"%@",backgroundSupported?@"YES":@"NO");
    callCenter = [[CTCallCenter alloc] init];
    callCenter.callEventHandler=^(CTCall* call){
        NSLog(@"%@",call.callState);
        if (call.callState == CTCallStateDisconnected)
        { 
            //handle disconnect
            NSLog(@"CTCallStateDisconnected");
           
        }else if (call.callState == CTCallStateIncoming)
        { 
            NSLog(@"CTCallStateIncoming");
            musicPlayer = [MPMusicPlayerController iPodMusicPlayer];
            musicPlayer.volume = 0; 
            //@throw [[NSException alloc] initWithName:@"XXX" reason:@"OOO" userInfo:nil];
        }
    };
}

-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    if (viewController.tabBarItem.tag == 21) {
        tabBarController.title = @"Main";
        tabBarController.navigationItem.rightBarButtonItem = nil;
        
    }else{
        tabBarController.title = @"Settings";
        SettingsViewController * settings = (SettingsViewController * )[tabBarController.viewControllers objectAtIndex:1];
        [settings initBarButtonItem];
    }
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    application.idleTimerDisabled = YES;
    [self initApp];
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

@end
