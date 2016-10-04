//
//  HYHomeViewController.m
//  HYApp_base
//
//  Created by work on 16/9/18.
//  Copyright © 2016年 Hyyy. All rights reserved.
//

#import "HYHomeViewController.h"
#import "HYAdvertisingPageViewController.h"
#import "HYFileHelper.h"

@interface HYHomeViewController ()

@end

@implementation HYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"首页";
    
    [self testFileHelper];
    // 监听广告相关
    [self listenAdNotification];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:DISPATCH_AD_PAGE object:nil];
}

- (void)testFileHelper {
    // 遍历Library目录
    NSArray *libraryArr = [HYFileHelper listFilesInLibraryDirectoryByDeep:NO];
    NSLog(@"Library目录: %@", libraryArr);
}

#pragma mark - 监听广告相关
- (void)listenAdNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushAdViewController) name:DISPATCH_AD_PAGE object:nil];
}

/**
 跳转到广告页面
 */
- (void)pushAdViewController {
    HYAdvertisingPageViewController *adVC = [[HYAdvertisingPageViewController alloc] init];
    [self.navigationController pushViewController:adVC animated:YES];
}

@end
