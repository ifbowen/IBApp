//
//  UIImage+Ext.h
//  IBApplication
//
//  Created by Bowen on 2018/6/23.
//  Copyright © 2018年 BowenCoder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Ext)

/**
 *  @brief 图片翻转 :YES,水平翻转，NO，垂直翻转
 *
 *  @return 翻转后的图片
 */
- (UIImage *)flip:(BOOL)isHorizontal;

/**
 *  @brief 图片解码
 *
 *  @return 解码后的图片
 */
- (UIImage *)decodeImage;

/**
*  @brief 修正拍照图片方向
*
*  @return 修正后的图片
*/
- (UIImage *)fixOrientation;

/**
 *  @brief  根据bundle中的文件名读取图片
 *
 *  @param name 图片名
 *
 *  @return 无缓存的图片
 */
+ (UIImage *)imageWithFileName:(NSString *)name;

/**
 *  @brief  根据颜色生成纯色图片
 *
 *  @param color 颜色
 *
 *  @return 纯色图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 *  @brief 根据颜色和大小生成纯色图片
 *
 *  @param color 图片颜色
 *
 *  @param size 图片大小
 *
 *  @return 纯色图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 *  @brief 拉伸图片
 *
 *  @param name 图片名字
 *
 *  @return 拉伸好的图片
 */
+ (UIImage *)stretchImageNamed:(NSString *)name;

/**
 *  @brief 拉伸图片
 *
 *  @param image 要拉伸的图片
 *
 *  @return 拉伸好的图片
 */
+ (UIImage *)stretchImageWithImage:(UIImage *)image;

/**
 *  压缩图片
 *
 *  @param image   要压缩的图片
 *  @param newSize 压缩后的图片的像素尺寸
 *
 *  @return 压缩好的图片
 */
+ (UIImage *)resizedImage:(UIImage*)image size:(CGSize)newSize;

/**
 *  压缩图片
 *
 *  @param name    要压缩的图片名字
 *  @param newSize 压缩后的图片的像素尺寸
 *
 *  @return 压缩好的图片
 */
+ (UIImage *)resizedImageName:(NSString *)name size:(CGSize)newSize;

/**
 *  根据image返回一个圆形的头像
 *
 *  @param image     要切割的头像
 *  @param border    边框的宽度
 *  @param color     边框的颜色
 *
 *  @return 切割好的头像
 */
+ (UIImage *)captureCircleImage:(UIImage *)image borderWidth:(CGFloat)border borderColor:(UIColor *)color;

/**
 *  生成毛玻璃效果的图片
 *
 *  @param image      要模糊化的图片
 *  @param blurValue 模糊化指数0~2
 *
 *  @return 返回模糊化之后的图片
 */
+ (UIImage *)blurredImage:(UIImage *)image blurValue:(CGFloat)blurValue;


@end
