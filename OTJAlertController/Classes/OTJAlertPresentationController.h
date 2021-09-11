//
//  OTJAlertPresentationController.h
//  Ontime Job
//
//  Created by Andy on 2020/10/23.
//  Copyright © 2020 Hirect. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OTJAlertPresentationController : UIPresentationController

@property (nonatomic, assign) CGSize presentedViewSize;
@property (nonatomic, strong) UIColor *backViewColor;

@end

NS_ASSUME_NONNULL_END
