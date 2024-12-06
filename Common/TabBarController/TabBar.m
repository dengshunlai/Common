//
//  TabBar.m
//  Common
//
//  Created by 邓顺来1992 on 2024/12/5.
//  Copyright © 2024 邓顺来. All rights reserved.
//

#import "TabBar.h"

@implementation TabBar

- (void)setupBase {
    _itemList = @[].mutableCopy;
}

- (void)setupUI {
    self.backgroundColor = [UIColor whiteColor];
    self.layer.shadowOpacity = 0.1;
    self.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, -2);
    
    _topLine = ({
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = UIColorFromRGB(0xe4e4e4);
        view;
    });
    [self addSubview:_topLine];
    
    [_topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@0);
        make.trailing.equalTo(@0);
        make.top.equalTo(@0);
        make.height.equalTo(@0.5);
    }];
}

- (void)refreshSizeAndPos {
    CGFloat itemHeight = 49.0;
    CGFloat itemWidth = 0.0;
    CGFloat itemSpacing = 0.0;
    NSInteger itemCount = _itemList.count;
    if (itemCount <= 4) {
        itemWidth = self.frame.size.width / 4.0;
    } else {
        itemWidth = self.frame.size.width / itemCount;
    }
    if (itemCount <= 3) {
        itemSpacing = (self.frame.size.width - itemWidth * itemCount) / (itemCount + 1);
    }
    for (NSInteger idx = 0; idx < itemCount; idx++) {
        UIControl *item = _itemList[idx];
        CGFloat x = itemSpacing + (itemSpacing + itemWidth) * idx;
        item.frame = CGRectMake(x, 0, itemWidth, itemHeight);
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self refreshSizeAndPos];
}

- (void)addItem:(TabBarItem *)item {
    if (_itemList.count <= 0) {
        item.isSel = YES;
    }
    [_itemList addObject:item];
    [self addSubview:item];
    [item addTarget:self action:@selector(clickItem:) forControlEvents:(UIControlEventTouchUpInside)];
}

- (void)clickItem:(TabBarItem *)sender {
    for (TabBarItem *item in _itemList) {
        item.isSel = NO;
    }
    sender.isSel = YES;
    if (_onClickItem) {
        NSInteger idx = [_itemList indexOfObject:sender];
        _onClickItem(idx, sender);
    }
}

@end


@implementation TabBarItem

- (instancetype)initWithText:(NSString *)text
                       image:(UIImage *)image
                    selImage:(UIImage *)selImage
                       color:(UIColor *)color
                    selColor:(UIColor *)selColor
{
    self = [super init];
    if (self) {
        [self initialization];
        _image = image;
        _selImage = selImage;
        _color = color;
        _selColor = selColor;
        _iv.image = image;
        _label.text = text;
    }
    return self;
}

- (void)initialization {
    [self setupUI];
}

- (void)setupUI {
    self.backgroundColor = [UIColor clearColor];
    
    _iv = ({
        UIImageView *iv = [[UIImageView alloc] init];
        iv.contentMode = UIViewContentModeScaleAspectFit;
        iv;
    });
    _label = ({
        UILabel *label = [[UILabel alloc] init];
        label.textColor = X3_COLOR;
        label.font = [UIFont systemFontOfSize:12];
        label.numberOfLines = 1;
        label.textAlignment = NSTextAlignmentCenter;
        label.adjustsFontSizeToFitWidth = YES;
        label;
    });
    [self addSubview:_iv];
    [self addSubview:_label];
    
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(@-2);
        make.leading.greaterThanOrEqualTo(@0);
    }];
    [_iv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(@2);
        make.leading.equalTo(@0);
        make.trailing.equalTo(@0);
        make.height.equalTo(@30);
    }];
}

- (void)setIsSel:(BOOL)isSel {
    _isSel = isSel;
    if (_isSel) {
        _iv.image = _selImage;
        _label.textColor = _selColor;
    } else {
        _iv.image = _image;
        _label.textColor = _color;
    }
}

@end
