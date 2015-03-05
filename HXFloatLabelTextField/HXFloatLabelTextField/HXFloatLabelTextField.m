//
//  HXFloatLabelTextField.m
//  JVFloatLabeledTextField
//
//  Created by 汪顺舟 on 3/5/15.
//  Copyright (c) 2015 Jared Verdi. All rights reserved.
//

#import "HXFloatLabelTextField.h"


#define UIColorFromRGBA(rgb,a) [UIColor colorWithRed:((float)((rgb & 0xFF0000) >> 16))/255.0 green:((float)((rgb & 0xFF00) >> 8))/255.0 blue:((float)(rgb & 0xFF))/255.0 alpha:a]
#define UIColorFromRGB(rgb) UIColorFromRGBA(rgb,1.0f)

@interface HXFloatLabelTextField ()
@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) CALayer *bottomLayer;
@end

@implementation HXFloatLabelTextField

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonSetup];
    }
    return self;
}

- (void)commonSetup{
    // UITextField高为44的时候，对应这两个值，其它的自行调整。
    self.leftImageTopMargin = 16;
    self.leftImageBottomMargin = 4;
    
    // 默认灰色和橙色
    self.bottomLineColorNormal = UIColorFromRGB(0xCCCCCC);
    self.bottomLineColorSelected = UIColorFromRGB(0xFF7143);
    
    // leftView默认51宽
    self.leftViewWidth = 51;
    
    self.floatingLabelActiveTextColor = self.bottomLineColorSelected;
    self.floatingLabelTextColor = [UIColor darkGrayColor];
    [self setTintColor:self.bottomLineColorSelected];

    self.bottomLayer = [CALayer layer];
    self.bottomLayer.name = @"Bottom-Line";
    self.bottomLayer.backgroundColor = self.bottomLineColorNormal.CGColor;
    self.bottomLayer.frame = CGRectMake(0, self.frame.size.height - 1, self.frame.size.width, 1);
    [self.layer insertSublayer:self.bottomLayer atIndex:0];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidBeginEditing:) name:UITextFieldTextDidBeginEditingNotification object:self];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidEndEditing:) name:UITextFieldTextDidEndEditingNotification object:self];
}


#pragma mark - Actions
- (void)setBottomLineColorNormal:(UIColor *)bottomLineColorNormal{
    if (_bottomLineColorNormal != bottomLineColorNormal) {
        _bottomLineColorNormal = bottomLineColorNormal;
    }
}

- (void)setBottomLineColorSelected:(UIColor *)bottomLineColorSelected{
    if (_bottomLineColorSelected != bottomLineColorSelected) {
        _bottomLineColorSelected = bottomLineColorSelected;
    }
}

- (void)setLeftImageNormal:(UIImage *)leftImageNormal{
    if (_leftImageNormal != leftImageNormal) {
        _leftImageNormal = leftImageNormal;
        if (!self.leftImageView) {
            [self setupLeftImageView];
            self.leftImageView.image = _leftImageNormal;
        }
    }
}

- (void)setLeftImageSelected:(UIImage *)leftImageSelected{
    if (_leftImageSelected != leftImageSelected) {
        _leftImageSelected = leftImageSelected;
        if (!self.leftImageView) {
            [self setupLeftImageView];
        }
    }
}


- (void)setupLeftImageView{
    UIImage *image = _leftImageNormal ? _leftImageNormal : _leftImageSelected;
//    CGFloat imageHeight = self.frame.size.height - self.leftImageBottomMargin - self.leftImageTopMargin;
    CGFloat imageHeight = self.frame.size.height;
    CGFloat imageWidth = (image.size.width * imageHeight) / image.size.height;
    self.leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, imageWidth, imageHeight)];
//    self.leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.leftImageTopMargin, imageWidth, imageHeight)];
    
    // 图片垂直居中
//    self.leftImageView = [[UIImageView alloc] initWithImage:image];
//    CGFloat imageViewTop = ( self.frame.size.height - self.leftImageView.frame.size.height ) / 2 ;
//    CGRect imageViewFrame = self.leftImageView.frame;
//    imageViewFrame.origin.y = imageViewTop;
//    self.leftImageView.frame = imageViewFrame;
    
    self.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.leftViewWidth, self.frame.size.height)];
    [self.leftView addSubview:self.leftImageView];
    self.leftViewMode = UITextFieldViewModeAlways;
}

#pragma mark - UITextField Notifications
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    CGRect frame = self.bottomLayer.frame;
    frame.size.height = 1.5;
    frame.origin.y -= 0.5;
    self.bottomLayer.frame = frame;
    self.bottomLayer.backgroundColor = [self.bottomLineColorSelected CGColor];
    
    
    if (self.leftImageSelected) {
        self.leftImageView.image = self.leftImageSelected;
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    CGRect frame = self.bottomLayer.frame;
    frame.size.height = 1;
    frame.origin.y += 0.5;
    self.bottomLayer.frame = frame;
    self.bottomLayer.backgroundColor = [self.bottomLineColorNormal CGColor];

    if (self.leftImageNormal) {
        self.leftImageView.image = self.leftImageNormal;
    }
}


@end
