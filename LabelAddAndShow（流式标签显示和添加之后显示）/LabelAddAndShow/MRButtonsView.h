//
//  MRButtonsView.h
//  Home
//
//  Created by hello on 2017/11/29.
//  Copyright © 2017年 zyj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MRButtonsView : UIView

{
    UIButton *_btn;
}

@property (nonatomic, strong) NSMutableArray *buttonArray;//添加所有button
@property (nonatomic, strong) UIColor *backColor;//背景
@property (nonatomic, assign) CGFloat borWidth; //边框宽度
@property (nonatomic, strong) UIColor *borColor; //边框颜色
@property (nonatomic, assign) CGFloat circleRadius; //圆角弧度
@property (nonatomic, assign) CGFloat viewHeight; //view高度
@property (nonatomic, assign) CGFloat fontSize; //字体大小
@property (nonatomic, assign) CGFloat columnSpacing; //列间距
@property (nonatomic, assign) CGFloat top_BottomSpacing; //上下离文字总距离
@property (nonatomic, assign) CGFloat rowSpacing; //行间距
@property (nonatomic, assign) CGFloat left_rigntSpacing; //左右离文字总距离
@property (nonatomic, strong) UIColor *titleColor; //边框颜色
@property (nonatomic, assign) CGFloat firstLeftSpacing; //第一个离左边距离
@property (nonatomic, assign) CGFloat firstTopSpacing; //第一个离上边距离
@property (nonatomic, assign) CGFloat AllWidth; //第一个离上边距离


- (void)addButtonWithIndex:(NSInteger)index andTitle:(NSString*)title;


@property (nonatomic, copy) void (^buttonClick) (UIButton *button);

/**
 标签流

 @param frame frame
 @param buttonArr 数组
 @param rowSpacing 行间距
 @param columnSpacing 列间距
 @param top_BottomSpacing 上下离文字总距离
 @param left_rigntSpacing 左右离文字总距离
 @return view
 */
-(instancetype)initWithButtonArr:(NSArray *)buttonArr andRowSpacing:(CGFloat)rowSpacing andColumnSpacing:(CGFloat)columnSpacing  andTop_BottomSpacing:(CGFloat)top_BottomSpacing andLeft_rigntSpacing:(CGFloat)left_rigntSpacing andFontSize:(CGFloat)fontSize  andFirstLeftSpacing:(CGFloat)firstLeftSpacing andFirstTopSpacing:(CGFloat)firstTopSpacing  andAllWidth:(CGFloat)allWidth;



@end
