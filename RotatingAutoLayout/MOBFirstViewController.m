//
//  MOBFirstViewController.m
//  RotatingAutoLayout
//
//  Created by Morten Bøgh on 11/02/14.
//  Copyright (c) 2014 Morten Bøgh. All rights reserved.
//

#import "MOBFirstViewController.h"

@interface MOBFirstViewController () <UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *bearImageView;

@end

@implementation MOBFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Setting 'translatesAutoresizingMaskIntoConstraints' to YES will give a nice rotate,pinch and pan feel but generate AutoLayout errors
    // _bearImageView.translatesAutoresizingMaskIntoConstraints = YES;
}

#pragma mark - Gesture Recognizer Actions

- (IBAction)didPan:(UIPanGestureRecognizer *)panGestureRecognizer {
    CGPoint translation = [panGestureRecognizer translationInView:_bearImageView.superview];
    _bearImageView.center = CGPointMake(_bearImageView.center.x + translation.x, _bearImageView.center.y + translation.y);
    [panGestureRecognizer setTranslation:CGPointZero inView:_bearImageView.superview];
}

- (IBAction)didPinch:(UIPinchGestureRecognizer *)pinchGestureRecognizer {
    _bearImageView.transform = CGAffineTransformScale(_bearImageView.transform, pinchGestureRecognizer.scale, pinchGestureRecognizer.scale);
    pinchGestureRecognizer.scale = 1;
}

- (IBAction)didRotate:(UIRotationGestureRecognizer *)rotationGestureRecognizer {
    _bearImageView.transform = CGAffineTransformRotate(_bearImageView.transform, rotationGestureRecognizer.rotation);
    rotationGestureRecognizer.rotation = 0;
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

@end
