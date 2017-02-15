//
//  DatePickerBtn.m
//  baishiTest
//
//  Created by mac on 17/2/10.
//  Copyright © 2017年 ljh. All rights reserved.
//

#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define WIDTH [UIScreen mainScreen].bounds.size.width
#import "ljhDatePickerBtn.h"

@implementation ljhDatePickerBtn
{
    NSString *choice;
    UIDatePicker *datePicker;
}
- (instancetype)mybuttonwithArr:(NSArray *)arr andTitle:(NSString *)title andMessage:(NSString *)message
{
    self.baseArr=arr;
    _alertTitle=title;
    _alertMessage=message;

    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showDatePicker:)];
    [self addGestureRecognizer:tap];
    
    UITapGestureRecognizer *disMisstap=[[UITapGestureRecognizer alloc]initWithTarget:self.superview action:@selector(disMiss:)];
    [[self getCurrentViewController:self].view addGestureRecognizer:disMisstap];
    self.superview.backgroundColor=[UIColor redColor];
    
    NSLog(@"superview%@",self.superview);
    return self;
}
-(void)disMiss:(UITapGestureRecognizer *)tap
{
    if (datePicker) {
        
        [datePicker removeFromSuperview];
    }
}
-(void)showDatePicker:(UITapGestureRecognizer *)tap
{
    datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, HEIGHT-216, 320, 216)];
    
    [datePicker setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"]];
    // 设置时区
    [datePicker setTimeZone:[NSTimeZone localTimeZone]];
    
    datePicker.backgroundColor=[UIColor whiteColor];
    
    // 设置当前显示时间
    [datePicker setDate:[NSDate date] animated:YES];
    // 设置显示最大时间（此处为当前时间）
//    [datePicker setMaximumDate:[NSDate date]];
    // 设置UIDatePicker的显示模式
    [datePicker setDatePickerMode:UIDatePickerModeDate];
    // 当值发生改变的时候调用的方法
    [datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [[self getCurrentViewController:self].view addSubview:datePicker];
    
//    [dateView addTarget:self  action:@selector(hideDateView) forControlEvents:UIControlEventTouchUpInside];
//    dateView.hidden = YES;
}
-(void)datePickerValueChanged:(UIDatePicker *)mydatePicker
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    [self setTitle:[formatter stringFromDate:mydatePicker.date] forState:UIControlStateNormal];
    choice=[formatter stringFromDate:mydatePicker.date];

    self.finishBlock(choice);

}
#pragma mark - 获取当前view的viewcontroller
- (UIViewController *)getCurrentViewController:(UIView *) currentView
{
    for (UIView* next = [currentView superview]; next; next = next.superview)
    {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

@end
