//
//  SMButton.h
//  AlertDemo
//
//  Created by 李清发 on 2017/7/20.
//  Copyright © 2017年 李清发. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SMButtonClickAction)(void);

@interface SMButton : UIButton

+ (instancetype)initWithTitle:(NSString*)title clickAction:(SMButtonClickAction)action;

@end
