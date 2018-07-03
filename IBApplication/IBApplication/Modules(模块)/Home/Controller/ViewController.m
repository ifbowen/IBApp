//
//  ViewController.m
//  IBApplication
//
//  Created by Bowen on 2018/6/21.
//  Copyright © 2018年 BowenCoder. All rights reserved.
//

#import "ViewController.h"
#import "IBMacros.h"
#import "UIPopupManager.h"
#import "UIViewController+Alert.h"
#import "UIView+Ext.h"
#import "UIView+Effect.h"
#import "UIButton+Ext.h"
#import "NSApp.h"
#import "UITextField+Ext.h"
#import "NSDate+Ext.h"
#import "NSEncode.h"
#import "NSCrypto.h"
#import "NSColor.h"
#import "NSHelper.h"
#import "UIViewAnimation.h"
#import "UIView+draggable.h"
#import "NSHTTPClient.h"
#import "NSFile.h"
#import "UIImageHelper.h"
#import "MBProgressHUD+Ext.h"
#import "SDWebImage.h"
#import "NSLoadingView.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) UIView *testView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 100, self.view.frame.size.width - 100, 200)];
    
//    self.imageView.contentMode = UIViewContentModeCenter;
    UIImage *img = [UIImage imageNamed:@"test"];
    self.imageView.image = img;
    self.imageView.backgroundColor = [UIColor lightGrayColor];
    self.imageView.userInteractionEnabled = YES;
    self.imageView.cagingArea = self.view.frame;
    [self.imageView enableDragging];
//    [self.view addSubview:self.imageView];
    

//    [self.imageView setShadowColor:[UIColor blackColor] opacity:0.7 offset:CGSizeMake(10, 10) radius:5 type:@"Trapezoidal"];
//    self.imageView.effectGroup = [[UIMotionEffectGroup alloc] init];
//    [self.imageView moveAxis:100 dy:100];
//    [self.view setBackgroundImage:img pattern:YES];

//    [self.imageView setBorderColor:[UIColor redColor] width:5 cornerRadius:3];
//    [self.imageView setFourCorners];
    
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btn setImage:[UIImage resizedImage:img size:CGSizeMake(40, 10)] forState:UIControlStateNormal];
//    [btn setTitle:@"点击按钮" forState:UIControlStateNormal];
//    [btn setBackgroundColor:[UIColor redColor] forState:UIControlStateNormal];
//    btn.frame = CGRectMake(100, 300, 200, 60);
//    [btn layoutButtonEdgeInsetsStyle:UIButtonEdgeInsetsStyleRight space:10];
//    [self.view addSubview:btn];
    
//    UITextField *tf = [[UITextField alloc] initWithFrame:CGRectMake(50, 300, 300, 44)];
//    [tf setCursorColor:[UIColor redColor]];
////    [tf setPlaceholder:@"请输入手机号码" color:[UIColor purpleColor] font:18.0];
//    [tf setLeftLabelTitle:@"用户名" titleColor:[UIColor redColor]
//                titleFont:14 width:50 backgroundColor:[UIColor orangeColor]];
//    self.btn =[tf setRightButtonTitle:@"获取验证码" titleColor:[UIColor redColor] titleFont:14 width:100 target:self selector:@selector(test3) backgroundColor:[UIColor orangeColor]];
//    [tf setBorderColor:[UIColor blackColor] width:1 cornerRadius:0];
//    [self.view addSubview:tf];
//
//    NSLog(@"%@", [NSDate timestampToTime:[[NSDate date] timestamp] formatter:nil]);
//
//    NSDate *date = [NSDate dateWithYear:2018 month:6 day:25 hour:04 minute:40 second:14];
//    NSLog(@"%@", [date timeAgoSimple]);
//
//    if ([date isNextWeek]) {
//        NSLog(@"昨天");
//    } else {
//        NSLog(@"不是昨天");
//
//    }
//
//    self.testView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
//    self.testView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:self.testView];
//
//    [MBProgressHUD showNoData:self.view reload:^{
//        [self test6];
//    }];
    
}

- (void)test6 {
//    [container setViews:@[view1, view2, self.imageView]];
}

- (void)doSomeWorkWithProgress:(MBProgressHUD *)hub {
    float progress = 0.0f;
    while (progress < 1.0f) {
        progress += 0.01f;
        dispatch_async(dispatch_get_main_queue(), ^{
            hub.progress = progress;
            hub.detailsLabel.text = NSStringFormat(@"%.2f", progress);
        });
        usleep(50000);
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesBegan");
    [MBProgressHUD showCircleLoadingView:self.view];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideCircleLoadingView:self.view];
    });
//    [MBProgressHUD showTriangleLoadingView:self.view];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [MBProgressHUD hideTriangleLoadingView:self.view];
//    });
    
//    NSCircleLoadingView *load = [[NSCircleLoadingView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
//    load.center = self.view.center;
//    [self.view addSubview:load];
//    load.lineWidth = 3.0;
//    load.colorArray = @[[UIColor redColor], [UIColor purpleColor], [UIColor greenColor], [UIColor blueColor]].mutableCopy;
//    [load startAnimation];

    
//    [MBProgressHUD showBallLoadingView:self.view];

//    [MBProgressHUD hideEmpty:self.view];
//    [MBProgressHUD showLoading:self.view text:@"加载中" background:nil];


//    [MBProgressHUD hideEmpty:self.view];
//    NSData *data = [[NSData alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"niconiconi@2x" ofType:@"gif"]];
//    UIImage *image = [UIImage sd_animatedGIFWithData:data];
//    [MBProgressHUD showCustomView:self.view view:[[UIImageView alloc] initWithImage:image] text:nil mask:YES];
//    MBProgressHUD *hud = [MBProgressHUD showLoadingGif:self.view gif:data text:nil];
    
//    FLAnimatedImage *image1 = [FLAnimatedImage animatedImageWithGIFData:data];
//    FLAnimatedImageView *imgview = [[FLAnimatedImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
//    imgview.animatedImage = image1;
//    [MBProgressHUD showCustomView:self.view custom:imgview text:@"加载中..."];

//    [MBProgressHUD showProgress:self.view.superview title:@"正在上传" detail:@"0.00" progress:^(MBProgressHUD *hud) {
//        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
//            [self doSomeWorkWithProgress:hud];
//            dispatch_async(dispatch_get_main_queue(), ^{
//                [hud hideAnimated:YES];
//            });
//        });
//    } mode:MBProgressModeDeterminate];
    
//    [MBProgressHUD showSuccess:self.view title:@"上传成功"];
//    [MBProgressHUD showError:self.view title:@"上传失败"];
//    [MBProgressHUD showText:self.view title:@"错误操作" detail:nil position:MBPositionBottom];

//    [MBProgressHUD showCustomView:self.view custom:self.testView text:@"活动中"];
//    [MBProgressHUD showLoading:self.view text:@"执行中"];
//    [MBProgressHUD showLoading:self.view text:@"加载中" background:nil];
//    NSLog(@"%ld", [NSHTTPClient shareInstance].networkStatus);
//    UIViewAnimation *animation = [[UIViewAnimation alloc] init];
//    animation.removeAnimation = YES;
//    [animation flyoutAnimation:self.imageView duration:0.25 start:nil end:^(CAAnimation *animation) {
//        [self.imageView removeFromSuperview];
//    }];
//    [animation fallAnimation:self.imageView duration:0.25 start:nil end:^(CAAnimation *animation) {
//                [self.imageView removeFromSuperview];
//    } isIn:NO];
//    [self.imageView removeFromSuperview];
//    [self.view addSubview:self.imageView];

//    [animation popAnimation:self.imageView duration:4 start:^(CAAnimation *animation) {
//        [self.view addSubview:self.imageView];
//    }  end:^(CAAnimation *animation) {
//        [self.imageView removeFromSuperview];
//
//    } isIn:YES];
    
//    [animation backAnimation:self.imageView inView:self.view direction:UIViewAnimationTop duration:1 start:^(CAAnimation *animation) {
//
//    } end:^(CAAnimation *animation) {
////        [self.imageView removeFromSuperview];
//        [self.view addSubview:self.imageView];
//    } fade:YES isIn:YES];
    
//    [animation fadeAnimation:self.imageView duration:0.25 start:nil end:^(CAAnimation *animation) {
//        [self.imageView removeFromSuperview];
//    } isIn:NO];

//    [animation slideAnimation:self.imageView inView:nil direction:UIViewAnimationBottom duration:4 start:^(CAAnimation *animation) {
//
//    } end:^(CAAnimation *animation) {
//        [self.view addSubview:self.imageView];
////        [self.imageView removeFromSuperview];
//    } isIn:YES];
    
//    NSLog(@"123");
//    [self test6];
//    [UIViewAnimation zoom:self.imageView duration:0.25 isIn:NO completion:^{
////        [self.view addSubview:self.imageView];
//        [self.imageView removeFromSuperview];
//    }];
//    [UIView fade:self.imageView duration:0.25 isIn:YES completion:^{
//        [self.view addSubview:self.imageView];
//    }];
//    [UIView move:self.imageView duration:0.25 distance:100 direction:UIViewAnimationDirectionBottom];
//    [UIView rotate:self.imageView duration:0.25 angle:90];
    
//    NSLog(@"%@", [NSApp cacheSize]);

//    [NSApp shakeDevice];
    
    
//    [self test1];
//    [self test2];
//    [self test3];
////    UIPopupManager *manager = [[UIPopupManager alloc] init];
////    [manager addCustomView:self.imageView type:UIPopupAnimationCenter duration:0.25];
    
//    UITouch *touch = [touches anyObject];
//    CGPoint point = [touch locationInView:self.view];
//    UIColor *color = [NSColor randomColor];
//    __weak typeof(self) weakself = self;
////    [UIViewAnimation spread:self.view startPoint:point duration:0.25 type:UIViewAnimationTypeOpen color:color completion:^(BOOL finished) {
////        weakself.view.backgroundColor = color;
////    }];
    
//    [UIViewAnimation shake:self.imageView];
//
////    [self test4];
//    [self test5];
}

- (void)test5 {
    NSDate *date = [NSDate timestampToDate:[[NSDate date] timestamp] + 60*60*24*6];
    if ([date isNextWeek]) {
        NSLog(@"下周");
    } else {
        NSLog(@"本周");
    }
    NSDate *date1 = [NSDate dateWithString:@"2018-06-25 09:21:46" formatter:@"YYYY-MM-dd hh:mm:ss"];
    NSLog(@"%@",[NSDate timestampToTime:[date1 timestamp] formatter: @"YYYY-MM-dd hh:mm:ss"]);
    
    NSDate *date2 = [NSDate dateWithYear:2018 month:6 day:2 hour:5 minute:0 second:0];
    NSLog(@"%@", [date2 displayTime]);
}

- (void)test4 {
//    [self showAlertWithTitle:@"标题" message:@"描述" others:@[@"取消", @"确定"] animated:YES action:^(NSInteger buttonIndex) {
//        NSLog(@"点击了%li", buttonIndex);
//    }];
//
//    [self showActionSheetWithTitle:@"标题" message:@"描述" destructive:@"确定" others:@[@"取消",@"狗",@"猫"] animated:YES action:^(NSInteger buttonIndex) {
//        NSLog(@"点击%li", buttonIndex);
//    }];
    
    [self showAlertWithTitle:@"标题" message:@"描述" others:@[@"取消",@"登录"] tfNumber:4 tfHandle:^(UITextField *field, NSInteger index) {
        NSLog(@"%@--%ld",field, index);
    } animated:YES action:^(NSInteger buttonIndex) {
        NSLog(@"点击%li", buttonIndex);
    }];
}

- (void)test3 {
    NSString *string = @"https://www.baidu.com/s?wd=我测试中文";
//    NSLog(@"%@",[string URLEncode]);
//    NSLog(@"%@",[string URLDecode]);
    NSString *str = [NSEncode base64Encode:string];
    NSString *str1 = [NSEncode base64Decode:str];
    NSLog(@"%@---%@", str, str1);
    
    [self.btn startTime:10 title:@"重新发送" waitTittle:@"s"];
}

- (void)test2 {
//    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@",[NSEncode sha1:@"abc"]);
}

- (void)test1 {
    
    NSString *pubkey = @"-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDDI2bvVLVYrb4B0raZgFP60VXY\ncvRmk9q56QiTmEm9HXlSPq1zyhyPQHGti5FokYJMzNcKm0bwL1q6ioJuD4EFI56D\na+70XdRz1CjQPQE3yXrXXVvOsmq9LsdxTFWsVBTehdCmrapKZVVx6PKl7myh0cfX\nQmyveT/eqyZK1gYjvQIDAQAB\n-----END PUBLIC KEY-----";
    NSString *privkey = @"-----BEGIN PRIVATE KEY-----\nMIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAMMjZu9UtVitvgHS\ntpmAU/rRVdhy9GaT2rnpCJOYSb0deVI+rXPKHI9Aca2LkWiRgkzM1wqbRvAvWrqK\ngm4PgQUjnoNr7vRd1HPUKNA9ATfJetddW86yar0ux3FMVaxUFN6F0KatqkplVXHo\n8qXubKHRx9dCbK95P96rJkrWBiO9AgMBAAECgYBO1UKEdYg9pxMX0XSLVtiWf3Na\n2jX6Ksk2Sfp5BhDkIcAdhcy09nXLOZGzNqsrv30QYcCOPGTQK5FPwx0mMYVBRAdo\nOLYp7NzxW/File//169O3ZFpkZ7MF0I2oQcNGTpMCUpaY6xMmxqN22INgi8SHp3w\nVU+2bRMLDXEc/MOmAQJBAP+Sv6JdkrY+7WGuQN5O5PjsB15lOGcr4vcfz4vAQ/uy\nEGYZh6IO2Eu0lW6sw2x6uRg0c6hMiFEJcO89qlH/B10CQQDDdtGrzXWVG457vA27\nkpduDpM6BQWTX6wYV9zRlcYYMFHwAQkE0BTvIYde2il6DKGyzokgI6zQyhgtRJ1x\nL6fhAkB9NvvW4/uWeLw7CHHVuVersZBmqjb5LWJU62v3L2rfbT1lmIqAVr+YT9CK\n2fAhPPtkpYYo5d4/vd1sCY1iAQ4tAkEAm2yPrJzjMn2G/ry57rzRzKGqUChOFrGs\nlm7HF6CQtAs4HC+2jC0peDyg97th37rLmPLB9txnPl50ewpkZuwOAQJBAM/eJnFw\nF5QAcL4CYDbfBKocx82VX/pFXng50T7FODiWbbL4UnxICE0UBFInNNiWJxNEb6jL\n5xd0pcy9O2DOeso=\n-----END PRIVATE KEY-----";
    NSString *originString = @"hello world!";
    NSData *data = [originString dataUsingEncoding:NSUTF8StringEncoding];
    NSData *pubData = [NSCrypto encryptRSA:data key:privkey option:NSEncryptRSAPrivateKey];
    NSData *priData = [NSCrypto decryptRSA:pubData key:pubkey option:NSEncryptRSAPublicKey];
    NSLog(@"%@", [NSHelper UTF8String:priData]);
//
//    NSData *des = [data encrypt:@"123456789" option:IBCEncryptAlgorithmAES];
//    NSData *desData = [des decrypt:@"123456789" option:IBCEncryptAlgorithmAES];
//    NSLog(@"%@", [[NSString alloc] initWithData:desData encoding:NSUTF8StringEncoding]);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
