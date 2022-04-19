//
//  AppDelegate.m
//  SafeTimerDemo
//
//  Created by JackPersonal on 2022/4/18.
//

#import "AppDelegate.h"
#import "HomeVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    HomeVC *vc = [[HomeVC alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    [vc release]; vc = nil;
    [nav release]; nav = nil;
    
    return YES;
}



@end
