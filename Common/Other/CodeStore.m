//
//  CodeStore.m
//  Common
//
//  Created by dengshunlai on 2017/6/14.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import "CodeStore.h"
#import "BaseNavigationController.h"
#import "BaseTabBarController.h"
#import "BaseViewController.h"

@interface CodeStore ()

//@property (<#strong#>, nonatomic) <#class#> <#name#>;

@end

@implementation CodeStore

+ (void)templateUI {
/*
    <#_tableView#> = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.backgroundColor = BG_COLOR;
        tableView.separatorColor = LINE_COLOR;
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.estimatedRowHeight = 0;
        tableView.estimatedSectionFooterHeight = 0;
        tableView.estimatedSectionHeaderHeight = 0;
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

/*

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
#pragma clang diagnostic pop
 
*/

+ (void)bar {
    UITabBar *tabBarAppearance = [UITabBar appearanceWhenContainedIn:[BaseTabBarController class], nil];
    tabBarAppearance.translucent = NO;
    tabBarAppearance.tintColor = ORANGE_COLOR;
    
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearanceWhenContainedIn:[BaseNavigationController class], nil];
    navigationBarAppearance.translucent = NO;
    navigationBarAppearance.titleTextAttributes = @{NSForegroundColorAttributeName:UIColorFromRGB(0x333333),
                                                    NSFontAttributeName:[UIFont systemFontOfSize:17]};
    navigationBarAppearance.backIndicatorImage = [UIImage imageNamed:@"back"];
    navigationBarAppearance.backIndicatorTransitionMaskImage = [UIImage imageNamed:@"back"];
    navigationBarAppearance.tintColor = ICON_COLOR;
    
    UIBarButtonItem *barButtonItemAppearance = [UIBarButtonItem appearanceWhenContainedIn:[BaseNavigationController class], nil];
    [barButtonItemAppearance setTitleTextAttributes:@{NSForegroundColorAttributeName:ICON_COLOR,
                                                      NSFontAttributeName:[UIFont systemFontOfSize:16]} forState:UIControlStateNormal];
    [barButtonItemAppearance setTitleTextAttributes:@{NSForegroundColorAttributeName:ICON_COLOR,
                                                      NSFontAttributeName:[UIFont systemFontOfSize:16]} forState:UIControlStateHighlighted];
    
    [UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil].title = LString(@"取消");
    [UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil].tintColor = BLUE_COLOR;
    
    if (@available(iOS 11, *)) {
        UIScrollView *scrollViewAppearance = [UIScrollView appearanceWhenContainedIn:[BaseViewController class], nil];
        scrollViewAppearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
}

+ (void)foo {
    ;
}

#pragma mark -
#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [UITableViewCell new];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *header = [[UIView alloc] init];
    header.backgroundColor = [UIColor clearColor];
    return header;
}

#pragma mark -
#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [UICollectionViewCell new];
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(0, 0);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ;
}

@end
