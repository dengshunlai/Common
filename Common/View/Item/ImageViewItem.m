//
//  ImageViewItem.m
//  SunskyAdmin
//
//  Created by dengshunlai on 2017/9/4.
//  Copyright © 2017年 dengshunlai. All rights reserved.
//

#import "ImageViewItem.h"

@implementation ImageViewItem

- (void)setupUI {
    _imageView = ({
        UIImageView *iv = [[UIImageView alloc] init];
        iv.contentMode = UIViewContentModeScaleAspectFill;
        iv.layer.masksToBounds = YES;
        iv.image = [UIImage imageNamed:@"placeholder"];
        iv;
    });
    [self.contentView addSubview:_imageView];
    
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
}

- (void)setEdge:(UIEdgeInsets)edge {
    _edge = edge;
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).insets(edge);
    }];
}

@end
