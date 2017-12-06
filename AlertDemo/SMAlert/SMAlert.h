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

@property (assign, nonatomic) NSTimeInterval fadeInAnimationDuration;   // default is 0.15
@property (assign, nonatomic) NSTimeInterval fadeOutAnimationDuration;  // default is 0.15

@property (strong, nonatomic) UIColor *alertBackgroundColor UI_APPEARANCE_SELECTOR;            // default is clear clolr
@property (strong, nonatomic) UIColor *confirmBtBackgroundColor UI_APPEARANCE_SELECTOR;        // default is white
@property (strong, nonatomic) UIColor *cancleBtBackgroundColor UI_APPEARANCE_SELECTOR;         // default is white
@property (strong, nonatomic) UIColor *confirmBtTitleColor UI_APPEARANCE_SELECTOR;             // default is black
@property (strong, nonatomic) UIColor *cancleBtTitleColor UI_APPEARANCE_SELECTOR;              // default is black
@property (strong, nonatomic) UIColor *contentTextColor UI_APPEARANCE_SELECTOR;                // default is black
@property (strong, nonatomic) UIFont *contentFont UI_APPEARANCE_SELECTOR;                      // default is 15
@property (assign, nonatomic) CGFloat contentLineSpace UI_APPEARANCE_SELECTOR;                 // default is 4.0
@property (strong, nonatomic) UIFont *btTitleFont UI_APPEARANCE_SELECTOR;                      // default is 15
@property (assign, nonatomic) NSTextAlignment contentTextAlignment UI_APPEARANCE_SELECTOR;     // default is NSTextAlignmentLeft


@property (assign ,nonatomic) BOOL touchToHide ; // default is NO except [SMAlert showContent:content] && [ZMAlert showImage:image content:content]

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
+ (void)setTouchToHide:(BOOL)touchToHide;
+ (void)setContentTextAlignment:(NSTextAlignment)textAlignment;

// 只显示文字
+ (void)showContent:(NSString*)content;
// 显示文字和一个确认
+ (void)showContent:(NSString*)content confirmButton:(SMButton*)confirmButton;
// 显示文字和一个确认一个取消
+ (void)showContent:(NSString*)content confirmButton:(SMButton*)confirmButton cancleButton:(SMButton*)cancleButton;

// 显示一张图片和文字
+ (void)showImage:(UIImage*)image content:(NSString*)content;
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

// 隐藏Alert方法
+(void)hide;
// 隐藏Alert并清除待显示队列
+(void)hideAll;

// 这个block在Alert完全隐藏后执行，可以放入你的相关操作，并在执行完成之后自动置为nil，不会影响接下来的行为
+(void)hideCompletion:(void (^)(void))completion;
@end
