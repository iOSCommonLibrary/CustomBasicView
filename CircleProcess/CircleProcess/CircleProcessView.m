//
//  CircleProcessView.m
//  CircleProcessDemo
//
//  Created by myqiqiang on 15/3/30.
//  Copyright (c) 2015年 myqiqiang. All rights reserved.
//

#import "CircleProcessView.h"

#define radians(x) (x * M_PI / 180)

@implementation CircleProcessView
{
    UILabel     *_labValue;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self != nil) {
        
        CGRect labFrame = CGRectMake(_ringWidth,_ringWidth,CGRectGetWidth(frame)-2*_ringWidth,CGRectGetWidth(frame)-2*_ringWidth);
        _labValue = [[UILabel alloc]initWithFrame:labFrame];
        _labValue.backgroundColor = [UIColor clearColor];
        _labValue.textColor = [UIColor colorWithRed:169/255.0 green:202/255.0 blue:221/255.0 alpha:1];
        _labValue.textAlignment = NSTextAlignmentCenter;
        _labValue.font = [UIFont systemFontOfSize:25];
        [self addSubview:_labValue];
        [self setDefaultValue];
    }
    
    
    return self;
}

-(void)setDefaultValue
{
    _ringWidth = 5;
    self.backgroundColor = [UIColor clearColor];
}

#pragma mark - Setter

-(void)setValue:(CGFloat)value
{
    _value = value;
    NSString *change = @"%";
    _labValue.text = [NSString stringWithFormat:@"%.0f%@",_value*100,change];
    [self setNeedsDisplay];
}
- (void)drawRect:(CGRect)rect {
    
    CGContextRef context  =  UIGraphicsGetCurrentContext();
    
//    CGRect newRect = CGRectMake(CGRectGetMinX(rect)+_ringWidth, CGRectGetMinY(rect)+_ringWidth, CGRectGetWidth(rect)-2*_ringWidth, CGRectGetHeight(rect)-2*_ringWidth);
    
    CGContextSetLineWidth(context, _ringWidth);

    
    //  正圆
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextAddArc(context, CGRectGetMidX(rect), CGRectGetMidY(rect), CGRectGetWidth(rect)/2-_ringWidth,radians(-90), radians(270), 0);
    CGContextStrokePath(context);

    //  走过的圆弧
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextAddArc(context, CGRectGetMidX(rect), CGRectGetMidY(rect), CGRectGetWidth(rect)/2-_ringWidth,radians(-90), radians((-90+_value*360)), 0);

    CGContextStrokePath(context);
}


@end
