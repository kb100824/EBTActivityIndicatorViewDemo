//
//  EBTActivityInidcatorView.m
//  EBTActivityIndicatorViewDemo
//
//  Created by ebaotong on 2017/1/16.
//  Copyright © 2017年 com.csst. All rights reserved.
//

///在DGActivityIndicatorView的基础上进一步封装
///https://github.com/gontovnik/DGActivityIndicatorView

#import "EBTDGActivityInidcatorView.h"
#import "DGActivityIndicatorView.h"
#define KAlertView_ContentSize  CGSizeMake(150, 100)
#define KActivityIndicatorView_ContentSize  CGSizeMake(40, 40)
@interface EBTDGActivityInidcatorView ()
{
    UIView *alertBackGroundView;//弹框背景view
    DGActivityIndicatorView *activityIndicatorView;//指示器
    UILabel *lbl_Description;//文字描述
}
@end

@implementation EBTDGActivityInidcatorView
+ (EBTDGActivityInidcatorView *)shareInstance{
  
    static EBTDGActivityInidcatorView *indicatorInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        indicatorInstance = [[EBTDGActivityInidcatorView alloc]initWithFrame:CGRectZero];
    });

    return indicatorInstance;
    
    
}

- (instancetype)initWithFrame:(CGRect)frame{
   
    if (self=[super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        self.frame = [UIScreen mainScreen].bounds;
        self.userInteractionEnabled = YES;
       
    }
    return self;
}
- (instancetype)init
{
    if (self = [super init]) {
        
        self.backgroundColor = [UIColor clearColor];
        self.frame = [UIScreen mainScreen].bounds;
        self.userInteractionEnabled = YES;//关闭交互
    }
    
    return self;
    
}



- (void)commonComponentInit:(EBTDGActivityIndicatorAnimationType)activityIndicatorType withIndicatorColor:(UIColor *)indicatorColor withDescription:(NSString *)descriptionContent{
   
    //初始化弹框背景alertBackGroundView
//--------------------------------------------------------------------------------------//
    alertBackGroundView = [UIView new];
    alertBackGroundView.layer.masksToBounds = YES;
    alertBackGroundView.layer.cornerRadius = 3.f;
    alertBackGroundView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    alertBackGroundView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:alertBackGroundView];
    NSDictionary *dict_alertView = @{
                                     @"width":@(KAlertView_ContentSize.width),
                                     @"height":@(KAlertView_ContentSize.height)
                                     };
    
      NSArray *alertView_Width_Constraint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[alertBackGroundView(width)]"
                                                                                    options:0 metrics:dict_alertView
                                                                                      views:NSDictionaryOfVariableBindings(alertBackGroundView,self)];
      NSArray *alertView_Height_Constraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[alertBackGroundView(height)]"
                                                                                     options:0 metrics:dict_alertView
                                                                                       views:NSDictionaryOfVariableBindings(alertBackGroundView,self)];
    
    NSLayoutConstraint *alertView_CenterX = [NSLayoutConstraint constraintWithItem:alertBackGroundView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    
    
    NSLayoutConstraint *alertView_CenterY = [NSLayoutConstraint constraintWithItem:alertBackGroundView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];

    [self addConstraints:@[alertView_CenterX,alertView_CenterY]];
    [self addConstraints:alertView_Width_Constraint];
    [self addConstraints:alertView_Height_Constraint];
    
//--------------------------------------------------------------------------------------//
    
    
    
    
//初始化指示器activityIndicatorView
//--------------------------------------------------------------------------------------//
    activityIndicatorView = [DGActivityIndicatorView new];
    activityIndicatorView.translatesAutoresizingMaskIntoConstraints = NO;
    activityIndicatorView.tintColor = indicatorColor?:[UIColor whiteColor];
    activityIndicatorView.type = [self activityIndicatorType:activityIndicatorType];
    [alertBackGroundView addSubview:activityIndicatorView];
    
    NSDictionary *indicator_Constraint = @{
                                           @"width":@(KActivityIndicatorView_ContentSize.width),
                                           @"height":@(KActivityIndicatorView_ContentSize.height),
                                           @"padding":@((KAlertView_ContentSize.height-KActivityIndicatorView_ContentSize.height)/2.0)
                                           };
    
    
    
    NSArray *indicator_Width_Constraint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[activityIndicatorView(width)]"
                                                                                  options:0 metrics:indicator_Constraint
                                                                                    views:NSDictionaryOfVariableBindings(alertBackGroundView,activityIndicatorView)];
    NSArray *indicator_Height_Constraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-padding-[activityIndicatorView(height)]"
                                                                                   options:0 metrics:indicator_Constraint
                                                                                     views:NSDictionaryOfVariableBindings(alertBackGroundView,activityIndicatorView)];
    
    NSLayoutConstraint *indicator_CenterX = [NSLayoutConstraint constraintWithItem:activityIndicatorView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:alertBackGroundView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    
    
    NSLayoutConstraint *indicator_CenterY = [NSLayoutConstraint constraintWithItem:activityIndicatorView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:alertBackGroundView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    
    [alertBackGroundView addConstraints:indicator_Width_Constraint];
    [alertBackGroundView addConstraints:indicator_Height_Constraint];
    [alertBackGroundView addConstraints:@[indicator_CenterX,indicator_CenterY]];
    
    
    
    //--------------------------------------------------------------------------------------//
    //初始化文字描述lbl_Description
//--------------------------------------------------------------------------------------//
    lbl_Description = [UILabel new];
    lbl_Description.font = [UIFont systemFontOfSize:12];
    lbl_Description.translatesAutoresizingMaskIntoConstraints = NO;
    lbl_Description.textColor = [UIColor whiteColor];
    lbl_Description.text = descriptionContent?:@"加载中...";
    lbl_Description.textAlignment = NSTextAlignmentCenter;
    lbl_Description.translatesAutoresizingMaskIntoConstraints = NO;
    [alertBackGroundView addSubview:lbl_Description];
    NSDictionary *lbl_Constraint = @{
                                      @"width":@(120),
                                      @"height":@(18),
                                      
                                     };
    
    NSArray *lbl_Width_Constraint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[lbl_Description(width)]"
                                                                                  options:0 metrics:lbl_Constraint
                                                                                    views:NSDictionaryOfVariableBindings(alertBackGroundView,lbl_Description)];
    NSArray *lbl_Height_Constraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[lbl_Description(height)]"
                                                                                   options:0 metrics:lbl_Constraint
                                                                                     views:NSDictionaryOfVariableBindings(alertBackGroundView,lbl_Description)];
    
    NSLayoutConstraint *lbl_CenterX = [NSLayoutConstraint constraintWithItem:lbl_Description attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:alertBackGroundView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    
    CGFloat margin = (KAlertView_ContentSize.height - 18-20)/2.0;
    NSLayoutConstraint *lbl_CenterY = [NSLayoutConstraint constraintWithItem:lbl_Description attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:alertBackGroundView attribute:NSLayoutAttributeCenterY multiplier:1 constant:margin];
    
    [alertBackGroundView addConstraints:lbl_Width_Constraint];
    [alertBackGroundView addConstraints:lbl_Height_Constraint];
    [alertBackGroundView addConstraints:@[lbl_CenterX,lbl_CenterY]];
    
    
//--------------------------------------------------------------------------------------//
    

}

- (DGActivityIndicatorAnimationType)activityIndicatorType:(EBTDGActivityIndicatorAnimationType)indicatorType{

    
    DGActivityIndicatorAnimationType tempIndicatorType = DGActivityIndicatorAnimationTypeNineDots;
    
    switch (indicatorType) {
        case EBTDGActivityIndicatorAnimationTypeTwoDots :
            tempIndicatorType = DGActivityIndicatorAnimationTypeTwoDots;
            break;
        case EBTDGActivityIndicatorAnimationTypeTriplePulse :
            tempIndicatorType = DGActivityIndicatorAnimationTypeTriplePulse;
            break;
        case  EBTDGActivityIndicatorAnimationTypeFiveDots :
            tempIndicatorType = DGActivityIndicatorAnimationTypeFiveDots;
            break;
        case EBTDGActivityIndicatorAnimationTypeRotatingSquares :
            tempIndicatorType = DGActivityIndicatorAnimationTypeRotatingSquares;
            break;
        case EBTDGActivityIndicatorAnimationTypeDoubleBounce :
            tempIndicatorType = DGActivityIndicatorAnimationTypeDoubleBounce;
            break;
        case EBTDGActivityIndicatorAnimationTypeThreeDots :
            tempIndicatorType = DGActivityIndicatorAnimationTypeThreeDots;
            break;
        case EBTDGActivityIndicatorAnimationTypeBallPulse :
            tempIndicatorType = DGActivityIndicatorAnimationTypeBallPulse;
            break;
        case EBTDGActivityIndicatorAnimationTypeBallClipRotate :
            tempIndicatorType = DGActivityIndicatorAnimationTypeBallClipRotate;
            break;
        case  EBTDGActivityIndicatorAnimationTypeBallClipRotatePulse :
            tempIndicatorType = DGActivityIndicatorAnimationTypeBallClipRotatePulse;
            break;
        case EBTDGActivityIndicatorAnimationTypeBallClipRotateMultiple :
            tempIndicatorType = DGActivityIndicatorAnimationTypeBallClipRotateMultiple;
            break;
        case EBTDGActivityIndicatorAnimationTypeBallRotate :
            tempIndicatorType = DGActivityIndicatorAnimationTypeBallRotate;
            break;
        case EBTDGActivityIndicatorAnimationTypeBallZigZag :
            tempIndicatorType = DGActivityIndicatorAnimationTypeBallZigZag;
            break;
        case EBTDGActivityIndicatorAnimationTypeBallZigZagDeflect :
            tempIndicatorType = DGActivityIndicatorAnimationTypeBallZigZagDeflect;
            break;
        case EBTDGActivityIndicatorAnimationTypeBallTrianglePath :
            tempIndicatorType = DGActivityIndicatorAnimationTypeBallTrianglePath;
            break;
        case EBTDGActivityIndicatorAnimationTypeBallScale :
            tempIndicatorType = DGActivityIndicatorAnimationTypeBallScale;
            break;
        case  EBTDGActivityIndicatorAnimationTypeLineScale :
            tempIndicatorType = DGActivityIndicatorAnimationTypeLineScale;
            break;
        case EBTDGActivityIndicatorAnimationTypeLineScaleParty :
            tempIndicatorType = DGActivityIndicatorAnimationTypeLineScaleParty;
            break;
        case EBTDGActivityIndicatorAnimationTypeBallScaleMultiple :
            tempIndicatorType = DGActivityIndicatorAnimationTypeBallScaleMultiple;
            break;
        case EBTDGActivityIndicatorAnimationTypeBallPulseSync :
            tempIndicatorType = DGActivityIndicatorAnimationTypeBallPulseSync;
            break;
        case EBTDGActivityIndicatorAnimationTypeBallBeat :
            tempIndicatorType = DGActivityIndicatorAnimationTypeBallBeat;
            break;
        case EBTDGActivityIndicatorAnimationTypeLineScalePulseOut :
            tempIndicatorType = DGActivityIndicatorAnimationTypeLineScalePulseOut;
            break;
        case EBTDGActivityIndicatorAnimationTypeLineScalePulseOutRapid :
            tempIndicatorType = DGActivityIndicatorAnimationTypeLineScalePulseOutRapid;
            break;
        case  EBTDGActivityIndicatorAnimationTypeBallScaleRipple :
            tempIndicatorType = DGActivityIndicatorAnimationTypeBallScaleRipple;
            break;
        case EBTDGActivityIndicatorAnimationTypeBallScaleRippleMultiple :
            tempIndicatorType = DGActivityIndicatorAnimationTypeBallScaleRippleMultiple;
            break;
        case EBTDGActivityIndicatorAnimationTypeTriangleSkewSpin :
            tempIndicatorType = DGActivityIndicatorAnimationTypeTriangleSkewSpin;
            break;
        case EBTDGActivityIndicatorAnimationTypeBallGridBeat :
            tempIndicatorType = DGActivityIndicatorAnimationTypeBallGridBeat;
            break;
        case EBTDGActivityIndicatorAnimationTypeBallGridPulse :
            tempIndicatorType = DGActivityIndicatorAnimationTypeBallGridPulse;
            break;
        case  EBTDGActivityIndicatorAnimationTypeRotatingSanEBTDGlass :
            tempIndicatorType = DGActivityIndicatorAnimationTypeRotatingSandglass;
            break;
        case EBTDGActivityIndicatorAnimationTypeRotatingTrigons :
            tempIndicatorType = DGActivityIndicatorAnimationTypeRotatingTrigons;
            break;
        case EBTDGActivityIndicatorAnimationTypeCookieTerminator :
            tempIndicatorType = DGActivityIndicatorAnimationTypeCookieTerminator;
            break;
        case EBTDGActivityIndicatorAnimationTypeBallSpinFadeLoader :
            tempIndicatorType = DGActivityIndicatorAnimationTypeBallSpinFadeLoader;
            break;
        case EBTDGActivityIndicatorAnimationTypeTripleRings :
            tempIndicatorType = DGActivityIndicatorAnimationTypeTripleRings;
            break;
        default:
             tempIndicatorType = DGActivityIndicatorAnimationTypeTwoDots;
            break;
    }
    
    

    return tempIndicatorType;
}

- (void)dismissIndicatorView
{
    
    [UIView animateWithDuration:0.3 animations:^{
        alertBackGroundView.alpha = 0.f;
        alertBackGroundView.transform = CGAffineTransformMakeScale(0.01f, 0.01f);
       
    } completion:^(BOOL finished) {
        [activityIndicatorView stopAnimating];
        [self removeFromSuperview];
    }];
    
}
- (void)showCustomDGActivityIndicatorView:(EBTDGActivityIndicatorAnimationType)activityIndicatorType withIndicatorColor:(UIColor *)indicatorColor withDescription:(NSString *)descriptionContent{
    
    
    [[EBTDGActivityInidcatorView shareInstance] commonComponentInit:activityIndicatorType withIndicatorColor:indicatorColor withDescription:descriptionContent];
    
    
    UIWindow *keyWindows = [UIApplication sharedApplication].keyWindow;
    [keyWindows addSubview:self];
    alertBackGroundView.alpha = 0;
    alertBackGroundView.transform = CGAffineTransformMakeScale(0.01, 0.01);
    [UIView animateWithDuration:0.3 animations:^{
        alertBackGroundView.alpha = 1.f;
        alertBackGroundView.transform = CGAffineTransformMakeScale(1.f, 1.f);
        
        [activityIndicatorView startAnimating];
        
    }];

    
}

+ (void)showActivityIndicatorView:(EBTDGActivityIndicatorAnimationType)activityIndicatorType withIndicatorColor:(UIColor *)indicatorColor withDescription:(NSString *)descriptionContent{
    
    [[EBTDGActivityInidcatorView shareInstance] showCustomDGActivityIndicatorView:activityIndicatorType withIndicatorColor:indicatorColor withDescription:descriptionContent];

    
    
}
+ (void)dismissActivityIndicatorView{

    [[EBTDGActivityInidcatorView shareInstance] dismissIndicatorView];

}

@end
