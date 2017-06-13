//
//  ScrollContainerVC.m
//  Common
//
//  Created by dengshunlai on 2017/6/13.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import "ScrollContainerVC.h"
#import "VCItem.h"

@interface ScrollContainerVC () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation ScrollContainerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupUI {
    _sg =[[HMSegmentedControl alloc] init];
    _sg.backgroundColor = UIColorFromRGB(0xfcfcfc);
    _sg.titleTextAttributes = @{NSForegroundColorAttributeName:X3_COLOR,NSFontAttributeName:[UIFont systemFontOfSize:15]};
    _sg.selectedTitleTextAttributes = @{NSForegroundColorAttributeName:ORANGE_COLOR};
    _sg.selectionIndicatorColor = ORANGE_COLOR;
    _sg.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    _sg.segmentWidthStyle = HMSegmentedControlSegmentWidthStyleFixed;
    _sg.selectionIndicatorHeight = 2;
    [self.view addSubview:_sg];
    WEAK_OBJ(self)
    [_sg setIndexChangeBlock:^(NSInteger index) {
        [weak_self.cv scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0] atScrollPosition:0 animated:YES];
    }];
    
    _sgLine = [[UIView alloc] init];
    _sgLine.backgroundColor = LINE_COLOR;
    [_sg addSubview:_sgLine];
    [_sgLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.equalTo(_sg);
        make.height.equalTo(@0.5);
    }];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _cv = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    _cv.showsVerticalScrollIndicator = NO;
    _cv.showsHorizontalScrollIndicator = NO;
    _cv.dataSource = self;
    _cv.delegate = self;
    _cv.pagingEnabled = YES;
    _cv.bounces = NO;
    [self.view addSubview:_cv];
    
    _containerView = _cv;
}

- (void)setViewControllers:(NSArray<UIViewController *> *)viewControllers {
    _viewControllers = viewControllers;
    for (NSInteger i = 0; i < _viewControllers.count; i++) {
        [_cv registerClass:[VCItem class] forCellWithReuseIdentifier:[VCItem identifierWithContext:[NSString stringWithFormat:@"%@_%ld",self.class,i]]];
    }
    [_cv reloadData];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _viewControllers.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    VCItem *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[VCItem identifierWithContext:[NSString stringWithFormat:@"%@_%ld",self.class,indexPath.row]]
                                                             forIndexPath:indexPath];
    if (!cell.vc) {
        UIViewController *vc = _viewControllers[indexPath.row];
        cell.vc = vc;
        [self addChildViewController:vc];
        [cell.contentView addSubview:vc.view];
        [vc didMoveToParentViewController:self];
        [vc.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(cell.contentView);
        }];
    }
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(collectionView.frame.size.width, collectionView.frame.size.height);
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

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = lround(scrollView.contentOffset.x / scrollView.frame.size.width);
    [_sg setSelectedSegmentIndex:index animated:YES];
}

@end
