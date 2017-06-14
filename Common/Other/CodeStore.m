//
//  CodeStore.m
//  Common
//
//  Created by dengshunlai on 2017/6/14.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import "CodeStore.h"

@implementation CodeStore

+ (void)templateUI {
/*
    <#_tableView#> = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.backgroundColor = BG_COLOR;
        tableView.separatorColor = LINE_COLOR;
        tableView.dataSource = self;
        tableView.delegate = self;
        [tableView registerClass:[<#cell#> class] forCellReuseIdentifier:<#identifier#>];
        tableView.tableFooterView = [UIView new];
        tableView;
    });

    <#name#> = ({
        UILabel *label = [[UILabel alloc] init];
        label.textColor = X3_COLOR;
        label.font = [UIFont systemFontOfSize:14];
        label.numberOfLines = 1;
        label.textAlignment = NSTextAlignmentLeft;
        label;
    });
 
    <#name#> = ({
        UIImageView *iv = [[UIImageView alloc] init];
        iv.contentMode = UIViewContentModeScaleAspectFill;
        iv.layer.masksToBounds = YES;
        iv.image = [UIImage imageNamed:@"placeholder"];
        iv;
    });
 
    <#_tf#> = ({
        UITextField *tf = [[UITextField alloc] init];
        tf.keyboardType = UIKeyboardTypeDefault;
        tf.borderStyle = UITextBorderStyleNone;
        tf.font = [UIFont systemFontOfSize:14];
        tf.textColor = X3_COLOR;
        tf.returnKeyType = UIReturnKeyDone;
        tf.autocorrectionType = UITextAutocorrectionTypeNo;
        tf.spellCheckingType = UITextSpellCheckingTypeNo;
        tf.autocapitalizationType = UITextAutocapitalizationTypeNone;
        UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 35)];
        UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done:)];
        UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        toolBar.items = @[space, done];
        tf.inputAccessoryView = toolBar;
        tf;
    });
 
    <#_textView#> = ({
        UITextView *textView = [[UITextView alloc] init];
        textView.showsVerticalScrollIndicator = NO;
        textView.showsHorizontalScrollIndicator = NO;
        textView.font = [UIFont systemFontOfSize:14];
        textView.textColor = X3_COLOR;
        textView.returnKeyType = UIReturnKeyDone;
        textView.autocorrectionType = UITextAutocorrectionTypeNo;
        textView.spellCheckingType = UITextSpellCheckingTypeNo;
        textView.autocapitalizationType = UITextAutocapitalizationTypeNone;
        UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 35)];
        UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done:)];
        UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        toolBar.items = @[space, done];
        textView.inputAccessoryView = toolBar;
        textView;
    });
 
    <#_collectionView#> = ({
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        collectionView.dataSource = self;
        collectionView.delegate = self;
        collectionView.backgroundColor = BG_COLOR;
        collectionView.showsVerticalScrollIndicator = NO;
        collectionView.showsHorizontalScrollIndicator = NO;
        [collectionView registerClass:[<#cell#> class] forCellWithReuseIdentifier:<#identifier#>];
        collectionView;
    });

    <#name#> = ({
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        view;
    });
 
    <#name#> = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setTitle:@"" forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        btn;
    });
*/
}

+ (void)foo {
    
}

@end
