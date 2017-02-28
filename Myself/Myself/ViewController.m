//
//  ViewController.m
//  模块
//
//  Created by mac on 17/2/14.
//  Copyright © 2017年 self. All rights reserved.
//

#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define WIDTH [UIScreen mainScreen].bounds.size.width

#import "ViewController.h"

#import <FBShimmering.h>
#import <FBShimmeringView.h>

#import "mycell.h"

#import "cntrolList.h"
#import "FunctionViewController.h"
#import "ViewListVC.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *dataArr;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dataArr=[[NSMutableArray alloc]init];
    dataArr=[NSMutableArray arrayWithObjects:@"控件",@"功能",@"视图",@"特效要长一点才有效果",@"备忘录",@"知识点", nil];
    UITableView *myTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStylePlain];
    myTableView.delegate=self;
    myTableView.dataSource=self;
    myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:myTableView];
    
    //    self.navigationController.navigationBar.translucent = YES;
    
    //    if([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]){
    //        self.automaticallyAdjustsScrollViewInsets = NO;
    //    }
}
#pragma mark--tableview delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID=@"cellID";
    mycell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell=[[mycell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    }
    if (indexPath.row==3) {
        FBShimmeringView *contentView = [[FBShimmeringView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 80)];
        contentView.shimmering = YES;
        contentView.shimmeringOpacity = 0;
        contentView.shimmeringBeginFadeDuration = 0.3;
        contentView.shimmeringEndFadeDuration = 2;
        contentView.shimmeringAnimationOpacity = 0.6;
        [self.view addSubview:contentView];
        
        UILabel *textLabel = [[UILabel alloc] initWithFrame:contentView.bounds];
        textLabel.text = dataArr[indexPath.row];
        textLabel.textColor = [UIColor blackColor];
        textLabel.textAlignment = NSTextAlignmentCenter;
        textLabel.backgroundColor = [UIColor whiteColor];
        cell.textLabel.textAlignment=NSTextAlignmentCenter;
        contentView.contentView=textLabel;
        [cell addSubview:contentView];
    }
    
    else{
        
        cell.textLabel.text=dataArr[indexPath.row];
        cell.textLabel.textAlignment=NSTextAlignmentCenter;
        
    }
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        cntrolList *controlVC=[[cntrolList alloc]init];
        FunctionViewController *functionVC=[[FunctionViewController alloc]init];
        ViewListVC *viewLVC=[[ViewListVC alloc]init];
    
    
    
    switch (indexPath.row) {
        case 0:
            [self.navigationController pushViewController:controlVC animated:YES];
            
            break;
        case 1:
            [self.navigationController pushViewController:functionVC animated:YES];
            
            break;
        case 2:
            [self.navigationController pushViewController:viewLVC animated:YES];
            //
            //            break;
            //        case 3:
            //            [self.navigationController pushViewController:controlVC animated:YES];
            //
            //            break;
            //        case 4:
            //            [self.navigationController pushViewController:controlVC animated:YES];
            //
            //            break;
            
        default:
            break;
    }
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
