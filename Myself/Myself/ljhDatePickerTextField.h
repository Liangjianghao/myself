//
//  ljhDatePickerTextField.h
//  时间选择器
//
//  Created by mac on 17/2/13.
//  Copyright © 2017年 liang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ljhDatePickerTextField : UITextField

@property (copy,nonatomic)void(^finishBlock)(NSString *resultStr);
- (instancetype)mytextFieldWithTag;
@end
