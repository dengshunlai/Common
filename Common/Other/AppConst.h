//
//  AppConst.h
//  Common
//
//  Created by dengshunlai on 2017/6/19.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#ifndef AppConst_h
#define AppConst_h

#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#define printMethod() NSLog(@"%s", __func__)
#else
#define NSLog(...)
#define printMethod()
#endif

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenCenter CGPointMake(kScreenWidth / 2, kScreenHeight / 2)

#define kScreenShorter (kScreenWidth < kScreenHeight ? kScreenWidth : kScreenHeight)
#define kScreenLonger (kScreenWidth < kScreenHeight ? kScreenHeight : kScreenWidth)

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define UIColorFromRGBA(rgbValue,a) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define RGB(r,g,b)    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]

#define RandColor RGB(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

#define LString(key) NSLocalizedString(key, nil)

#define WEAK_OBJ(obj) __weak typeof(obj) weak_##obj = obj;
#define STRONG_OBJ(obj) __strong typeof(obj) obj = weak_##obj;

#define N_SIGN_IN_SUCCESS @"notification_sign_in_success"

#define KEY_USER @"key_user"

#define NOTICE_LOADING @"loading"
#define NOTICE_SUCCESS @"成功"
#define NOTICE_FAILD @"失败"

#define CODE_SUCCESS 200

#define KVC_WEBVIEW_JSCONTEXT @"documentView.webView.mainFrame.javaScriptContext"

#define BG_COLOR UIColorFromRGB(0xf2f2f2)
#define LINE_COLOR UIColorFromRGB(0xe4e4e4)
#define RED_COLOR UIColorFromRGB(0xf0504c)
#define BLUE_COLOR UIColorFromRGB(0x0080ff)
#define YELLOW_COLOR UIColorFromRGB(0xFFC939)
#define ORANGE_COLOR UIColorFromRGB(0xff8331)
#define SEARCH_COLOR UIColorFromRGB(0xf7f4ef)
#define X3_COLOR UIColorFromRGB(0x333333)
#define X6_COLOR UIColorFromRGB(0x666666)
#define X9_COLOR UIColorFromRGB(0x999999)
#define PLACEHOLDER_COLOR UIColorFromRGB(0xefefef)
#define ICON_COLOR UIColorFromRGB(0x69655E)
#define GREEN_COLOR UIColorFromRGB(0x6FBB2F)

#endif /* AppConst_h */
