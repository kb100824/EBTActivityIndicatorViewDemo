//
//  EBTDGActivityInidcatorView.h
//  EBTDGActivityIndicatorViewDemo
//
//  Created by ebaotong on 2017/1/16.
//  Copyright © 2017年 com.csst. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, EBTDGActivityIndicatorAnimationType) {
        EBTDGActivityIndicatorAnimationTypeNineDots,
        EBTDGActivityIndicatorAnimationTypeTriplePulse,
        EBTDGActivityIndicatorAnimationTypeFiveDots,
        EBTDGActivityIndicatorAnimationTypeRotatingSquares,
        EBTDGActivityIndicatorAnimationTypeDoubleBounce,
        EBTDGActivityIndicatorAnimationTypeTwoDots,
        EBTDGActivityIndicatorAnimationTypeThreeDots,
        EBTDGActivityIndicatorAnimationTypeBallPulse,
        EBTDGActivityIndicatorAnimationTypeBallClipRotate,
        EBTDGActivityIndicatorAnimationTypeBallClipRotatePulse,
        EBTDGActivityIndicatorAnimationTypeBallClipRotateMultiple,
        EBTDGActivityIndicatorAnimationTypeBallRotate,
        EBTDGActivityIndicatorAnimationTypeBallZigZag,
        EBTDGActivityIndicatorAnimationTypeBallZigZagDeflect,
        EBTDGActivityIndicatorAnimationTypeBallTrianglePath,
        EBTDGActivityIndicatorAnimationTypeBallScale,
        EBTDGActivityIndicatorAnimationTypeLineScale,
        EBTDGActivityIndicatorAnimationTypeLineScaleParty,
        EBTDGActivityIndicatorAnimationTypeBallScaleMultiple,
        EBTDGActivityIndicatorAnimationTypeBallPulseSync,
        EBTDGActivityIndicatorAnimationTypeBallBeat,
        EBTDGActivityIndicatorAnimationTypeLineScalePulseOut,
        EBTDGActivityIndicatorAnimationTypeLineScalePulseOutRapid,
        EBTDGActivityIndicatorAnimationTypeBallScaleRipple,
        EBTDGActivityIndicatorAnimationTypeBallScaleRippleMultiple,
        EBTDGActivityIndicatorAnimationTypeTriangleSkewSpin,
        EBTDGActivityIndicatorAnimationTypeBallGridBeat,
        EBTDGActivityIndicatorAnimationTypeBallGridPulse,
        EBTDGActivityIndicatorAnimationTypeRotatingSanEBTDGlass,
        EBTDGActivityIndicatorAnimationTypeRotatingTrigons,
        EBTDGActivityIndicatorAnimationTypeTripleRings,
        EBTDGActivityIndicatorAnimationTypeCookieTerminator,
        EBTDGActivityIndicatorAnimationTypeBallSpinFadeLoader
};

@interface EBTDGActivityInidcatorView : UIView


/**
 *  显示多种样式活动指示器
 *  @param alertViewBgColor 指示器弹框背景颜色
 *  @param activityIndicatorType 指示器样式类型
 *  @param indicatorColor        指示器颜色
 *  @param descriptionContent      描述文本内容
 *  @param descriptionTextColor      描述内容文本颜色
 */
+ (void)showActivityIndicatorViewBackGroundColor:(UIColor *)alertViewBgColor withIndicatorType:(EBTDGActivityIndicatorAnimationType)activityIndicatorType withIndicatorColor:(UIColor *)indicatorColor withDescription:(NSString *)descriptionContent withDescriptionTextColor:(UIColor*)descriptionTextColor ;


/**
 *  显示多种样式活动指示器
 *  @param activityIndicatorType 指示器样式类型
 *  @param indicatorColor        指示器颜色
 *  @param descriptionContent      文字描述内容
 *
 */

+ (void)showActivityIndicatorView:(EBTDGActivityIndicatorAnimationType)activityIndicatorType withIndicatorColor:(UIColor *)indicatorColor withDescription:(NSString *)descriptionContent DEPRECATED_MSG_ATTRIBUTE("showActivityIndicatorViewBackGroundColor: withIndicatorType: withIndicatorColor: withDescription: withDescriptionTextColor:") ;


/**
 *  移除活动指示器
 *
 */
+ (void)dismissActivityIndicatorView;
@end
