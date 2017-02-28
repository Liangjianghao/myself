//
//  ljhDatePickerTextField.m
//  时间选择器
//
//  Created by mac on 17/2/13.
//  Copyright © 2017年 liang. All rights reserved.
//

#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define WIDTH [UIScreen mainScreen].bounds.size.width
#import "ljhDatePickerTextField.h"

@implementation ljhDatePickerTextField
{
    UIDatePicker *datePicker;

}

- (instancetype)mytextFieldWithTag
{
    UIToolbar * topView = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 30)];
    [topView setBarStyle:UIBarStyleDefault];
    UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIButton *cancleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancleBtn.frame = CGRectMake(4, 5, 40, 25);
    [cancleBtn setTitleColor:self.tintColor forState:UIControlStateNormal];
    [cancleBtn addTarget:self action:@selector(dismissKeyB:) forControlEvents:UIControlEventTouchUpInside];
    [cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
    cancleBtn.tag=101;
    UIBarButtonItem *cancelBarBtn = [[UIBarButtonItem alloc]initWithCustomView:cancleBtn];
//
//    
    UIButton *confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    confirmBtn.frame = CGRectMake(4, 5, 40, 25);
    [confirmBtn setTitleColor:self.tintColor forState:UIControlStateNormal];
    [confirmBtn addTarget:self action:@selector(dismissKeyB:) forControlEvents:UIControlEventTouchUpInside];
    [confirmBtn setTitle:@"完成" forState:UIControlStateNormal];
    confirmBtn.tag=201;
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc]initWithCustomView:confirmBtn];
    
    NSArray * buttonsArray = [NSArray arrayWithObjects:cancelBarBtn,btnSpace,doneBtn,nil];
//    NSArray * buttonsArray = [NSArray arrayWithObjects:btnSpace,doneBtn,nil];
    [topView setItems:buttonsArray];
    [self setInputAccessoryView:topView];
    
    datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, HEIGHT-216, 320, 216)];
    
    [datePicker setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"]];
    
    [datePicker setTimeZone:[NSTimeZone localTimeZone]];
    
    datePicker.backgroundColor=[UIColor whiteColor];
    
    [datePicker setDate:[NSDate date] animated:YES];

    [datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];

    [datePicker setDatePickerMode:UIDatePickerModeDate];
    
    
    
    self.inputView=datePicker;
    
    return self;
}
-(void)datePickerValueChanged:(UIDatePicker *)kdatePicker
{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    self.finishBlock([formatter stringFromDate:kdatePicker.date]);

}
-(void)dismissKeyB:(UIButton *)btn
{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    if (btn.tag==201) {
        self.finishBlock([formatter stringFromDate:datePicker.date]);
        self.text=[NSString stringWithFormat:@"%@",[formatter stringFromDate:datePicker.date]];
    }
    [self endEditing:YES];
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{

    
    
}
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
