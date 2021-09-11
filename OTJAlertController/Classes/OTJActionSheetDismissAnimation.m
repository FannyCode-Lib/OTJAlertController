//
//  OTJActionSheetDismissAnimation.m
//  Ontime Job
//
//  Created by Andy on 2020/12/7.
//  Copyright © 2020 Hirect. All rights reserved.
//

#import "OTJActionSheetDismissAnimation.h"

@implementation OTJActionSheetDismissAnimation

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        fromView.transform = CGAffineTransformMakeTranslation(0, UIScreen.mainScreen.bounds.size.height);
        fromView.alpha = 0.0;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:finished];
    }];
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.2;
}

@end
