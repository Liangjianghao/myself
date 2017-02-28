//
//  FunctionViewController.m
//  Myself
//
//  Created by mac on 17/2/22.
//  Copyright © 2017年 self. All rights reserved.
//

#import "FunctionViewController.h"

@interface FunctionViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *dataArr;
}
@end

@implementation FunctionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dataArr=@[@"人脸识别",@"语音识别",@"后台持续定位",@"地图",@"百度鹰眼",@"FMDB封装",@"ibeacon",@""];
    
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
        
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    }
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

    NSString *urlString;
    
    
    
    switch (indexPath.row) {
        case 0:
            urlString= [NSString stringWithFormat:@"faceR://"];
            break;
        case 1:
            urlString= [NSString stringWithFormat:@"voiceR://"];
            
            break;
        case 2:
            urlString= [NSString stringWithFormat:@"backlocation://"];
            break;
        case 3:
            urlString= [NSString stringWithFormat:@"voiceR://"];
            
            break;
        case 4:
            urlString= [NSString stringWithFormat:@"yingyan://"];
            break;
        case 5:
            urlString= [NSString stringWithFormat:@"voiceR://"];
            
            break;
        case 6:
            urlString= [NSString stringWithFormat:@"faceR://"];
            break;
        case 7:
            urlString= [NSString stringWithFormat:@"voiceR://"];
            
            break;

            
        default:
            break;
    }
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];

}


@end
