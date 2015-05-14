//
//  ViewController.h
//  FastestRPM
//
//  Created by Vineet Tiwari on 2015-05-14.
//  Copyright (c) 2015 vinny.co. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *rpmDial;

@property (weak, nonatomic) IBOutlet UIImageView *rpmNeedle;

- (IBAction)panGesture:(UIPanGestureRecognizer *)sender;

@end

