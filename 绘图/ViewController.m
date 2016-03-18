//
//  ViewController.m
//  绘图
//
//  Created by 杨芳学 on 16/3/18.
//  Copyright © 2016年 杨芳学. All rights reserved.
//

/*
 绘图 
 (1)CGContextRef 上下文--->画板
 (2)画图的内容---->设置画图的内容
 (3)把内容添加到上下文(画板)
 (4)把内容画到画板上
 
 
 常用方法介绍 
 (1)CGContextRef 上下文--->画板
 (2)路径
 《1》UIBezierPath
 《2》CGMutablePathRef 通过点绘制一个路径
 《3》CGContextMoveToPoint 注意必须设置起始点
 (3)画形状
 《1》矩形  CGContextAddRect
 《2》曲线  CGContextAddCurveToPoint
 《3》圆形  CGContextAddEllipseInRect
 《3.1》CGContextSetLineWidth 设置笔画宽度
 《3.2》set 设置笔画的颜色
 《3.3》setFill 划线区域范围的填充
 《3.4》setStroke 设置笔画的颜色
 《3.5》设置画笔填充样式
 1.kCGPathFill 只填充
 2.kCGPathStroke 画笔颜色
 3.kCGPathFillStroke 既填充又有画笔颜色
 (4)截图
  《1》UIGraphicsBeginImageContextWithOptions 开始截图
  《2》UIGraphicsGetImageFromCurrentImageContext() 获得当前图片上下文的图片--画图视图的layer上得到
  《3》UIGraphicsEndImageContext 关闭图片上下文
  《4》UIGraphicsBeginImageContext 开始获得图片上下文、
  《5》CGContextStrokePath 把路径绘制到图片上下文
  《6》直接把路径绘制到界面stroke
 
 画线
 （1）CGContextRef 上下文 ->画板
 （2）路径 画图的内容
 （3）CGContextAddPath把路径添加到上下文
 （4）CGContextStrokePath把路径渲染到上下文
 
 */
#import "ViewController.h"
#import "PaintingView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    PaintingView *view = [[PaintingView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:view];
    
    [view cutScreen];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
