//
//  AppDelegate.m
//  iOSObject
//
//  Created by W E on 2021/3/19.
//

#import "AppDelegate.h"
#import <FlutterPluginRegistrant/GeneratedPluginRegistrant.h>
#import <flutter_boost/FlutterBoost.h>
#import <FlutterBoost.h>
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

/*
 https://juejin.cn/post/6943836165942312997#heading-25
 engine.run(
   withEntrypoint: FlutterDefaultDartEntrypoint, initialRoute: "/onboarding")
 这话的意思是，让Dart:UI 的windows.defaultRouteName 变成自定义/onboadrding 而不是 /
 */


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    if (@available(iOS 13.0, *)) {
            
    } else {
        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [self.window setBackgroundColor:[UIColor whiteColor]];
        ViewController *con = [[ViewController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:con];
        [self.window setRootViewController:nav];
        [self.window makeKeyAndVisible];
    }
    [GeneratedPluginRegistrant registerWithRegistry:self];
    
    
//    self.flutterEngine = [[FlutterEngine alloc] initWithName:@"my flutter engine"];
//    [self.flutterEngine runWithEntrypoint:nil];
    
      // Used to connect plugins (only if you have plugins with iOS platform code).
    [GeneratedPluginRegistrant registerWithRegistry:self.flutterEngine];
    
    //使用FlutterBoost
    MyFlutterBoostDelegate* delegate=[[MyFlutterBoostDelegate alloc ] init];
    [[FlutterBoost instance] setup:application delegate:delegate callback:^(FlutterEngine *engine) {
    } ];
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
