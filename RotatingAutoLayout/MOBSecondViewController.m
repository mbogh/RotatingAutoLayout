//
//  MOBSecondViewController.m
//  RotatingAutoLayout
//
//  Created by Morten Bøgh on 11/02/14.
//  Copyright (c) 2014 Morten Bøgh. All rights reserved.
//

#import "MOBSecondViewController.h"

@interface MOBSecondViewController () <UIGestureRecognizerDelegate> {
    UIImageView *_bearImageView;
}

@end

@implementation MOBSecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _bearImageView = ({
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bear"]];
        imageView.center = self.view.center;
        [self.view addSubview:imageView];
        imageView;
    });
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
