//
//  AppDelegate.m
//  iosTestProject
//
//  Created by 天下 on 2025/5/30.
//

#import "AppDelegate.h"
#import "GoogleSignIn/GoogleSignIn.h"
#import "FBSDKCoreKit/FBSDKCoreKit.h"
#import "oneSDK/oneSDK.h"
#import "oneSDK/oneSDKBranch.h"
#import "oneSDK/oneSDKBranchOrderInfo.h"
//#import "./appStorePurchase.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    [[FBSDKApplicationDelegate sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
    [self initAdjustSDK];
    [oneSDKBranch initSDK:self];
    
    return YES;
}

- (void)initAdjustSDK
{
    // State为1表示debug环境, 为2表示release环境
//    [oneSDKBranch setSDKState:@"e0qi68v8to1s" State:2];
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

-(BOOL)application:(UIApplication*)app openURL:(NSURL*)url options:(NSDictionary<NSString*, id>*)options
{
    // tianxia facebook and google
    NSString* stringURL = [url absoluteString];
    if([stringURL containsString:@"fb"])
    {
        return [[FBSDKApplicationDelegate sharedInstance] application:app openURL:url options:options];
    }
    else
    {
        return [[GIDSignIn sharedInstance] handleURL:url];
    }
}

@end
