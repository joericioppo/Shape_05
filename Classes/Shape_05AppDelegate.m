//
//  Shape_05AppDelegate.m
//  Shape_05
//
//  Created by test on 9/4/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "Shape_05AppDelegate.h"
#import "Shape_05ViewController.h"

@implementation Shape_05AppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
