//
//  ljhtextFieldWithList.h
//  下拉列表
//
//  Created by mac on 17/2/28.
//  Copyright © 2017年 ES. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ljhtextFieldWithList : UITextField<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

- (instancetype)mytextFieldwithArr:(NSArray *)arr;

@end
