//
//  CustomSlider.m
//  CustomSlider
//
//  Created by myqiqiang on 15/3/25.
//  Copyright (c) 2015年 myqiqiang. All rights reserved.
//

#import "CustomSlider.h"

@interface CustomSlider ()


/**
 *  设置圆圈大小
 */
@property (nonatomic) CGRect    trackFrame;
@end

@implementation CustomSlider
{
    
    /**
     *  slider有效宽度,rect.size.width - rect.size.height
     */
    CGFloat     _validWiddth;
    /**
     * 两边圆弧半径
     */
    CGFloat     _cornerRadius;
    /**
     *  左边实际划过的宽度，value * validWiddth + cornerRadius
     */
    CGFloat     _actualWiddth;

    /**
     *  是否在滑动
     */
    BOOL        _slderBegin;
    /**
     *  开始拖动时滑块圆心X
     */
    CGFloat     _startTrackCenterX;
    /**
     *  开始拖动时滑块值
     */
    CGFloat     _startTrackValue;
    /**
     *  开始拖动时滑块frame
     */
    CGRect      _startTrackFrame;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self != nil) {
        [self setDefalutValues];
        
        self.layer.masksToBounds = YES;

        
    }
    
    return self;
}

-(void)setDefalutValues
{
    _validWiddth = CGRectGetWidth(self.frame)-CGRectGetHeight(self.frame);
    _trackFrame  = CGRectMake(0, 0, CGRectGetHeight(self.frame),CGRectGetHeight(self.frame));
    _cornerRadius =  CGRectGetHeight(self.frame)/2;

    self.value = 0;
    self.cornerRadius = CGRectGetHeight(self.frame)/2;
    self.backgroundColor = [UIColor greenColor];
    self.valueColor = [UIColor redColor];
    self.trackColor = [UIColor whiteColor];
}
-(void)drawRect:(CGRect)rect
{
    self.layer.cornerRadius = _cornerRadius;

    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    
    _actualWiddth = rect.size.width = self.value*_validWiddth + _cornerRadius;
    CGContextSetFillColorWithColor(context, self.valueColor.CGColor);
    CGContextFillRect(context, rect);
    CGContextStrokePath(context);
    

    
    _trackFrame.origin.x = _actualWiddth - _cornerRadius;
    CGContextSetFillColorWithColor(context, self.trackColor.CGColor);
    CGContextFillEllipseInRect(context, _trackFrame);
    CGContextStrokePath(context);
    
        CGContextRestoreGState(context);

}

#pragma mark - Setter Methods
-(void)setValue:(CGFloat)value
{
    if (_value != value) {
        
        if (value>=1) {
            value = 1;
        } else if (value <= 0) {
            value = 0;
        }
        
        CGFloat tempVaule = _value;
         _value = value;
        
        if ([self.delegate respondsToSelector:@selector(didValueChangeInslider:WithOldValue:)]) {
            [self.delegate didValueChangeInslider:self WithOldValue:tempVaule];
        }
        
        [self setNeedsDisplay];
    }
}

-(void)setValueColor:(UIColor *)valueColor
{
    if (_valueColor != valueColor) {
        _valueColor = valueColor;
        [self setNeedsDisplay];
    }
}

-(void)setTrackColor:(UIColor *)trackColor
{
    if (_trackColor != trackColor) {
        _trackColor = trackColor;
        [self setNeedsDisplay];
    }
}

-(void)setCornerRadius:(CGFloat)cornerRadius
{
    if (_cornerRadius != cornerRadius) {
        _cornerRadius = cornerRadius;
        [self setNeedsDisplay];
    }
}

-(void)setTrackFrame:(CGRect)trackFrame
{
    _trackFrame = trackFrame;
    [self setNeedsDisplay];
}

#pragma mark - Touch Event

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint location = [[touches anyObject]locationInView:self];
    
    if ([self isLocation:location InRect:_trackFrame]) {
        _slderBegin = YES;
        _startTrackCenterX = CGRectGetMidX(_trackFrame);
        _startTrackValue = self.value;
    }
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (_slderBegin) {
        CGFloat currentX  = [[touches anyObject]locationInView:self].x;
        
        if (currentX <= _cornerRadius) {
            currentX = _cornerRadius;
        } else if (currentX >= _cornerRadius + _validWiddth) {
            currentX = _cornerRadius + _validWiddth;
        }
        
        CGFloat changeValue = currentX - _startTrackCenterX;
        self.value = _startTrackValue + changeValue/_validWiddth;
    }

}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    _slderBegin = NO;
}
#pragma mark Private Method
-(BOOL)isLocation:(CGPoint )location InRect:(CGRect )frame
{
    if (location.x >= CGRectGetMinX(frame) && location.x <= CGRectGetMaxX(frame) && location.y >= CGRectGetMinY(frame) && location.y <= CGRectGetMaxY(frame)) {
        return YES;
    } else {
        return NO;
    }
}
@end
