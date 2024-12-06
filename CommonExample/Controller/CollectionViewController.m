//
//  CollectionViewController.m
//  Common
//
//  Created by dengshunlai on 2017/7/28.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import "CollectionViewController.h"
#import "LabelItem.h"
#import "LabelTFItem.h"
#import "IconLabelItem.h"
#import "IconTFItem.h"
#import "TextViewItem.h"
#import "ButtonItem.h"
#import "CollectionViewHeader.h"

@interface CollectionViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) UICollectionView *collectionView;

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupTopBar {
    [self createTopBar];
    [self.topBar setTitle:@"CollectionView"];
}

- (void)setupUI {
    _collectionView = ({
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        collectionView.dataSource = self;
        collectionView.delegate = self;
        collectionView.backgroundColor = BG_COLOR;
        collectionView.showsVerticalScrollIndicator = YES;
        collectionView.showsHorizontalScrollIndicator = NO;
        collectionView.alwaysBounceVertical = YES;
        collectionView.contentInset = UIEdgeInsetsMake(0, 0, 200, 0);
        [collectionView registerClass:[LabelItem class] forCellWithReuseIdentifier:[LabelItem identifierWithContext:self]];
        [collectionView registerClass:[LabelTFItem class] forCellWithReuseIdentifier:[LabelTFItem identifierWithContext:self]];
        [collectionView registerClass:[IconLabelItem class] forCellWithReuseIdentifier:[IconLabelItem identifierWithContext:self]];
        [collectionView registerClass:[IconTFItem class] forCellWithReuseIdentifier:[IconTFItem identifierWithContext:self]];
        [collectionView registerClass:[TextViewItem class] forCellWithReuseIdentifier:[TextViewItem identifierWithContext:self]];
        [collectionView registerClass:[ButtonItem class] forCellWithReuseIdentifier:[ButtonItem identifierWithContext:self]];
        [collectionView registerClass:[CollectionViewHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[CollectionViewHeader identifierWithContext:self]];
        [collectionView registerClass:[BaseCollectionViewHeaderFooter class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[BaseCollectionViewHeaderFooter identifierWithContext:self]];
        collectionView;
    });
    [self.view addSubview:_collectionView];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(@0);
        make.top.equalTo(self.topBar.mas_bottom);
        make.bottom.equalTo(@0);
    }];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 6;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return 3;
    } else if (section == 1) {
        return 3;
    } else if (section == 2) {
        return 3;
    } else if (section == 3) {
        return 3;
    } else if (section == 4) {
        return 1;
    } else if (section == 5) {
        return 1;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        LabelItem *item = [collectionView dequeueReusableCellWithReuseIdentifier:[LabelItem identifierWithContext:self] forIndexPath:indexPath];
        item.label.text = @"Label Item";
        return item;
    } else if (indexPath.section == 1) {
        LabelTFItem *item = [collectionView dequeueReusableCellWithReuseIdentifier:[LabelTFItem identifierWithContext:self] forIndexPath:indexPath];
        item.label.text = @"银行卡号：";
        item.textField.placeholder = @"请输入银行卡号";
        return item;
    } else if (indexPath.section == 2) {
        IconLabelItem *item = [collectionView dequeueReusableCellWithReuseIdentifier:[IconLabelItem identifierWithContext:self] forIndexPath:indexPath];
        item.icon.image = [UIImage imageNamed:@"profile"];
        item.label.text = @"我的信息";
        return item;
    } else if (indexPath.section == 3) {
        IconTFItem *item = [collectionView dequeueReusableCellWithReuseIdentifier:[IconTFItem identifierWithContext:self] forIndexPath:indexPath];
        item.icon.image = [UIImage imageNamed:@"password"];
        item.textField.placeholder = @"请输入密码";
        item.edge = 20;
        return item;
    } else if (indexPath.section == 4) {
        TextViewItem *item = [collectionView dequeueReusableCellWithReuseIdentifier:[TextViewItem identifierWithContext:self] forIndexPath:indexPath];
        return item;
    } else if (indexPath.section == 5) {
        ButtonItem *item = [collectionView dequeueReusableCellWithReuseIdentifier:[ButtonItem identifierWithContext:self] forIndexPath:indexPath];
        [item setClickBtnBlock:^(UIButton *button) {
            NSLog(@"click button");
        }];
        return item;
    }
    return [UICollectionViewCell new];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        if (kind == UICollectionElementKindSectionHeader) {
            CollectionViewHeader *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[CollectionViewHeader identifierWithContext:self] forIndexPath:indexPath];
            header.label.text = @"个人信息";
            header.backgroundColor = [UIColor clearColor];
            return header;
        }
    }
    BaseCollectionViewHeaderFooter *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[BaseCollectionViewHeaderFooter identifierWithContext:self] forIndexPath:indexPath];
    header.backgroundColor = [UIColor clearColor];
    return header;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return CGSizeMake(kScreenWidth, 44);
    } else if (indexPath.section == 1) {
        return CGSizeMake(kScreenWidth, 44);
    } else if (indexPath.section == 2) {
        return CGSizeMake(kScreenWidth, 44);
    } else if (indexPath.section == 3) {
        return CGSizeMake(kScreenWidth, 50);
    } else if (indexPath.section == 4) {
        return CGSizeMake(kScreenWidth, 150);
    } else if (indexPath.section == 5) {
        return CGSizeMake(kScreenWidth, 50);
    }
    return CGSizeMake(0, 0);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return CGSizeMake(kScreenWidth, 35);
    } else {
        return CGSizeMake(kScreenWidth, 20);
    }
}

@end
