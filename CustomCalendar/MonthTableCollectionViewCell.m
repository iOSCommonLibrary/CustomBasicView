//
//  MonthTableViewCollectionViewCell.m
//  CalendarDemo
//
//  Created by myqiqiang on 14/12/1.
//  Copyright (c) 2014年 myqiqiang. All rights reserved.
//

#import "MonthTableCollectionViewCell.h"

@implementation MonthTableCollectionViewCell

-(MonthTableCollectionViewCell *)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self initSubViews];
    }
    return self;
}

-(void)initSubViews
{
    _btn_Day = [UIButton buttonWithType:UIButtonTypeSystem];
    _btn_Day.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [_btn_Day setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self addSubview:_btn_Day];
}

-(void)setDateModel:(DateModel *)dateModel
{
    _dateModel  =   dateModel;
    
    [_btn_Day setTitle:[NSString stringWithFormat:@"%ld",(long)_dateModel.day] forState:UIControlStateNormal];
    
    if (_dateModel.state == STATEPREVIOUDMONTH) {
        _btn_Day.layer.borderColor = [[UIColor grayColor]CGColor];
        self.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1];
    } else if (_dateModel.state == STATECURRENTMOTNH){
        _btn_Day.layer.borderColor = [[UIColor grayColor]CGColor];
        self.backgroundColor = [UIColor whiteColor];
    } else {
        self.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1];
    }
}

@end
