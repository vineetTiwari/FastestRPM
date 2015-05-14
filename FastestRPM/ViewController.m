//
//  ViewController.m
//  FastestRPM
//
//  Created by Vineet Tiwari on 2015-05-14.
//  Copyright (c) 2015 vinny.co. All rights reserved.
//

#import "ViewController.h"

#define degreesToRadians(angleDegrees) (angleDegrees * M_PI / 180.0)

@interface ViewController () {

  CGPoint startLocation;
}

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  CGAffineTransform rotate = CGAffineTransformMakeRotation(degreesToRadians(180));
  self.rpmNeedle.transform = rotate;

  UIPanGestureRecognizer *circulerGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];

  [self.view addGestureRecognizer:circulerGesture];

}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  
}

- (IBAction)panGesture:(UIPanGestureRecognizer  *)sender {

  CGPoint velocity = [sender velocityInView:self.view];
  CGFloat absolueVelocity = sqrt(pow(velocity.x, 2) + pow(velocity.y, 2));

//  NSLog(@"%f", absolueVelocity);

  if (sender.state == UIGestureRecognizerStateBegan) {

    startLocation = [sender locationInView:self.view];
  } else if (sender.state == UIGestureRecognizerStateEnded) {

    CGAffineTransform abbey = CGAffineTransformMakeRotation(degreesToRadians(180));
    self.rpmNeedle.transform = abbey;

  } else {

    CGAffineTransform abbey = CGAffineTransformMakeRotation(degreesToRadians ((((absolueVelocity/3500) * 270) + 180)));
    self.rpmNeedle.transform = abbey;
  }

}

@end
