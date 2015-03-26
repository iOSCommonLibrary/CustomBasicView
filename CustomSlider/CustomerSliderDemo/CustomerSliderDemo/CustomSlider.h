//
//  CustomSlider.h
//  CustomSlider
//
//  Created by myqiqiang on 15/3/25.
//  Copyright (c) 2015年 myqiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CustomSlider;

@protocol CustomSliderDelegate <NSObject>

@optional
/**
 *  slider值改变
 *
 *  @param slider   slider
 *  @param oldValue 旧值
 */
-(void)didValueChangeInslider:(CustomSlider *)slider WithOldValue:(CGFloat)oldValue;

@end
@interface CustomSlider : UIView

/**
 *  滑块值
 */
@property (nonatomic) CGFloat   value;
/**
 *  滑过部分颜色
 */
@property (nonatomic) UIColor   *valueColor;
/**
 *  设置圆圈颜色
 */
@property (nonatomic) UIColor   *trackColor;

@property (assign)id<CustomSliderDelegate>delegate;

@end
