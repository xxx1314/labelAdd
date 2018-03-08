//
//  ViewController.m
//  LabelAddAndShow（流式标签显示和添加之后显示）
//
//  Created by hello on 2018/3/7.
//  Copyright © 2018年 Hello. All rights reserved.
//

#import "ViewController.h"
#import "MRButtonsView.h"

//得到屏幕height
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
//得到屏幕width
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
//得到控件frame
#define GETVIEW_MAXY(view) CGRectGetMaxY(view.frame)
#define GETVIEW_MINX(view) CGRectGetMinX(view.frame)
#define GETVIEW_MAXX(view) CGRectGetMaxX(view.frame)
#define GETVIEW_MINY(view) CGRectGetMinY(view.frame)
#define GETVIEW_MAXY(view) CGRectGetMaxY(view.frame)
//获取控件的尺寸 新添加
#define S_MULTIPLE SCREEN_WIDTH / 720
//获取颜色
#define JzZCOLORRGB(R,G,B) [UIColor colorWithRed:(R)/255.0 green:(G)/255.0 blue:(B)/255.0 alpha:1.0]
//字体
#define FONT(f) [UIFont systemFontOfSize:f*S_MULTIPLE*2]
#define BOLDFONT(f) [UIFont fontWithName:@"Helvetica-Bold" size:f*S_MULTIPLE*2]

/*
 点击添加添加标签
 点击标签删除标签，之后重新布局
 */



@interface ViewController ()
{
    UITextField *_textField;
    MRButtonsView *_view;
    UIView *_bottomView;
}

@property (nonatomic, strong) NSMutableArray *tagArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.backgroundColor = [UIColor whiteColor];
   //有无数组均可 (也可为空)
    self.tagArray = [NSMutableArray arrayWithArray:@[@"成稳内敛",@"成稳内敛",@"执行能力",@"阳光开朗"]];
    [self loadAdvantageView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"添加" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blackColor];
    [button addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:JzZCOLORRGB(255, 255, 255) forState:UIControlStateNormal];
    button.titleLabel.font = FONT(14.0);
    button.frame = CGRectMake(200, 20, 100, 20);
    [button addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

}


- (void)loadAdvantageView{
    
    MRButtonsView *view = [[MRButtonsView alloc] initWithButtonArr:self.tagArray andRowSpacing:30*S_MULTIPLE andColumnSpacing:20*S_MULTIPLE andTop_BottomSpacing:20*S_MULTIPLE andLeft_rigntSpacing:20*S_MULTIPLE andFontSize:12.0  andFirstLeftSpacing:20*S_MULTIPLE andFirstTopSpacing:30*S_MULTIPLE andAllWidth:SCREEN_WIDTH];
    view.frame = CGRectMake(0, 50, SCREEN_WIDTH, view.viewHeight+30*S_MULTIPLE);
    view.backgroundColor = [UIColor redColor];
    view.borColor = [UIColor blackColor];
    view.borWidth = 0.5;
    view.circleRadius = 5.0;
    [self.view addSubview:view];
    _view = view;
    [view setButtonClick:^(UIButton *button) {
        [self.tagArray removeObject:button.currentTitle];
    }];
    
}




#pragma  ----- add
- (void)add{
    
   __block UITextField *textField1 = nil;
    
    UIAlertController *vc = [UIAlertController alertControllerWithTitle:nil message:@"添加标签" preferredStyle:UIAlertControllerStyleAlert];
    [vc addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入标签";
        textField1 = textField;
    }];
    [vc addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    
    [vc addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
       [_view addButtonWithIndex:self.tagArray.count andTitle:textField1.text];
        _view.frame = CGRectMake(0, 50, SCREEN_WIDTH, _view.viewHeight+30*S_MULTIPLE);
        [self.tagArray addObject:textField1.text];
        
    }]];
    
    [self presentViewController:vc animated:YES completion:nil];
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
