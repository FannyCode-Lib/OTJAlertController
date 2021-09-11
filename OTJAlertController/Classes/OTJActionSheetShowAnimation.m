//
//  OTJActionSheetShowAnimation.m
//  Ontime Job
//
//  Created by Andy on 2020/12/7.
//  Copyright © 2020 Hirect. All rights reserved.
//

#import "OTJActionSheetShowAnimation.h"

@implementation OTJActionSheetShowAnimation

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext { 
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *containerView = transitionContext.containerView;
    toView.frame = [transitionContext finalFrameForViewController:toViewController];
    [containerView addSubview:toView];
    toView.transform = CGAffineTransformMakeTranslation(0, UIScreen.mainScreen.bounds.size.height);
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:0.85 initialSpringVelocity:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        toView.transform = CGAffineTransformMakeTranslation(1, 1);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:finished];
    }];
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext { 
    return 0.6;
}

@end
