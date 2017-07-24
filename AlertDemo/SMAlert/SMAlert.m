//
//  SMAlert.m
//  AlertDemo
//
//  Created by 李清发 on 2017/7/19.
//  Copyright © 2017年 李清发. All rights reserved.
//

#import "SMAlert.h"
#import "SMControlView.h"

@interface SMAlert()

@property (nonatomic, strong) UIButton *backgroundView;

@property (nonatomic, readonly) UIWindow *frontWindow;

@property (nonatomic, strong) SMControlView *controlView;

@property (nonatomic, strong) SMAlertButtonClickAction hideCompletionBlock;
@end

@implementation SMAlert

+ (SMAlert*)sharedView {
    static dispatch_once_t once;
    static SMAlert *sharedView;
    dispatch_once(&once, ^{
        sharedView = [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    });
    return sharedView;
}

+ (void)showContent:(NSString*)content {
    [SMAlert showContent:content confirmButton:nil];
}

+ (void)showContent:(NSString*)content confirmButton:(SMButton*)confirmButton {
    [SMAlert showContent:content confirmButton:confirmButton cancleButton:nil];
}

+ (void)showContent:(NSString*)content confirmButton:(SMButton*)confirmButton cancleButton:(SMButton*)cancleButton {
    [[SMAlert sharedView] showImage:nil content:content confirmButton:confirmButton cancleButton:cancleButton];
}


+ (void)showImage:(UIImage*)image content:(NSString*)content {
    [SMAlert showImage:image content:content confirmButton:nil];
}

+ (void)showImage:(UIImage*)image content:(NSString*)content confirmButton:(SMButton*)confirmButton {
    [SMAlert showImage:image content:content confirmButton:confirmButton cancleButton:nil];
}

+ (void)showImage:(UIImage*)image content:(NSString*)content confirmButton:(SMButton*)confirmButton cancleButton:(SMButton*)cancleButton {
    [[SMAlert sharedView] showImage:image content:content confirmButton:confirmButton cancleButton:cancleButton];
}


- (void)showImage:(UIImage*)image content:(NSString*)content confirmButton:(SMButton*)confirmButton cancleButton:(SMButton*)cancleButton {
    self.backgroundView = [UIButton new];
    self.backgroundView.frame = self.bounds;
    self.backgroundView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.backgroundView];
    [self.frontWindow addSubview:self];
    
    if (![self.alertBackgroundColor isEqual:[UIColor clearColor]]) {
        [UIView animateWithDuration:self.fadeInAnimationDuration animations:^{
            self.backgroundView.backgroundColor = self.alertBackgroundColor;
        }];
    }
    if (!confirmButton || self.touchToHide) {
        //only content or allow touch to hide
        [self.backgroundView addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    }
    if (!confirmButton && cancleButton) {
        NSAssert(NO,@"如果只需要一个按钮，请使用confirmButton");
    }
    if (confirmButton) {
        [confirmButton setBackgroundColor:self.confirmBtBackgroundColor];
        [confirmButton setTitleColor:self.confirmBtTitleColor forState:UIControlStateNormal];
        [confirmButton.titleLabel setFont:self.btTitleFont];
    }
    if (cancleButton) {
        [cancleButton setBackgroundColor:self.cancleBtBackgroundColor];
        [cancleButton setTitleColor:self.cancleBtTitleColor forState:UIControlStateNormal];
        [cancleButton.titleLabel setFont:self.btTitleFont];
    }
    
    self.controlView = [SMControlView new];
    self.controlView.contentTextColor = self.contentTextColor;
    self.controlView.contentFont = self.contentFont;
    self.controlView.lineSpace = self.contentLineSpace;
    
    [self.controlView setupImage:image content:content confirmButton:confirmButton cancleButton:cancleButton];
    
    [self addSubview:self.controlView];
    
    CABasicAnimation *animaitonX = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    animaitonX.removedOnCompletion = NO;
    animaitonX.fromValue = @1.1;
    animaitonX.toValue = @1;
    animaitonX.duration = self.fadeInAnimationDuration;
    [self.controlView.layer addAnimation:animaitonX forKey:nil];
    CABasicAnimation *animaitonY = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    animaitonY.removedOnCompletion = NO;
    animaitonY.fromValue = @1.1;
    animaitonY.toValue = @1;
    animaitonY.duration = self.fadeInAnimationDuration;
    [self.controlView.layer addAnimation:animaitonY forKey:nil];
    CABasicAnimation *animaitonAlpha = [CABasicAnimation animationWithKeyPath:@"alpha"];
    animaitonAlpha.removedOnCompletion = NO;
    animaitonAlpha.fromValue = @0.5;
    animaitonAlpha.toValue = @1;
    animaitonAlpha.duration = self.fadeInAnimationDuration;
    [self.controlView.layer addAnimation:animaitonAlpha forKey:nil];
}

+ (void)hide {
    [[SMAlert sharedView].backgroundView removeFromSuperview];
    [SMAlert sharedView].backgroundView = nil;
    
    [[SMAlert sharedView].controlView removeFromSuperview];
    [SMAlert sharedView].controlView = nil;
    
    [[SMAlert sharedView] removeFromSuperview];
    
    if ([SMAlert sharedView].hideCompletionBlock) {
        [SMAlert sharedView].hideCompletionBlock();
        [SMAlert sharedView].hideCompletionBlock = nil;
    }
}

+(void)hideCompletion:(SMAlertButtonClickAction)completion {
    [SMAlert sharedView].hideCompletionBlock = completion;
}

- (void)hide {
    [SMAlert hide];
}
#pragma mark - initWithFrame
- (instancetype)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        self.fadeInAnimationDuration = 0.1;
        self.fadeOutAnimationDuration = 0.1;
        self.alertBackgroundColor = [UIColor clearColor];
        self.confirmBtBackgroundColor = [UIColor whiteColor];
        self.cancleBtBackgroundColor = [UIColor whiteColor];
        self.confirmBtTitleColor = [UIColor redColor];
        self.cancleBtTitleColor = [UIColor blueColor];
        self.contentTextColor = [UIColor blackColor];
        self.contentLineSpace = 4.0;
        self.contentFont = [UIFont systemFontOfSize:15.0];
        self.btTitleFont = [UIFont systemFontOfSize:15.0];
        self.autoHideTimeInterval = 3.0;
        self.touchToHide = NO;
    }
    return self;
}

- (UIWindow *)frontWindow {
    NSEnumerator *frontToBackWindows = [UIApplication.sharedApplication.windows reverseObjectEnumerator];
    for (UIWindow *window in frontToBackWindows) {
        BOOL windowOnMainScreen = window.screen == UIScreen.mainScreen;
        BOOL windowIsVisible = !window.hidden && window.alpha > 0;
        BOOL windowLevelSupported = (window.windowLevel >= UIWindowLevelNormal && window.windowLevel <= UIWindowLevelNormal);
        if(windowOnMainScreen && windowIsVisible && windowLevelSupported) {
            return window;
        }
    }
    return nil;
}
#pragma mark - UIAppearance Setters

+ (void)setFadeInAnimationDuration:(NSTimeInterval)duration {
    [SMAlert sharedView].fadeInAnimationDuration = duration;
}

+ (void)setFadeOutAnimationDuration:(NSTimeInterval)duration {
    [SMAlert sharedView].fadeOutAnimationDuration = duration;
}

+ (void)setAlertBackgroundColor:(UIColor*)color {
    [SMAlert sharedView].alertBackgroundColor = color;
}

+ (void)setConfirmBtBackgroundColor:(UIColor*)color {
    [SMAlert sharedView].confirmBtBackgroundColor = color;
}

+ (void)setCancleBtBackgroundColor:(UIColor*)color {
    [SMAlert sharedView].cancleBtBackgroundColor = color;
}

+ (void)setConfirmBtTitleColor:(UIColor*)color {
    [SMAlert sharedView].confirmBtTitleColor = color;
}

+ (void)setCancleBtTitleColor:(UIColor*)color {
    [SMAlert sharedView].cancleBtTitleColor = color;
}

+ (void)setContentFont:(UIFont*)font {
    [SMAlert sharedView].contentFont = font;
}

+ (void)setContentTextColor:(UIColor*)color {
    [SMAlert sharedView].contentTextColor = color;
}

+ (void)setBtTitleFont:(UIFont*)font {
    [SMAlert sharedView].btTitleFont = font;
}

+ (void)setContentLineSpace:(CGFloat)lineSpace {
    [SMAlert sharedView].contentLineSpace = lineSpace;
}

+ (void)setTouchToHide:(BOOL)touchToHide {
    [SMAlert sharedView].touchToHide = touchToHide;
}

+ (void)setAutoHideTimeInterval:(NSTimeInterval)autoHideTimeInterval {
    [SMAlert sharedView].autoHideTimeInterval = autoHideTimeInterval;
}
@end
