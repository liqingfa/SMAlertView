//
//  SMButton.m
//  AlertDemo
//
//  Created by 李清发 on 2017/7/20.
//  Copyright © 2017年 李清发. All rights reserved.
//

#import "SMButton.h"
#import "SMAlert.h"

@interface SMButton()
@property (strong, nonatomic) SMAlertButtonClickAction action;
@end

@implementation SMButton

+ (instancetype)initWithTitle:(NSString*)title clickAction:(SMAlertButtonClickAction)action {
    SMButton *button = [SMButton new];
    [button setTitle:title forState:UIControlStateNormal];
    [button setAction:action];
    [button addTarget:button action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    return button;
}
- (void)buttonClick {
    if (self.action) {
        self.action();
    }else{
        [SMAlert hide];
    }
}

@end
