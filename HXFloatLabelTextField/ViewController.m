//
//  ViewController.m
//  HXFloatLabelTextField
//
//  Created by 汪顺舟 on 3/5/15.
//  Copyright (c) 2015 HXQC. All rights reserved.
//

#import "ViewController.h"
#import "HXFloatLabelTextField.h"

const static CGFloat kFieldHeight = 44;
const static CGFloat kFieldHMargin = 10.0f;

const static CGFloat kFieldFontSize = 16.0f;

const static CGFloat kFieldFloatingLabelFontSize = 11.0f;


@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    HXFloatLabelTextField *textField = [[HXFloatLabelTextField alloc] initWithFrame:CGRectMake(kFieldHMargin,
                                                                                               50,
                                                                                               self.view.frame.size.width - 2 * kFieldHMargin,
                                                                                               kFieldHeight)];
    textField.attributedPlaceholder =
    [[NSAttributedString alloc] initWithString:NSLocalizedString(@"用户名", @"")
                                    attributes:@{NSForegroundColorAttributeName: [UIColor darkGrayColor]}];
    textField.font = [UIFont systemFontOfSize:kFieldFontSize];
    textField.floatingLabel.font = [UIFont boldSystemFontOfSize:kFieldFloatingLabelFontSize];
    //    textField.floatingLabelTextColor = floatingLabelColor;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.delegate = self;
    textField.leftImageNormal = [UIImage imageNamed:@"LoginIputIconNormal"];
    textField.leftImageSelected = [UIImage imageNamed:@"LoginIputIconFocused"];
    [self.view addSubview:textField];
    
    
    HXFloatLabelTextField *textField1 = [[HXFloatLabelTextField alloc] initWithFrame:CGRectMake(kFieldHMargin,
                                                                                                textField.frame.origin.y+textField.frame.size.height+kFieldHMargin,
                                                                                                self.view.frame.size.width - 2 * kFieldHMargin,
                                                                                                kFieldHeight)];
    textField1.attributedPlaceholder =
    [[NSAttributedString alloc] initWithString:NSLocalizedString(@"密码", @"")
                                    attributes:@{NSForegroundColorAttributeName: [UIColor darkGrayColor]}];
    textField1.font = [UIFont systemFontOfSize:kFieldFontSize];
    textField1.floatingLabel.font = [UIFont boldSystemFontOfSize:kFieldFloatingLabelFontSize];
    //    textField.floatingLabelTextColor = floatingLabelColor;
    textField1.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField1.delegate = self;
    //    textField1.leftImageNormal = [UIImage imageNamed:@"LoginIputIconNormal"];
    //    textField1.leftImageSelected = [UIImage imageNamed:@"LoginIputIconFocused"];
    [self.view addSubview:textField1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"textFieldDidBeginEditing");
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    NSLog(@"textFieldShouldEndEditing");
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = touches.anyObject;
    if (![touch.view isMemberOfClass:[UITextField class]]) {
        [self.view endEditing:YES];
    }
}
@end
