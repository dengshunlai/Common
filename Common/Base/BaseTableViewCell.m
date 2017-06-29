//
//  BaseTableViewCell.m
//  Common
//
//  Created by dengshunlai on 2017/6/2.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
        [self setup];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupUI];
    [self setup];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
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

- (void)setupUI {}
- (void)setup {}

@end
