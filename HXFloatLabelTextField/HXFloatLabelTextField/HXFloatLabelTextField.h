//
//  HXFloatLabelTextField.h
//  JVFloatLabeledTextField
//
//  Created by 汪顺舟 on 3/5/15.
//  Copyright (c) 2015 Jared Verdi. All rights reserved.
//

#import "JVFloatLabeledTextField.h"

@interface HXFloatLabelTextField : JVFloatLabeledTextField
/**
 *  默认图标
 */
@property(nonatomic, strong) UIImage *leftImageNormal;

/**
 *  选中后图标
 */
@property(nonatomic, strong) UIImage *leftImageSelected;

/**
 *  默认下划线颜色
 */
@property(nonatomic, strong) UIColor *bottomLineColorNormal;

/**
 *  选中后下划线颜色
 */
@property(nonatomic, strong) UIColor *bottomLineColorSelected;


/**
 *  左边视图总宽（包括图与文本框的间距）
 */
@property(nonatomic, assign) CGFloat leftViewWidth;


/**
 *  图标与顶部间隙
 */
@property(nonatomic, assign) CGFloat leftImageTopMargin;

/**
 *  图标与底部间隙
 */
@property(nonatomic, assign) CGFloat leftImageBottomMargin;
@end
