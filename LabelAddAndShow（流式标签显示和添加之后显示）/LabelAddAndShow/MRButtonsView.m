//
//  MRButtonsView.m
//  Home
//
//  Created by hello on 2017/11/29.
//  Copyright © 2017年 zyj. All rights reserved.
//

#import "MRButtonsView.h"

@implementation MRButtonsView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



-(instancetype)initWithButtonArr:(NSArray *)buttonArr andRowSpacing:(CGFloat)rowSpacing andColumnSpacing:(CGFloat)columnSpacing  andTop_BottomSpacing:(CGFloat)top_BottomSpacing andLeft_rigntSpacing:(CGFloat)left_rigntSpacing andFontSize:(CGFloat)fontSize  andFirstLeftSpacing:(CGFloat)firstLeftSpacing andFirstTopSpacing:(CGFloat)firstTopSpacing  andAllWidth:(CGFloat)allWidth{
    if(self = [super init]){
        self.buttonArray = [NSMutableArray array];
        self.columnSpacing = columnSpacing;
        self.rowSpacing = rowSpacing;
        self.left_rigntSpacing = left_rigntSpacing;
        self.top_BottomSpacing = top_BottomSpacing;
        self.fontSize = fontSize;
        self.firstTopSpacing = firstTopSpacing;
        self.firstLeftSpacing = firstLeftSpacing;
        self.AllWidth = allWidth;
        for (int i = 0; i<buttonArr.count; i++) {
           [self addButtonWithIndex:i andTitle:buttonArr[i]];
        }
    }
    return self;
}




- (void)addButtonWithIndex:(NSInteger)index andTitle:(NSString*)title{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.tag = 100+index;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:self.fontSize];
    CGSize size = [title sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:self.fontSize],NSFontAttributeName, nil]];
    button.frame = CGRectMake(0,0,size.width+self.left_rigntSpacing, size.height+self.top_BottomSpacing);
   
    if ( index == 0) {
        button.frame = CGRectMake(self.firstLeftSpacing, self.firstTopSpacing,size.width+self.left_rigntSpacing, size.height+self.top_BottomSpacing);
    }else{
        if (size.width+self.left_rigntSpacing > self.AllWidth-(_btn.frame.size.width+_btn.frame.origin.x)-self.columnSpacing) {
            button.frame = CGRectMake(self.firstLeftSpacing, _btn.frame.size.height+_btn.frame.origin.y+self.rowSpacing,size.width+self.left_rigntSpacing, size.height+self.top_BottomSpacing);
        }else{
            button.frame = CGRectMake(_btn.frame.size.width+_btn.frame.origin.x+self.columnSpacing, _btn.frame.origin.y,size.width+self.left_rigntSpacing, size.height+self.top_BottomSpacing);
        }
    }
    [button addTarget:self action:@selector(selectTag:) forControlEvents:UIControlEventTouchUpInside];
    button.layer.borderColor = [self.borColor CGColor];
    button.backgroundColor = self.backColor;
    button.layer.borderWidth = self.borWidth;
    button.layer.cornerRadius = self.circleRadius;
    button.layer.masksToBounds = YES;
    [self addSubview:button];
    _btn = button;
    [self.buttonArray addObject:button];
    self.viewHeight = _btn.frame.size.height+_btn.frame.origin.y;
}

-(void)setTitleColor:(UIColor *)titleColor{
    _titleColor = titleColor;
    for (int i = 0; i < self.buttonArray.count; i++) {
        UIButton *button = self.buttonArray[i];
        button.tintColor = titleColor;
    }
}


-(void)setBackColor:(UIColor *)backColor{
    _backColor = backColor;
    for (int i = 0; i < self.buttonArray.count; i++) {
        UIButton *button = self.buttonArray[i];
        button.backgroundColor = backColor;
    }
}

-(void)setBorColor:(UIColor *)borColor{
    _borColor = borColor;
    for (int i = 0; i < self.buttonArray.count; i++) {
        UIButton *button = self.buttonArray[i];
        button.layer.borderColor = [borColor CGColor];
    }
}

-(void)setBorWidth:(CGFloat)borWidth{
    _borWidth = borWidth;
    for (int i = 0; i < self.buttonArray.count; i++) {
        UIButton *button = self.buttonArray[i];
        button.layer.borderWidth = borWidth;
    }
}

-(void)setCircleRadius:(CGFloat)circleRadius{
    _circleRadius = circleRadius;
    for (int i = 0; i < self.buttonArray.count; i++) {
        UIButton *button = self.buttonArray[i];
        button.layer.cornerRadius = circleRadius;
        button.layer.masksToBounds = YES;
    }
}



- (void)selectTag:(UIButton*)button{
 
    NSInteger j = button.tag-100;
    for (NSInteger i = j+1; i < self.buttonArray.count; i++) {
        UIButton *btn1 = self.buttonArray[i-1];
        UIButton *btn2 = self.buttonArray[i];
        [self compareButton:btn1 andButton:btn2];
    }
    self.buttonClick(button);
    [self.buttonArray removeObject:button];
    [button removeFromSuperview];
    
}


- (void)compareButton:(UIButton *)button1 andButton:(UIButton*)button2 {
    if (button2.frame.size.width < self.AllWidth-button1.frame.origin.x-self.columnSpacing) {
         button2.frame = CGRectMake(button1.frame.origin.x, button1.frame.origin.y, button2.frame.size.width, button2.frame.size.height);
        button2.tag = button1.tag;
    }
}

@end
