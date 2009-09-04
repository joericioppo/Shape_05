//
//  Shape_05ViewController.h
//  Shape_05
//
//  Created by test on 9/4/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface Shape_05ViewController : UIViewController {

	CALayer						*rootLayer;
	
	CAShapeLayer			*shapeLayer;
	
	CGMutablePathRef		pentagonPath;
	CGMutablePathRef		starPath;
	
}

-(void)startAnimation;


@end

