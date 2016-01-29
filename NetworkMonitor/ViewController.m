//
//  ViewController.m
//  NetworkMonitor
//
//  Created by dangxy on 16/1/29.
//  Copyright © 2016年 xproinfo.com. All rights reserved.
//

#import "ViewController.h"
#import "CoreStatus.h"
#import "CALayer+Transition.h"

@interface ViewController ()<CoreStatusProtocol>

@property (strong, nonatomic) UILabel *showLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"网络监测";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    /** 开始网络监听 */
    [CoreStatus beginNotiNetwork:self];

    
    self.showLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 200, self.view.frame.size.width-40, 100)];
    self.showLabel.backgroundColor = [UIColor whiteColor];
    self.showLabel.textColor = [UIColor blackColor];
    self.showLabel.font = [UIFont boldSystemFontOfSize:30];
    self.showLabel.textAlignment = NSTextAlignmentCenter;
    
    /** 获取当前网络状态：字符串 */
    NSString * statusString = [CoreStatus currentNetWorkStatusString];
    self.showLabel.text = statusString;

    [self.view addSubview:self.showLabel];
    
}


#pragma mark - CoreStatusProtocol

/** 网络状态变更 */
-(void)coreNetworkChangeNoti:(NSNotification *)noti;
{
    NSString * statusString = [CoreStatus currentNetWorkStatusString];
    
    NSLog(@"%@\n\n\n\n=========================\n\n\n\n%@",noti,statusString);
    
    [self showText];

}

/**  监测结果 */
-(void)showText{
    
    /** 获取当前网络状态：字符串 */
    NSString * statusString = [CoreStatus currentNetWorkStatusString];
    self.showLabel.text = statusString;
    
    /**  转场动画 */
    [self.showLabel.layer transitionWithAnimType:TransitionAnimTypeRamdom subType:TransitionSubtypesFromRamdom curve:TransitionCurveRamdom duration:.5f];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    /** 获取当前网络状态：字符串 */
    NSString * statusString = [CoreStatus currentNetWorkStatusString];
    NSLog(@"%@",statusString);
}





@end
