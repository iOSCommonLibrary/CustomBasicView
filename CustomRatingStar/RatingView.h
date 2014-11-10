//
//  RatingView.h
//  RatingDemo
//
//  Created by 许启强 on 14-9-18.
//  Copyright (c) 2014年 nyqiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum kRatingViewStyle {
    kSmallStyle = 0,
    kNormalStyle = 1
}kRatingViewStyle;

@interface RatingView : UIView
{
    @private
    UIView *_baseView;
    UILabel *_ratingLabel;
    NSMutableArray *_yellowStarArray;
    NSMutableArray *_grayStarArray;
}

@property kRatingViewStyle style;
@property CGFloat rating;

@end
