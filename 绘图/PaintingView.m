//
//  PaintingView.m
//  绘图
//
//  Created by 杨芳学 on 16/3/18.
//  Copyright © 2016年 杨芳学. All rights reserved.
//

#import "PaintingView.h"


@interface PaintingView(){
    
    CGContextRef contextRef;
    
}

@end


@implementation PaintingView
//所有画图的代码 写在drawRect里面
//1.初始化的时候 会调用
//2.setNeedsDisplay


- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    [self addRound];
    [self addLine];
    [self addRect];
    [self addCurve];
}
//画直线
- (void)addLine{
    //1.创建 画布 上下文
    //获得当前上下文 当做画布
    CGContextRef context =
    UIGraphicsGetCurrentContext();
    //2.创建画图的内容
    UIBezierPath *path = [UIBezierPath bezierPath];
    //point 中心点
    //x 中心点x
    //y 中心点y
    //y不变 x从小值 - 大值 横向直线
    //2.1
    [path moveToPoint:CGPointMake(100, 50)];
    //2.2添加其他点
    [path addLineToPoint:CGPointMake(100, 350)];
    [path addLineToPoint:CGPointMake(300, 50)];
    //2.3设置画笔的宽度
    path.lineWidth = 2;
    //2.4设置画笔颜色
//    [[UIColor whiteColor]set];
    [[UIColor whiteColor]setStroke];//画笔颜色为白色
    [[UIColor brownColor]setFill];//设置填充颜色
    //3.把画的内容<路径>添加到上下文<画布>
    CGContextAddPath(context, path.CGPath);
    //4.绘制 渲染 内容到上下文《画布》
//    CGContextStrokePath(context);
    //设置填充的样式
    CGContextDrawPath(context, kCGPathFillStroke);
    
    
}
//添加矩形
- (void)addRect{
    
    //1.画布
    CGContextRef context =
    UIGraphicsGetCurrentContext();
    //2.内容
    CGContextAddRect(context, CGRectMake(0, 0, 100, 100));
//    [[UIColor redColor]set];
    [[UIColor whiteColor]setStroke];
    [[UIColor brownColor]setFill];
    //设置画笔宽度
    CGContextSetLineWidth(context, 3);
    //3.渲染
    //直接渲染矩形
//    CGContextStrokeRect(context, CGRectMake(0, 0, 100, 100));
    CGContextDrawPath(context, kCGPathFillStroke);
}
//画圆形
- (void)addRound{
    
    //1.画布
    contextRef =
    UIGraphicsGetCurrentContext();
    //2.内容
    CGContextAddEllipseInRect(contextRef, CGRectMake(10, 10, 100, 100));
    [[UIColor whiteColor]set];
    //3.渲染到画布
    CGContextDrawPath(contextRef, kCGPathFillStroke);
    
    
}
//画曲线
- (void)addCurve{
    //1.画布
    CGContextRef context =
    UIGraphicsGetCurrentContext();
    //2.内容
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(100, 100)];
//    [path addCurveToPoint:CGPointMake(200, 150) controlPoint1:CGPointMake(300, 50) controlPoint2:CGPointMake(100, 100)];
    /*
     Center:中心点
     radius:半径
     startAngle:开始的弧度
     endAngle:结束的弧度
     clockwise:是顺时针 还是逆时针
     */
    [path addArcWithCenter:CGPointMake(200, 200) radius:100 startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
    [[UIColor redColor]setStroke];
    [[UIColor yellowColor]setFill];
    //3.把内容添加到画布上
    CGContextAddPath(context, path.CGPath);
    //4.渲染
    CGContextDrawPath(context, kCGPathFillStroke);
}
//画线简化
-(void)addLine2{
    //1.路径
    //2.画出内容
    
    UIBezierPath *path  = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(200, 200)];
    [path addLineToPoint:CGPointMake(200, 500)];
    [[UIColor whiteColor]set];
    [path stroke];
}
//截屏
- (void)cutScreen{
    
    //1.获得一个图片的上下文(画布)
    //2.画布的上下文
    //3.设置截图的参数
    //3.5 截图
    //4.关闭图片的上下文
    //5.保存
    
    
    UIGraphicsBeginImageContext(self.frame.size);
    
    [self addRound];
    
    [self.layer renderInContext:contextRef];
    
    
    /*
     size 图片尺寸
     opaque 透明度  YES-->不透明  NO--->透明
     scale 比例
     */
    
    
    UIGraphicsBeginImageContextWithOptions(self.frame.size, YES, 1);
    //开始截图
 
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭截图上下文
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    
    
}




@end
