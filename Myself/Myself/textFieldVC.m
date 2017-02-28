//
//  textFieldVC.m
//  Myself
//
//  Created by mac on 17/2/28.
//  Copyright © 2017年 self. All rights reserved.
//




#import "textFieldVC.h"
#import "ljhPWtextField.h"
#import "ljhtextFieldWithList.h"
#import "ljhDatePickerTextField.h"

@interface textFieldVC ()
{
    NSArray *dataArr;

}
@end

@implementation textFieldVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    UITapGestureRecognizer *dismissTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKey:)];
    
//    [self.view addGestureRecognizer:dismissTap];
    
    dataArr=@[@"1",@"2",@"3",@"4",@"5",@"6"];

            ljhPWtextField *tf1=[[ljhPWtextField alloc]init];
            tf1.frame=CGRectMake(50, 100, WIDTH-100, 40);
            tf1.backgroundColor=[UIColor lightGrayColor];
            [self.view addSubview:tf1];
            [tf1 myPassWordtextField];
    
    ljhtextFieldWithList *tf2=[[ljhtextFieldWithList alloc]init];
    tf2.frame=CGRectMake(50, 200, WIDTH-100, 40);
    [self.view addSubview:tf2];
    [tf2 mytextFieldwithArr:dataArr];
    
    ljhDatePickerTextField *tf3=[[ljhDatePickerTextField alloc]init];
    tf3.frame=CGRectMake(50, 300, WIDTH-100, 40);
    tf3.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:tf3];
    [tf3 mytextFieldWithTag];
    [tf3 setFinishBlock:^(NSString *result) {
       
        NSLog(@"%@result",result);
    }];
}

-(void)dismissKey:(UITapGestureRecognizer *)tap
{
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
#pragma mark 调出键盘时 视图上移
-(void)keyboardWillShow {
    // Animate the current view out of the way
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

-(void)keyboardWillHide {
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}


//method to move the view up/down whenever the keyboard is shown/dismissed
-(void)setViewMovedUp:(BOOL)movedUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    
    CGRect rect = self.view.frame;
    if (movedUp)
    {
        // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
        // 2. increase the size of the view so that the area behind the keyboard is covered up.
        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
        rect.size.height += kOFFSET_FOR_KEYBOARD;
    }
    else
    {
        // revert back to the normal state.
        rect.origin.y += kOFFSET_FOR_KEYBOARD;
        rect.size.height -= kOFFSET_FOR_KEYBOARD;
    }
    self.view.frame = rect;
    
    [UIView commitAnimations];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    // unregister for keyboard notifications while not visible.
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}
*/
@end
