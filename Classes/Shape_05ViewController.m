//
//  Shape_05ViewController.m
//  Shape_05
//
//  Created by test on 9/4/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "Shape_05ViewController.h"

@implementation Shape_05ViewController


- (void)loadView 
{
	
	UIView *appView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	appView.backgroundColor = [UIColor blackColor];
	
	self.view = appView;
	
	[appView release];
	
	rootLayer	= [CALayer layer];
	
	rootLayer.frame = self.view.bounds;
	
	[self.view.layer addSublayer:rootLayer];
	
	
	//Pentagon Path
	
	pentagonPath = CGPathCreateMutable();
	
	CGPoint center = self.view.center;
	
	CGPathMoveToPoint(pentagonPath, nil, center.x, center.y - 75.0);
	
	for(int i = 1; i < 5; ++i)
	{
		CGFloat x = - 75.0 * sinf(i * 2.0 * M_PI / 5.0);
		CGFloat y =  - 75.0 * cosf(i * 2.0 * M_PI / 5.0);
		
		CGPathAddLineToPoint(pentagonPath, nil,center.x + x, center.y + y);
	}
	//	CGPathCloseSubpath(pentagonPath); //This screws everything up.
	
	
	//Star Path
	
	starPath = CGPathCreateMutable();
	
	center = self.view.center;
	
	CGPathMoveToPoint(starPath, NULL, center.x, center.y + 75.0);
	
	for(int i = 1; i < 5; ++i)
	{
		CGFloat x =  75.0 * sinf(i * 4.0 * M_PI / 5.0);
		CGFloat y =  75.0 * cosf(i * 4.0 * M_PI / 5.0);
		
		CGPathAddLineToPoint(starPath, NULL, center.x + x, center.y + y);
	}
	
	CGPathCloseSubpath(starPath);
	
	
	//Create Shape
	
	shapeLayer = [CAShapeLayer layer];
	
	shapeLayer.path = pentagonPath;
	
	UIColor *fillColor = [UIColor colorWithWhite:0.9 alpha:1.0];
	
	shapeLayer.fillColor = fillColor.CGColor; 
	
	//	shapeLayer.contents = [UIImage imageNamed:@"test.png"];
	
	shapeLayer.fillRule = kCAFillRuleNonZero;
	
	[rootLayer addSublayer:shapeLayer];
	
	[self performSelector:@selector(startAnimation) withObject:nil afterDelay:1.0];
	
}


-(void)startAnimation
{	
	CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
	
	animation.duration = 2.0;
	
	animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	
	animation.repeatCount = 1e100f;
	
	animation.autoreverses = YES;
	
	animation.fromValue = (id)pentagonPath;
	
	animation.toValue = (id)starPath;
	
	
	[shapeLayer addAnimation:animation forKey:@"animatePath"];
}


- (void)didReceiveMemoryWarning 
{
    [super didReceiveMemoryWarning];
}


- (void)dealloc
{
	CGPathRelease(starPath);
	CGPathRelease(pentagonPath);
    [super dealloc];
}


@end