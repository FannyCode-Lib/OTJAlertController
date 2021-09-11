//
//  OTJActionAlertShowAnimation.m
//  Ontime Job
//
//  Created by Andy on 2020/12/7.
//  Copyright © 2020 Hirect. All rights reserved.
//

#import "OTJActionAlertShowAnimation.h"

@implementation OTJActionAlertShowAnimation

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *containerView = transitionContext.containerView;
    toView.frame = [transitionContext finalFrameForViewController:toViewController];
    [containerView addSubview:toView];
    toView.transform = CGAffineTransformMakeScale(1.2, 1.2);
    [UIView animateWithDuration:0.2 delay:0 usingSpringWithDamping:0.85 initialSpringVelocity:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        toView.transform = CGAffineTransformMakeScale(1, 1);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:finished];
    }];
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.2;
}

@end
