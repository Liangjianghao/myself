//
//  ButtonViewController.m
//  模块
//
//  Created by mac on 17/2/15.
//  Copyright © 2017年 self. All rights reserved.
//

#import "ButtonViewController.h"
#import "ljhCheckbox.h"
#import "ljhSingleChooseBtn.h"
#import "ljhDatePickerBtn.h"
#import "ljhDatePickerTextField.h"

@interface ButtonViewController ()<UITextFieldDelegate>

@end

@implementation ButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self uiConfig];
}

-(void)uiConfig
{
    ljhSingleChooseBtn *selectBtn=[[ljhSingleChooseBtn alloc]init];
    [selectBtn setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [selectBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    NSArray *selectArr=[NSArray arrayWithObjects:@"单选一",@"单选二",@"单选三",@"单选四", nil];
    [selectBtn mybuttonwithArr:selectArr andTitle:@"请选择" andMessage:@"单选"];
    [selectBtn setFinishBlock:^(NSString *result) {
        
    }];
    selectBtn.frame=CGRectMake(50, 100, WIDTH-100, 40);
    [selectBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:selectBtn];
    
    
    
    ljhCheckbox *checkBox=[[ljhCheckbox alloc]init];
    [checkBox setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [checkBox setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    NSArray *checkArr=[NSArray arrayWithObjects:@"多选一",@"多选二",@"多选三",@"多选四", nil];
    [checkBox mybuttonwithArr:checkArr andTitle:@"请选择" andMessage:@"多选"];
    [checkBox setFinishBlock:^(NSString *result) {
        
    }];
    checkBox.frame=CGRectMake(50, 200, WIDTH-100, 40);
    [checkBox setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:checkBox];
    
    
    ljhDatePickerTextField *ljhTF=[[ljhDatePickerTextField alloc]init];
    [ljhTF mytextFieldWithTag];
    ljhTF.placeholder=@"时间选择输入框";
    ljhTF.frame=CGRectMake(50, 300, WIDTH-100, 40);
    ljhTF.keyboardType=UIKeyboardTypeNumberPad;
    ljhTF.borderStyle=UITextBorderStyleRoundedRect;
    ljhTF.delegate=self;
    
//    __weak typeof(self) weakSelf=self;
#pragma mark  block 重复引用
    
    __weak ljhDatePickerTextField *weakljhtf=ljhTF;
    
    [ljhTF setFinishBlock:^(NSString *result) {
        
        NSLog(@"result%@",result);
        
        weakljhtf.text=result;
    }];
    
    [self.view addSubview:ljhTF];
    
}

@end
