//
//  OTJAlertViewController.m
//  Ontime Job
//
//  Created by Andy on 2020/12/7.
//  Copyright © 2020 Hirect. All rights reserved.
//

#import "OTJAlertViewController.h"
#import "OTJActionAlertShowAnimation.h"
#import "OTJActionAlertDismissAnimation.h"
#import "OTJActionSheetShowAnimation.h"
#import "OTJActionSheetDismissAnimation.h"
#import "OTJAlertPresentationController.h"

@interface OTJAlertViewController ()<UIViewControllerTransitioningDelegate,UIGestureRecognizerDelegate>

@property (nonatomic, strong) OTJActionAlertShowAnimation *showAlertAnimation;
@property (nonatomic, strong) OTJActionSheetShowAnimation *showSheetAnimation;
@property (nonatomic, strong) OTJActionAlertDismissAnimation *dismissAlertAnimation;
@property (nonatomic, strong) OTJActionSheetDismissAnimation *dismissSheetAlertAnimation;

@end

@implementation OTJAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (instancetype)init{
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit{
    self.modalPresentationStyle = UIModalPresentationCustom;
    self.transitioningDelegate = self;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissView)];
    tap.numberOfTapsRequired = 1;
    tap.delegate = self;
    [self.view addGestureRecognizer:tap];
}

- (void)dismissView{
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:NULL];

}

- (void)setAlertType:(OTJAlertType)alertType{
    _alertType = alertType;
}

#pragma mark UIViewControllerTransitioningDelegate

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source{
    OTJAlertPresentationController *controller = [[OTJAlertPresentationController alloc]initWithPresentedViewController:presented presentingViewController:presenting];
    return controller;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    if (self.alertType == OTJAlertTypeAlert) {
        return self.showAlertAnimation;
    }else{
        return self.showSheetAnimation;
    }
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    if (self.alertType == OTJAlertTypeAlert) {
        return self.dismissAlertAnimation;
    }else{
        return self.dismissSheetAlertAnimation;
    }

}

#pragma mark UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if (self.view.subviews.count > 0) {
        if ([touch.view isDescendantOfView:[self.view.subviews firstObject]]) {
               return NO;
           }
        return YES;
    }
    return YES;
}

#pragma mark lazy

- (OTJActionAlertShowAnimation *)showAlertAnimation{
    if (_showAlertAnimation == nil) {
        _showAlertAnimation = [[OTJActionAlertShowAnimation alloc]init];
    }
    return _showAlertAnimation;;
}

- (OTJActionSheetShowAnimation *)showSheetAnimation{
    if (_showSheetAnimation == nil) {
        _showSheetAnimation = [[OTJActionSheetShowAnimation alloc]init];
    }
    return _showSheetAnimation;
}

- (OTJActionAlertDismissAnimation *)dismissAlertAnimation{
    if (_dismissAlertAnimation == nil) {
        _dismissAlertAnimation = [[OTJActionAlertDismissAnimation alloc]init];
    }
    return _dismissAlertAnimation;
}

- (OTJActionSheetDismissAnimation *)dismissSheetAlertAnimation{
    if (_dismissSheetAlertAnimation == nil) {
        _dismissSheetAlertAnimation = [[OTJActionSheetDismissAnimation alloc]init];
    }
    return _dismissSheetAlertAnimation;;
}
@end
