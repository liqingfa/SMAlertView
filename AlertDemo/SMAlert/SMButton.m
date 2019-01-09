//
//  SMButton.m
//  AlertDemo
//
//  Created by 李清发 on 2017/7/20.
//  Copyright © 2017年 李清发. All rights reserved.
//

#import "SMButton.h"
@interface SMButton()
@property (strong, nonatomic) SMButtonClickAction action;
@end

@implementation SMButton

+ (instancetype)initWithTitle:(NSString*)title clickAction:(SMButtonClickAction)action {
    SMButton *button = [SMButton new];
    [button setTitle:title forState:UIControlStateNormal];
    [button setAction:action];
    [button addTarget:button action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    return button;
}
- (void)buttonClick {
    if (self.action) self.action();
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [NSClassFromString(@"SMAlert") performSelector:NSSelectorFromString(@"hide")];
#pragma clang diagnostic pop
}

@end
