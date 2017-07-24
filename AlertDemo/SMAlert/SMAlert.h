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
@property (strong ,nonatomic) UIFont *contentFont UI_APPEARANCE_SELECTOR;                      // default is 15
@property (assign ,nonatomic) CGFloat contentLineSpace UI_APPEARANCE_SELECTOR;                 // default is 4.0
@property (strong ,nonatomic) UIFont *btTitleFont UI_APPEARANCE_SELECTOR;                      // default is 15


@property (assign ,nonatomic) BOOL touchToHide ;                         // default is NO except [SMAlert showContent:content] && [ZMAlert showImage:image content:content]
@property (assign ,nonatomic) NSTimeInterval autoHideTimeInterval;      // default is 3 only used [SMAlert showContent:content] && [ZMAlert showImage:image content:content]


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
+ (void)setAutoHideTimeInterval:(NSTimeInterval)autoHideTimeInterval;


+ (void)showContent:(NSString*)content;
+ (void)showContent:(NSString*)content confirmButton:(SMButton*)confirmButton;
+ (void)showContent:(NSString*)content confirmButton:(SMButton*)confirmButton cancleButton:(SMButton*)cancleButton;

+ (void)showImage:(UIImage*)image content:(NSString*)content;
+ (void)showImage:(UIImage*)image content:(NSString*)content confirmButton:(SMButton*)confirmButton;
+ (void)showImage:(UIImage*)image content:(NSString*)content confirmButton:(SMButton*)confirmButton cancleButton:(SMButton*)cancleButton;

+(void)hide;
+(void)hideCompletion:(void (^)(void))completion;
@end
