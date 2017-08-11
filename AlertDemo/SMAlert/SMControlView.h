//
//  SMContentView.h
//  AlertDemo
//
//  Created by 李清发 on 2017/7/19.
//  Copyright © 2017年 李清发. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMButton.h"

@interface SMControlView : UIView
@property (strong, nonatomic) UIColor *contentTextColor UI_APPEARANCE_SELECTOR;              // default is black
@property (strong, nonatomic) UIFont *contentFont UI_APPEARANCE_SELECTOR;                    // default is 15
@property (assign, nonatomic) CGFloat lineSpace UI_APPEARANCE_SELECTOR;                      // default is 4
@property (strong, nonatomic) UIColor *lineColor UI_APPEARANCE_SELECTOR;
@property (assign, nonatomic) NSTextAlignment contentTextAlignment UI_APPEARANCE_SELECTOR;    // default is NSTextAlignmentLeft


- (void)setupContent:(NSString*)content confirmButton:(SMButton*)confirmButton cancleButton:(SMButton*)cancleButton;

- (void)setupImage:(UIImage*)image content:(NSString*)content confirmButton:(SMButton*)confirmButton cancleButton:(SMButton*)cancleButton;

- (void)setupCustomView:(UIView*)view confirmButton:(SMButton*)confirmButton cancleButton:(SMButton*)cancleButton;

@end
