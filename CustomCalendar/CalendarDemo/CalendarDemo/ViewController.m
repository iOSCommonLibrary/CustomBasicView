//
//  ViewController.m
//  CalendarDemo
//
//  Created by myqiqiang on 14/12/1.
//  Copyright (c) 2014年 myqiqiang. All rights reserved.
//

#import "ViewController.h"
#import "CustomCalenderView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CustomCalenderView *cal = [[CustomCalenderView alloc]initWithFrame:self.view.frame];
    cal.backgroundColor = [UIColor grayColor];
    [self.view addSubview:cal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
