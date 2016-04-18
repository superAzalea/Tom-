//
//  ViewController.m
//  day02_03_汤姆猫
//
//  Created by davis on 16/4/8.
//  Copyright © 2016年 azalea. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)drink;

- (IBAction)knock;

- (IBAction)knockfoot;
- (void)runAnimationCount:(NSInteger)count andName:(NSString *) name;

@end

@implementation ViewController

- (void)runAnimationCount:(NSInteger)count andName:(NSString *) name
{
    if (self.imageView.isAnimating) {
        return;
    }
    //创建可变数组
    NSMutableArray *images = [NSMutableArray array];
    //数组里添加图片
    for (int index = 0; index<count; index++) {
        //获得图片名称
        NSString *imageName = [NSString stringWithFormat:@"%@_%02d",name,index];
        //创建图片
        //通过imageNamed创建的图片会放到缓存中
        //UIImage *image = [UIImage imageNamed:imageName];
        //图片加入数组
        //当你把图片放在images.xcassets 就只能通过imageNamed加载
        NSString *path = [[NSBundle mainBundle] pathForResource:imageName ofType:@"jpg"];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        [images addObject:image];
    }
    //把图片赋值给imageview的动画数组
    self.imageView.animationImages = images;
    
    //整个动画播放一圈的时间
    self.imageView.animationDuration = count * 0.05;
    //动画的重复次数
    self.imageView.animationRepeatCount = 1;
    //开始播放动画
    [self.imageView startAnimating];
    CGFloat delay = self.imageView.animationDuration+0.1;
    [self.imageView performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:delay];
}


- (IBAction)drink {
    [self runAnimationCount:81 andName:@"drink"];
    
}

- (IBAction)knock {
    [self runAnimationCount:81 andName:@"knockout"];

}

- (IBAction)knockfoot {
    [self runAnimationCount:30 andName:@"footLeft"];

}
@end
