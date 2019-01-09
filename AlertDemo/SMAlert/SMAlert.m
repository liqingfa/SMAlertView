//
//  SMAlert.m
//  AlertDemo
//
//  Created by 李清发 on 2017/7/19.
//  Copyright © 2017年 李清发. All rights reserved.
//

#import "SMAlert.h"
#import "SMControlView.h"

typedef void (^ShowaAtion)(void);


@interface SMAlert()

@property (assign, nonatomic) NSTimeInterval fadeInAnimationDuration;   // default is 0.15
@property (assign, nonatomic) NSTimeInterval fadeOutAnimationDuration;  // default is 0.15
@property (assign, nonatomic) NSTextAlignment contentTextAlignment;     // default is Left
@property (strong, nonatomic) UIColor *alertBackgroundColor;            // default is clearclolr
@property (strong, nonatomic) UIColor *confirmBtBackgroundColor;        // default is white
@property (strong, nonatomic) UIColor *cancleBtBackgroundColor;         // default is white
@property (strong, nonatomic) UIColor *confirmBtTitleColor;             // default is black
@property (strong, nonatomic) UIColor *cancleBtTitleColor;              // default is black
@property (strong, nonatomic) UIColor *contentTextColor;                // default is black
@property (strong, nonatomic) UIFont *contentFont;                      // default is 15
@property (assign, nonatomic) CGFloat contentLineSpace;                 // default is 4.0
@property (strong, nonatomic) UIFont *btTitleFont;                      // default is 15


@property (nonatomic, strong) UIButton *backgroundView;
@property (nonatomic, readonly) UIWindow *frontWindow;
@property (nonatomic, strong) SMControlView *controlView;

@property (nonatomic, assign) BOOL isVisible;
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

+ (void)showContent:(NSString*)content confirmButton:(SMButton*)confirmButton {
    [SMAlert showContent:content confirmButton:confirmButton cancleButton:nil];
}

+ (void)showContent:(NSString*)content confirmButton:(SMButton*)confirmButton cancleButton:(SMButton*)cancleButton {
    [[SMAlert sharedView] showImage:nil content:content customView:nil confirmButton:confirmButton cancleButton:cancleButton];
}

+ (void)showImage:(UIImage*)image content:(NSString*)content confirmButton:(SMButton*)confirmButton {
    [SMAlert showImage:image content:content confirmButton:confirmButton cancleButton:nil];
}

+ (void)showImage:(UIImage*)image content:(NSString*)content confirmButton:(SMButton*)confirmButton cancleButton:(SMButton*)cancleButton {
    [[SMAlert sharedView] showImage:image content:content customView:nil confirmButton:confirmButton cancleButton:cancleButton];
}

+ (void)showCustomView:(UIView*)view {
    [SMAlert showCustomView:view confirmButton:nil];
}

+ (void)showCustomView:(UIView*)view confirmButton:(SMButton*)confirmButton {
    [SMAlert showCustomView:view confirmButton:confirmButton cancleButton:nil];
}

+ (void)showCustomView:(UIView*)view confirmButton:(SMButton*)confirmButton cancleButton:(SMButton*)cancleButton {
    [[SMAlert sharedView] showImage:nil content:nil customView:view confirmButton:confirmButton cancleButton:cancleButton];
}

- (void)showImage:(UIImage*)image content:(NSString*)content customView:(UIView*)customView confirmButton:(SMButton*)confirmButton cancleButton:(SMButton*)cancleButton {
    if (self.isVisible == YES) return;
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
    if (customView) {
        [self.controlView setupCustomView:customView confirmButton:confirmButton cancleButton:cancleButton];
    }else{
        self.controlView.contentTextColor = self.contentTextColor;
        self.controlView.contentFont = self.contentFont;
        self.controlView.lineSpace = self.contentLineSpace;
        self.controlView.contentTextAlignment = self.contentTextAlignment;
        [self.controlView setupImage:image content:content confirmButton:confirmButton cancleButton:cancleButton];
    }
    [self addSubview:self.controlView];
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self.controlView
                                                                      attribute:NSLayoutAttributeCenterX
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:self
                                                                      attribute:NSLayoutAttributeLeft
                                                                     multiplier:1.0
                                                                       constant:self.frame.size.width/2];
    
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.controlView
                                                                     attribute:NSLayoutAttributeCenterY
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self
                                                                     attribute:NSLayoutAttributeTop
                                                                    multiplier:1.0
                                                                      constant:self.frame.size.height/2];
    [self addConstraint:leftConstraint];
    [self addConstraint:topConstraint];
    
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
    self.isVisible = YES;
}

+ (void)hide {
    SMAlert *alert = [SMAlert sharedView];
    if (alert.isVisible == NO) return;
    [alert.backgroundView removeFromSuperview];
    alert.backgroundView = nil;
    [alert.controlView removeFromSuperview];
    alert.controlView = nil;
    [alert removeFromSuperview];
    alert.isVisible = NO;
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
        self.contentTextAlignment = NSTextAlignmentLeft;
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
    if (duration==0) return;
    [SMAlert sharedView].fadeInAnimationDuration = duration;
}

+ (void)setFadeOutAnimationDuration:(NSTimeInterval)duration {
    if (duration==0) return;
    [SMAlert sharedView].fadeOutAnimationDuration = duration;
}

+ (void)setAlertBackgroundColor:(UIColor*)color {
    if (!color) return;
    [SMAlert sharedView].alertBackgroundColor = color;
}

+ (void)setConfirmBtBackgroundColor:(UIColor*)color {
    if (!color) return;
    [SMAlert sharedView].confirmBtBackgroundColor = color;
}

+ (void)setCancleBtBackgroundColor:(UIColor*)color {
    if (!color) return;
    [SMAlert sharedView].cancleBtBackgroundColor = color;
}

+ (void)setConfirmBtTitleColor:(UIColor*)color {
    if (!color) return;
    [SMAlert sharedView].confirmBtTitleColor = color;
}

+ (void)setCancleBtTitleColor:(UIColor*)color {
    if (!color) return;
    [SMAlert sharedView].cancleBtTitleColor = color;
}

+ (void)setContentFont:(UIFont*)font {
    if (!font) return;
    [SMAlert sharedView].contentFont = font;
}

+ (void)setContentTextColor:(UIColor*)color {
    if (!color) return;
    [SMAlert sharedView].contentTextColor = color;
}

+ (void)setBtTitleFont:(UIFont*)font {
    if (!font) return;
    [SMAlert sharedView].btTitleFont = font;
}

+ (void)setContentLineSpace:(CGFloat)lineSpace {
    [SMAlert sharedView].contentLineSpace = lineSpace;
}

+ (void)setContentTextAlignment:(NSTextAlignment)textAlignment {
    [SMAlert sharedView].contentTextAlignment = textAlignment;
}
@end
