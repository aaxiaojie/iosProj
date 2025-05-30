//
//  ViewController.m
//  iosTestProject
//
//  Created by 天下 on 2025/5/30.
//

#import "ViewController.h"

#import "oneSDK/oneSDK.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton* customButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    // 创建按钮实例
    self.customButton = [UIButton buttonWithType:UIButtonTypeSystem];
    // 设置按钮的frame
    self.customButton.frame = CGRectMake(100, 200, 200, 50);
    // 设置按钮标题
    [self.customButton setTitle:@"点击按钮" forState:UIControlStateNormal];
    // 设置按钮标题颜色
    [self.customButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    // 设置按钮背景颜色
    self.customButton.backgroundColor = [UIColor blueColor];
    // 设置按钮圆角
    self.customButton.layer.cornerRadius = 8.0;
    // 裁剪超出部分
    self.customButton.clipsToBounds = YES;
    // 添加按钮点击事件
    [self.customButton addTarget:self
                          action:@selector(buttonClicked:)
                forControlEvents:UIControlEventTouchUpInside];
    // 将按钮添加到视图
    [self.view addSubview:self.customButton];
}

// 按钮点击事件处理方法
- (void)buttonClicked:(UIButton *)sender {
    NSLog(@"按钮被点击了!");
    
    [oneSDKBranch sendLogin];
    
    // 改变按钮标题
//    [sender setTitle:@"已点击" forState:UIControlStateNormal];
    
    // 改变按钮背景颜色
//    sender.backgroundColor = [UIColor redColor];
}


@end
