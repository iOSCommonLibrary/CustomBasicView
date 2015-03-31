//
//  ViewController.m
//  CircleProcessDemo
//
//  Created by myqiqiang on 15/3/30.
//  Copyright (c) 2015年 myqiqiang. All rights reserved.
//

#import "ViewController.h"
#import "CircleProcessView.h"

@interface ViewController ()
{
    CircleProcessView *_circle;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    _circle = [[CircleProcessView alloc]initWithFrame:CGRectMake(100, 200, 100, 100)];
    _circle.value = 0;
    [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(updateValue) userInfo:nil repeats:YES];
    [self.view addSubview:_circle];
}

-(void)updateValue
{
    _circle.value += 0.01;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
