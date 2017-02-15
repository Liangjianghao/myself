//
//  takePhotoViewController.m
//  模块
//
//  Created by mac on 17/2/15.
//  Copyright © 2017年 self. All rights reserved.
//

#import "takePhotoViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <QuartzCore/QuartzCore.h>

#define kWidth ([UIScreen mainScreen].bounds.size.width)
#define kHeight ([UIScreen mainScreen].bounds.size.height)

#import "AVViewController.h"
@interface takePhotoViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

{
    UIImagePickerController *imagePickers;
    UIImageView *imgView;
}


@end

@implementation takePhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    NSArray *nameArr=[NSArray arrayWithObjects:@"图层拍照",@"自定义拍照",@"",@"", nil];
    for (int i=0; i<nameArr.count; i++) {
        
        UIButton *mybutton=[UIButton buttonWithType:UIButtonTypeCustom];
        mybutton.frame=CGRectMake(100, 100+100*i, 100, 40);
        mybutton.clipsToBounds=YES;
        mybutton.layer.cornerRadius=10;
        mybutton.tag=101+i;
        mybutton.backgroundColor=[UIColor grayColor];
        [mybutton setTitle:[NSString stringWithFormat:@"%@",nameArr[i]] forState:UIControlStateNormal];
        [mybutton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:mybutton];
    }
    


    
}
-(void)btnClick:(UIButton *)btn
{
    
    if (btn.tag==101) {
        imagePickers = [[UIImagePickerController alloc]init];
        imagePickers.delegate = self;
        imgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 30,WIDTH, HEIGHT)];
        imgView.image=[UIImage imageNamed:@"upperBodyPic"];
        [imagePickers.view addSubview:imgView];
        imagePickers.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:imagePickers animated:YES completion:nil];
        
        NSArray *segmentedArray = [[NSArray alloc]initWithObjects:@"半身照",@"正面照",@"身份证正",@"身份证反",nil];
        UISegmentedControl *segmentCtr=[[UISegmentedControl alloc]initWithItems:segmentedArray];
        segmentCtr.frame=CGRectMake(0, HEIGHT-120  , WIDTH, 40);
        [segmentCtr setSelectedSegmentIndex:0];
        [segmentCtr addTarget:self action:@selector(segChange:) forControlEvents:UIControlEventValueChanged];
        [imagePickers.view addSubview:segmentCtr];
    }
    else if (btn.tag==102){
        AVViewController *avVC=[[AVViewController alloc]init];
        [self.navigationController pushViewController:avVC animated:YES];
        
    
    }

}
-(void)segChange:(UISegmentedControl *)seg
{
    NSInteger index=seg.selectedSegmentIndex;
    
    switch (index) {
        case 0:
            imgView.image=[UIImage imageNamed:@"upperBodyPic"];
            
            break;
            
        case 1:
            imgView.image=[UIImage imageNamed:@"face_people_shape_white"];
            
            break;
            
        case 2:
            imgView.image=[UIImage imageNamed:@"frontCardPic"];
            
            break;
            
        case 3:
            imgView.image=[UIImage imageNamed:@"backCardPic"];
            
            break;
            
        default:
            break;
    }
}
@end
