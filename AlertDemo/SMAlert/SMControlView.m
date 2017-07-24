//
//  SMContentView.m
//  AlertDemo
//
//  Created by 李清发 on 2017/7/19.
//  Copyright © 2017年 李清发. All rights reserved.
//

#import "SMControlView.h"

static const CGFloat SMControlViewWidth = 300.0f;
static const CGFloat SMControlViewButtonHeight = 45.0f;
static const CGFloat SMControlViewCornerRadius = 4.0f;
static const CGFloat SMControlViewVerticalSpacing = 15.0f;
static const CGFloat SMControlViewHorizontalSpacing = 15.0f;

@interface SMControlView(){
    CGFloat screenWidth;
    CGFloat screenHeight;
}
@end

@implementation SMControlView
-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        screenWidth = [[UIScreen mainScreen] bounds].size.width;
        screenHeight = [[UIScreen mainScreen] bounds].size.height;
    }
    return self;
}

-(void)setupContent:(NSString*)content confirmButton:(SMButton*)confirmButton cancleButton:(SMButton*)cancleButton{
    
    CGFloat textHeight = [self contentHeight:content];
    
    UILabel *contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(SMControlViewVerticalSpacing,
                                                                     SMControlViewHorizontalSpacing,
                                                                     SMControlViewWidth-SMControlViewVerticalSpacing*2,
                                                                     textHeight)];
    contentLabel.numberOfLines = 0;
    contentLabel.attributedText = [[NSAttributedString alloc]initWithString:content
                                                                 attributes:@{NSFontAttributeName: self.contentFont,
                                                                              NSForegroundColorAttributeName:self.contentTextColor,
                                                                              NSParagraphStyleAttributeName:[self paragraphStyle]}];
    
    if (confirmButton) {
        self.frame = CGRectMake((screenWidth - SMControlViewWidth)/2,
                                (screenHeight-textHeight-SMControlViewHorizontalSpacing*2-SMControlViewButtonHeight-0.5)/2,
                                SMControlViewWidth,
                                textHeight+SMControlViewHorizontalSpacing*2+SMControlViewButtonHeight+0.5);
        
        UIView *horizontalLineView = [[UIView alloc]initWithFrame:CGRectMake(0, textHeight+SMControlViewHorizontalSpacing*2, SMControlViewWidth, 0.5)];
        
        [horizontalLineView setBackgroundColor:[UIColor colorWithRed:131/255.0 green:146/255.0 blue:165/255.0 alpha:0.5]];
        
        [self addSubview:horizontalLineView];
        if (cancleButton) {
            cancleButton.frame = CGRectMake(0, textHeight+SMControlViewHorizontalSpacing*2+0.5, SMControlViewWidth/2, SMControlViewButtonHeight);
            [self addSubview:confirmButton];
            confirmButton.frame = CGRectMake(SMControlViewWidth/2, textHeight+SMControlViewHorizontalSpacing*2+0.5, SMControlViewWidth/2, SMControlViewButtonHeight);
            [self addSubview:cancleButton];
            UIView *verticalLineView = [[UIView alloc]initWithFrame:CGRectMake(SMControlViewWidth/2-0.25, textHeight+SMControlViewHorizontalSpacing*2+0.5, 0.5, SMControlViewButtonHeight)];
            [verticalLineView setBackgroundColor:[UIColor colorWithRed:131/255.0 green:146/255.0 blue:165/255.0 alpha:0.5]];
            [self addSubview:verticalLineView];
        }else{
            confirmButton.frame = CGRectMake(0, textHeight+SMControlViewHorizontalSpacing*2+0.5, SMControlViewWidth, SMControlViewButtonHeight);
            [self addSubview:confirmButton];
        }
    }else{
        self.frame = CGRectMake((screenWidth - SMControlViewWidth)/2,
                                (screenHeight-textHeight-SMControlViewHorizontalSpacing*2-SMControlViewButtonHeight)/2,
                                SMControlViewWidth,
                                textHeight+SMControlViewHorizontalSpacing*2);
    }
    
    [self addSubview:contentLabel];
    self.layer.cornerRadius = SMControlViewCornerRadius;
    self.layer.masksToBounds = YES;
}

-(void)setupImage:(UIImage*)image content:(NSString*)content confirmButton:(SMButton*)confirmButton cancleButton:(SMButton*)cancleButton {
    if (!image) {
        [self setupContent:content confirmButton:confirmButton cancleButton:cancleButton];
        return;
    }
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((SMControlViewWidth-100)/2, SMControlViewHorizontalSpacing, 100, 90)];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [imageView setImage:image];
    
    CGFloat textHeight = [self contentHeight:content];
    UILabel *contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(SMControlViewVerticalSpacing,
                                                                     SMControlViewHorizontalSpacing*2+90,
                                                                     SMControlViewWidth-SMControlViewVerticalSpacing*2,
                                                                     textHeight)];
    contentLabel.numberOfLines = 0;
    
    contentLabel.attributedText = [[NSAttributedString alloc]initWithString:content
                                                                 attributes:@{NSFontAttributeName: self.contentFont,
                                                                              NSForegroundColorAttributeName:self.contentTextColor,
                                                                              NSParagraphStyleAttributeName:[self paragraphStyle]}];
    contentLabel.textAlignment = NSTextAlignmentCenter;
    
    if (confirmButton) {
        self.frame = CGRectMake((screenWidth - SMControlViewWidth)/2,
                                (screenHeight-90-textHeight-SMControlViewHorizontalSpacing*3-SMControlViewButtonHeight-0.5)/2,
                                SMControlViewWidth,
                                textHeight+90+SMControlViewHorizontalSpacing*3+SMControlViewButtonHeight+0.5);
        
        UIView *horizontalLineView = [[UIView alloc]initWithFrame:CGRectMake(0, textHeight+SMControlViewHorizontalSpacing*3+90, SMControlViewWidth, 0.5)];
        
        [horizontalLineView setBackgroundColor:[UIColor colorWithRed:131/255.0 green:146/255.0 blue:165/255.0 alpha:0.5]];
        
        [self addSubview:horizontalLineView];
        if (cancleButton) {
            cancleButton.frame = CGRectMake(0, 90+textHeight+SMControlViewHorizontalSpacing*3+0.5, SMControlViewWidth/2, SMControlViewButtonHeight);
            [self addSubview:confirmButton];
            confirmButton.frame = CGRectMake(SMControlViewWidth/2, 90+textHeight+SMControlViewHorizontalSpacing*3+0.5, SMControlViewWidth/2, SMControlViewButtonHeight);
            [self addSubview:cancleButton];
            UIView *verticalLineView = [[UIView alloc]initWithFrame:CGRectMake(SMControlViewWidth/2-0.25, 90+textHeight+SMControlViewHorizontalSpacing*3+0.5, 0.5, SMControlViewButtonHeight)];
            [verticalLineView setBackgroundColor:[UIColor colorWithRed:131/255.0 green:146/255.0 blue:165/255.0 alpha:0.5]];
            [self addSubview:verticalLineView];
        }else{
            confirmButton.frame = CGRectMake(0, 90+textHeight+SMControlViewHorizontalSpacing*3+0.5, SMControlViewWidth, SMControlViewButtonHeight);
            [self addSubview:confirmButton];
        }
    }else{
        self.frame = CGRectMake((screenWidth - SMControlViewWidth)/2,
                                (screenHeight-textHeight-SMControlViewHorizontalSpacing*2-SMControlViewButtonHeight)/2,
                                SMControlViewWidth,
                                90+textHeight+SMControlViewHorizontalSpacing*3);
    }
    [self addSubview:imageView];
    [self addSubview:contentLabel];
    self.layer.cornerRadius = SMControlViewCornerRadius;
    self.layer.masksToBounds = YES;
}

-(CGFloat)contentHeight:(NSString*)content {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    [paragraphStyle setLineSpacing:self.lineSpace];
    return [content boundingRectWithSize:CGSizeMake(SMControlViewWidth-20, MAXFLOAT)
                          options:NSStringDrawingUsesLineFragmentOrigin
                              attributes:@{NSFontAttributeName: self.contentFont,NSParagraphStyleAttributeName:paragraphStyle}
                          context:nil].size.height;
}

-(NSMutableParagraphStyle*)paragraphStyle{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    [paragraphStyle setLineSpacing:self.lineSpace];
    return paragraphStyle;
}

@end
