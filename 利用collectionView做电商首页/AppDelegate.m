//
//  AppDelegate.m
//  利用collectionView做电商首页
//
//  Created by Temple on 2018/1/23.
//  Copyright © 2018年 Temple. All rights reserved.
//

#import "AppDelegate.h"
#import "HMHomeController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    HMHomeController *homeVC = [[HMHomeController alloc] init];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = homeVC;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
