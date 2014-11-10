//
//  RatingView.m
//  RatingDemo
//
//  Created by 许启强 on 14-9-18.
//  Copyright (c) 2014年 nyqiqiang. All rights reserved.
//

#import "RatingView.h"

@implementation RatingView

#define kNormalWidth   35
#define kNormalHeight  33
#define kSmallWidth    15
#define kSmallHeight   14

#define kFullMark      10

#define kNormalFontSize 25
#define kSmallFontSize  12

#pragma mark - init Methods
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initGrayStarView];
        
        [self initYellowStarView];
        
        [self initRatingLabel];
    }
    return self;
}

-(void)initGrayStarView
{
    _grayStarArray = [[NSMutableArray alloc]initWithCapacity:5];
    
    for (int index = 0; index < 5; index ++) {
        UIImageView *grayStarView = [[UIImageView alloc]initWithFrame:CGRectZero];
        grayStarView.image = [UIImage imageNamed:@"gray"];
        
        [self addSubview:grayStarView];
        
        [_grayStarArray addObject:grayStarView];
    }
}

-(void)initYellowStarView
{
    _baseView = [[UIView alloc]initWithFrame:CGRectZero];
    _baseView.backgroundColor = [UIColor clearColor];
    _baseView.clipsToBounds = YES;
    [self addSubview:_baseView];
    
    _yellowStarArray = [[NSMutableArray alloc]initWithCapacity:5];
    
    for (int index = 0; index < 5; index ++) {
        UIImageView *yellowStarView = [[UIImageView alloc]initWithFrame:CGRectZero];
        yellowStarView.image = [UIImage imageNamed:@"yellow"];
        
        [_baseView addSubview:yellowStarView];
        
        [_yellowStarArray addObject:yellowStarView];
    }
}

-(void)initRatingLabel
{
    _ratingLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    _ratingLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:_ratingLabel];
}

-(void)setRating:(CGFloat)rating
{
    _rating = rating;
    _ratingLabel.text = [NSString stringWithFormat:@"%.1f",rating];
}
#pragma mark - Layout Subviews
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    int width = 0;
    
    for (int index = 0; index < 5; index++) {
        UIView *yellowStar = _yellowStarArray[index];
        UIView *grayStar   =_grayStarArray[index];
 
        if (self.style == kSmallStyle) {
            yellowStar.frame = CGRectMake(0 + width, 0, kSmallWidth, kSmallHeight);
            grayStar.frame   = CGRectMake(0 + width, 0, kSmallWidth, kSmallHeight);
            
            width += kSmallWidth;
        }
        else{
            yellowStar.frame = CGRectMake(0 + width, 0, kNormalWidth, kNormalHeight);
            grayStar.frame   = CGRectMake(0 + width, 0, kNormalWidth, kNormalHeight);
            
            width += kNormalWidth;
        }
    }
    
    float baseViewWidth = 0;
    float height = 0;
    
    baseViewWidth = self.rating / kFullMark *width;
    
    if (self.style == kSmallStyle) {
        _baseView.frame    = CGRectMake(0, 0, baseViewWidth, kSmallHeight);
        _ratingLabel.font = [UIFont boldSystemFontOfSize:kSmallFontSize];
        height = kSmallHeight;
    } else {
        _baseView.frame = CGRectMake(0, 0, baseViewWidth, kNormalHeight);
        _ratingLabel.font = [UIFont boldSystemFontOfSize:kNormalFontSize];
        height = kNormalHeight;
    }
    
    _ratingLabel.frame = CGRectMake(width, 0, 0, 0);
    
    [_ratingLabel sizeToFit];
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width + _ratingLabel.frame.size.width, height);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
