//
//  BaseCollectionViewItem.m
//  Common
//
//  Created by dengshunlai on 2017/6/2.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import "BaseCollectionViewItem.h"

@implementation BaseCollectionViewItem

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialization];
    }
    return self;
}

+ (NSString *)identifierWithContext:(id)context tag:(NSInteger)tag {
    NSMutableString *identifier = [NSMutableString stringWithFormat:@"%@_",NSStringFromClass([self class])];
    if (context == nil) {
        [identifier deleteCharactersInRange:NSMakeRange(identifier.length - 1, 1)];
    } else if ([context isKindOfClass:[NSString class]]) {
        [identifier appendString:context];
    } else {
        [identifier appendString:NSStringFromClass([context class])];
    }
    [identifier appendFormat:@"_%ld",tag];
    return identifier;
}

+ (NSString *)identifierWithContext:(id)context {
    return [self identifierWithContext:context tag:0];
}

- (void)setSeparatorInset:(UIEdgeInsets)separatorInset {
    [_line mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@(separatorInset.left));
        make.bottom.equalTo(@0);
        make.trailing.equalTo(@(-separatorInset.right));
        make.height.equalTo(@0.5);
    }];
}

- (void)initialization {
    [self setupBase];
    [self setupUI];
    [self setupOther];
}

- (void)setupBase {}
- (void)setupUI {
    self.backgroundColor = [UIColor whiteColor];
    
    _line = ({
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = LINE_COLOR;
        view;
    });
    [self.contentView addSubview:_line];
    
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@15);
        make.bottom.equalTo(@0);
        make.trailing.equalTo(@0);
        make.height.equalTo(@0.5);
    }];
}
- (void)setupOther {}

- (void)refreshContent {}
- (void)refreshSizeAndPos {}
- (void)refresh {
    [self refreshContent];
    [self refreshSizeAndPos];
}

@end
