//
//  ViewListVC.m
//  Myself
//
//  Created by mac on 17/2/22.
//  Copyright © 2017年 self. All rights reserved.
//

#import "ViewListVC.h"

@interface ViewListVC ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *dataArr;
}
@end

@implementation ViewListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dataArr=@[@"ios+html",@"ios+luaview",@"",@""];
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
            urlString= [NSString stringWithFormat:@"ios+html://"];
            break;
        case 1:
            urlString= [NSString stringWithFormat:@"ios+luaview://"];
            
            break;
        case 2:
            urlString= [NSString stringWithFormat:@"backlocation://"];
            break;
        case 3:
            urlString= [NSString stringWithFormat:@"voiceR://"];
            
            break;
            
        default:
            break;
    }
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
