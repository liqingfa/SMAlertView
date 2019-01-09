//
//  SMAlert.h
//  AlertDemo
//
//  Created by 李清发 on 2017/7/19.
//  Copyright © 2017年 李清发. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMButton.h"

@interface SMAlert : UIView

+ (void)setFadeInAnimationDuration:(NSTimeInterval)duration;
+ (void)setFadeOutAnimationDuration:(NSTimeInterval)duration;
+ (void)setAlertBackgroundColor:(UIColor*)color;
+ (void)setConfirmBtBackgroundColor:(UIColor*)color;
+ (void)setCancleBtBackgroundColor:(UIColor*)color;
+ (void)setConfirmBtTitleColor:(UIColor*)color;
+ (void)setCancleBtTitleColor:(UIColor*)color;
+ (void)setContentTextColor:(UIColor*)color;
+ (void)setContentFont:(UIFont*)font;
+ (void)setBtTitleFont:(UIFont*)font;
+ (void)setContentLineSpace:(CGFloat)lineSpace;
+ (void)setContentTextAlignment:(NSTextAlignment)textAlignment;

// 显示文字和一个确认
+ (void)showContent:(NSString*)content confirmButton:(SMButton*)confirmButton;
// 显示文字和一个确认一个取消
+ (void)showContent:(NSString*)content confirmButton:(SMButton*)confirmButton cancleButton:(SMButton*)cancleButton;

// 显示一张图片，文字，确认
+ (void)showImage:(UIImage*)image content:(NSString*)content confirmButton:(SMButton*)confirmButton;
// 显示一张图片，文字，确认，取消
+ (void)showImage:(UIImage*)image content:(NSString*)content confirmButton:(SMButton*)confirmButton cancleButton:(SMButton*)cancleButton;

// 显示自定义view
+ (void)showCustomView:(UIView*)view;
// 显示自定义view，确认
+ (void)showCustomView:(UIView*)view confirmButton:(SMButton*)confirmButton;
// 显示自定义view，确认，取消
+ (void)showCustomView:(UIView*)view confirmButton:(SMButton*)confirmButton cancleButton:(SMButton*)cancleButton;
@end
