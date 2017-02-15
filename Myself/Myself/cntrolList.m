//
//  cntrolList.m
//  模块
//
//  Created by mac on 17/2/14.
//  Copyright © 2017年 self. All rights reserved.
//

#import "cntrolList.h"
#import "takePhotoViewController.h"
#import "ButtonViewController.h"
@interface cntrolList ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *dataArr;
}
@end

@implementation cntrolList

- (void)viewDidLoad {
    [super viewDidLoad];
    dataArr=[NSMutableArray arrayWithObjects:@"按钮",@"拍照",@"日期选择输入框",@"", nil];
    
    UITableView *myTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStylePlain];
    
    myTableView.delegate=self;
    myTableView.dataSource=self;
    [self.view addSubview:myTableView];
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
        //        cell=[[[NSBundle mainBundle]loadNibNamed:@"BottleCell" owner:self options:nil]firstObject];
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    }
    //    [cell setModel:dataArr[indexPath.row]];
    cell.textLabel.text=dataArr[indexPath.row];
    cell.textLabel.textAlignment=NSTextAlignmentCenter;
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    takePhotoViewController *takePhotoVC=[[takePhotoViewController alloc]init];
    
    ButtonViewController *buttonVC=[[ButtonViewController alloc]init];
    
    switch (indexPath.row) {
        case 0:
            [self.navigationController pushViewController:buttonVC animated:YES];
            
            break;
        case 1:
            [self.navigationController pushViewController:takePhotoVC animated:YES];
            
            break;
        case 2:
            [self.navigationController pushViewController:takePhotoVC animated:YES];
            
            break;
        case 3:
            [self.navigationController pushViewController:takePhotoVC animated:YES];
            
            break;
        case 4:
            [self.navigationController pushViewController:takePhotoVC animated:YES];
            
            break;
            
        default:
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
