//
//  IBCheckbox.h
//  IBApplication
//
//  Created by Bowen on 2018/8/20.
//  Copyright © 2018年 BowenCoder. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger ,IBCheckmarkStyle){
    IBCheckmarkStyleSquare = 1, // ■
    IBCheckmarkStyleCircle,     // ●
    IBCheckmarkStyleCross,      // ╳
    IBCheckmarkStyleTick,       // ✓
};
typedef NS_ENUM(NSUInteger ,IBBorderStyle){
    IBBorderStyleSquare  = 1, // ▢
    IBBorderStyleCircle,      // ◯
};

@interface IBCheckbox : UIControl

/** 是否选中 */
@property (nonatomic, assign) BOOL isChecked;

/** 默认IBCheckmarkStyleSquare */
@property (nonatomic, assign) IBCheckmarkStyle checkmarkStyle;
/** 默认IBBorderStyleSquare */
@property (nonatomic, assign) IBBorderStyle borderStyle;
/** 默认为1 */
@property (nonatomic, assign) CGFloat borderWidth;
/** 默认为0.5 */
@property (nonatomic, assign) CGFloat checkmarkSize;

/** 未选中边框颜色 */
@property (nonatomic, strong) UIColor *uncheckedBorderColor;
/** 选中边框颜色 */
@property (nonatomic, strong) UIColor *checkedBorderColor;
/** 标记图标颜色 */
@property (nonatomic, strong) UIColor *checkmarkColor;
/** 背景色 */
@property (nonatomic, strong) UIColor *checkboxBackgroundColor;

/** 扩大响应区域，默认为5 */
@property (nonatomic, assign) CGFloat increasedTouchRadius;

/** 是否使用触感反馈 */
@property (nonatomic, assign) BOOL useHapticFeedback;

/** block回调 */
@property (nonatomic, copy) void (^valueChanged)(BOOL isChecked);


@end
