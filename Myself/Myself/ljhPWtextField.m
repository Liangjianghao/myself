//
//  ljhPWtextField.m
//  下拉列表
//
//  Created by mac on 17/2/28.
//  Copyright © 2017年 ES. All rights reserved.
//

#import "ljhPWtextField.h"

@implementation ljhPWtextField

-(void)myPassWordtextField
{
    UIButton *rightImageV = [[UIButton alloc] init];
    self.secureTextEntry = YES;
//    [rightImageV setBackgroundImage:[UIImage imageNamed:@"me_invisible"] forState:UIControlStateNormal];
    rightImageV.backgroundColor=[UIColor redColor];
    rightImageV.frame = CGRectMake(0, 0, 23, 23);
    rightImageV.center = self.center;
    self.rightView = rightImageV;
    self.rightViewMode = UITextFieldViewModeAlways;
    [rightImageV addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    
    self.textColor = [UIColor blackColor] ;
    
    self.borderStyle = UITextBorderStyleNone;
    
    self.placeholder = nil;
    
}
-(void)btnClick:(UIButton *)btn{
    //解决明暗文切换后面空格的问题的两种方式
    //NSString* text = self.text;
    //self.text = @" ";
    //self.text = text;
    //[self becomeFirstResponder];
    [self resignFirstResponder];//取消第一响应者
    btn.selected = !btn.selected;
    if (!btn.selected) {
        self.font = [UIFont systemFontOfSize:16];
        [btn setBackgroundImage:[UIImage imageNamed:@"me_invisible"] forState:UIControlStateNormal];
        self.secureTextEntry = YES;
    }else{
        self.font = [UIFont systemFontOfSize:16];
        [btn setBackgroundImage:[UIImage imageNamed:@"me_visible"] forState:UIControlStateSelected];
        self.secureTextEntry = NO;
    }
    [self becomeFirstResponder];//放弃第一响应者
}
@end
