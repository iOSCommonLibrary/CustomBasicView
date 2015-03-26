//
//  ViewController.m
//  CustomSlider
//
//  Created by myqiqiang on 15/3/25.
//  Copyright (c) 2015年 myqiqiang. All rights reserved.
//

#import "ViewController.h"
#import "CustomSlider.h"

@interface ViewController ()<CustomSliderDelegate>

@property CustomSlider *customSlider;
@property (weak, nonatomic) IBOutlet UILabel *labSlider;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.customSlider = [[CustomSlider alloc]initWithFrame:CGRectMake(100, 100, 200, 30)];
    //self.customSlider.backgroundColor = [UIColor greenColor];
    self.customSlider.valueColor = [UIColor redColor];
    self.customSlider.value = 0.5;
    self.customSlider.delegate = self;
    [self.view addSubview:self.customSlider];
    
}

-(void)didValueChangeInslider:(CustomSlider *)slider WithOldValue:(CGFloat)oldValue
{
    self.labSlider.text = [NSString stringWithFormat:@"%f",slider.value];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
