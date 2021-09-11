//
//  OTJActionAlertDismissAnimation.m
//  Ontime Job
//
//  Created by Andy on 2020/12/7.
//  Copyright © 2020 Hirect. All rights reserved.
//

#import "OTJActionAlertDismissAnimation.h"

@implementation OTJActionAlertDismissAnimation

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    fromView.transform = CGAffineTransformMakeScale(0.01, 0.01);
    fromView.alpha = 0.0;
    [transitionContext completeTransition:YES];
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.2;
}

@end
