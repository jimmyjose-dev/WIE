//
//  AppDelegate.h
//  extractimages
//
//  Created by Jimmy on 22/12/12.
//  Copyright (c) 2012 VarshylMobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;
@property (strong , nonatomic) UINavigationController *navController;

@end
