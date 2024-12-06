//
//  NavigationBar.m
//  Common
//
//  Created by 邓顺来1992 on 2024/12/5.
//  Copyright © 2024 邓顺来. All rights reserved.
//

#import "NavigationBar.h"

@implementation NavigationBar

- (instancetype)initWithTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        self.titleLabel.text = title;
    }
    return self;
}

- (void)setupUI {
    self.layer.shadowOpacity = 0.1;
    self.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 2);
    self.layer.shadowRadius = 3;
    
    _bgView = ({
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        view;
    });
    _backBtn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"Resource/back.png"] forState:UIControlStateNormal];
        btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        btn;
    });
    _titleLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.textColor = X3_COLOR;
        label.font = [UIFont systemFontOfSize:18];
        label.numberOfLines = 1;
        label.textAlignment = NSTextAlignmentCenter;
        label;
    });
    _bottomLine = ({
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = UIColorFromRGB(0xefefef);
        view;
    });
    [self addSubview:_bgView];
    [self addSubview:_backBtn];
    [self addSubview:_titleLabel];
    [self addSubview:_bottomLine];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_bottom).offset(-44 / 2);
        make.leading.equalTo(@0);
        make.height.equalTo(@44);
        make.width.equalTo(@(44 + 10));
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self.mas_bottom).offset(-44 / 2);
    }];
    [_bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@0);
        make.trailing.equalTo(@0);
        make.bottom.equalTo(@0);
        make.height.equalTo(@1);
    }];
}

- (void)setupOther {
    [_backBtn addTarget:self action:@selector(clickBackBtn:) forControlEvents:UIControlEventTouchUpInside];
}

- (CGSize)intrinsicContentSize {
    return CGSizeMake(kScreenWidth, [DSLTool safeAreaTop] + 44);
}

- (void)clickBackBtn:(UIButton *)sender {
    if (self.clickBackBtnBlock) {
        BOOL isPop = self.clickBackBtnBlock();
        if (isPop) {
            [_vc.navigationController popViewControllerAnimated:YES];
        }
    } else {
        [_vc.navigationController popViewControllerAnimated:YES];
    }
}

- (void)setTitle:(NSString *)title {
    _titleLabel.text = title;
}

@end
