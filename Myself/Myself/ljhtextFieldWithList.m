//
//  ljhtextFieldWithList.m
//  下拉列表
//
//  Created by mac on 17/2/28.
//  Copyright © 2017年 ES. All rights reserved.
//

#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define WIDTH [UIScreen mainScreen].bounds.size.width

#import "ljhtextFieldWithList.h"

@implementation ljhtextFieldWithList
{
    NSArray *dataArr;
    UITableView *myTableView;
    UIView *bgView;
    
}
- (instancetype)mytextFieldwithArr:(NSArray *)arr
{
    dataArr=arr;
    self.delegate=self;
    UIView *line=[[UIView alloc]initWithFrame:CGRectMake(0,self.frame.size.height-2, self.frame.size.width, 1)];
    line.backgroundColor=[UIColor lightGrayColor];
    
    self.borderStyle=UITextBorderStyleNone;
    //    self.backgroundColor=[UIColor blackColor];
    [self addSubview:line];
    self.textAlignment=NSTextAlignmentCenter;
    
//    UITapGestureRecognizer *dismissTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKey:)];
//        [[self getCurrentViewController:self].view addGestureRecognizer:dismissTap];
    return self;
}
-(void)dismissKey:(UITapGestureRecognizer *)tap
{
    [[self getCurrentViewController:self].view endEditing:YES];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [self showListV];
    return NO;
}
-(void)showListV
{
    
    if (bgView) {
        return;
    }
    else{
        myTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 200) style:UITableViewStylePlain];
        myTableView.delegate=self;
        myTableView.dataSource=self;
        myTableView.backgroundColor=[UIColor whiteColor];
        if ([myTableView respondsToSelector:@selector(setSeparatorInset:)]) {
            
            [myTableView setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
            
        }
        
        bgView=[[UIView alloc]initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y+40, self.frame.size.width, 200)];
        bgView.backgroundColor=[UIColor whiteColor];
        bgView.layer.shadowOffset = CGSizeMake(1, 1);
        bgView.layer.shadowRadius = 5.0;
        bgView.layer.shadowColor = [UIColor blackColor].CGColor;
        bgView.layer.shadowOpacity = 0.8;
        bgView.layer.cornerRadius=5;
        
        [bgView addSubview:myTableView];
        [[self getCurrentViewController:self].view addSubview:bgView];
        
    }
}
#pragma mark--tableview delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID=@"cellID";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    }
    cell.textLabel.text=dataArr[indexPath.row];
    cell.textLabel.textAlignment=NSTextAlignmentCenter;
    cell.selectionStyle =NO;

    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.text=dataArr[indexPath.row];
    //    [bgView removeFromSuperview];
    
    [bgView removeFromSuperview];
    bgView=nil;
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
