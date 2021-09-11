//
//  OTJAlertViewController.h
//  Ontime Job
//
//  Created by Andy on 2020/12/7.
//  Copyright © 2020 Hirect. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSInteger{
    OTJAlertTypeAlert = 1,
    OTJAlertTypeSheet = 2,
}OTJAlertType;

NS_ASSUME_NONNULL_BEGIN

@interface OTJAlertViewController : UIViewController

@property (nonatomic, assign) OTJAlertType alertType;

@end

NS_ASSUME_NONNULL_END
