//
//  OTJAlertPresentationController.m
//  Ontime Job
//
//  Created by Andy on 2020/10/23.
//  Copyright © 2020 Hirect. All rights reserved.
//

#import "OTJAlertPresentationController.h"

@interface OTJAlertPresentationController ()

@property (nonatomic, strong) UIView *backgroundView;

@end

@implementation OTJAlertPresentationController

- (void)presentationTransitionWillBegin
{
    self.backgroundView.frame = self.containerView.bounds;
    [self.containerView addSubview:self.backgroundView];
    [self.presentedViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        self.backgroundView.alpha = 0.25;
    } completion:nil];
}

- (void)dismissalTransitionWillBegin
{
    [self.presentedViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        self.backgroundView.alpha = 0;
    } completion:nil];
}

- (UIView *)backgroundView
{
    if (!_backgroundView) {
        _backgroundView = [UIView new];
        _backgroundView.backgroundColor = [UIColor blackColor];
        _backgroundView.alpha = 0;
    }
    return _backgroundView;
}

@end
