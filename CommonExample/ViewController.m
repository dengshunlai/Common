//
//  ViewController.m
//  Common
//
//  Created by 邓顺来 on 2017/6/1.
//  Copyright © 2017年 邓顺来. All rights reserved.
//

#import "ViewController.h"
#import "LabelCell.h"
#import "ButtonCell.h"
#import "LabelTFCell.h"
#import "IconLabelCell.h"
#import "IconTFCell.h"
#import "TextViewCell.h"
#import "TableViewHeader.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupUI {
    self.view.backgroundColor = BG_COLOR;
    _tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.backgroundColor = BG_COLOR;
        tableView.separatorColor = LINE_COLOR;
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.contentInset = UIEdgeInsetsMake(0, 0, 200, 0);
        [tableView registerClass:[LabelCell class] forCellReuseIdentifier:[LabelCell identifierWithContext:self]];
        [tableView registerClass:[ButtonCell class] forCellReuseIdentifier:[ButtonCell identifierWithContext:self]];
        [tableView registerClass:[LabelTFCell class] forCellReuseIdentifier:[LabelTFCell identifierWithContext:self]];
        [tableView registerClass:[IconLabelCell class] forCellReuseIdentifier:[IconLabelCell identifierWithContext:self]];
        [tableView registerClass:[IconTFCell class] forCellReuseIdentifier:[IconTFCell identifierWithContext:self]];
        [tableView registerClass:[TextViewCell class] forCellReuseIdentifier:[TextViewCell identifierWithContext:self]];
        [tableView registerClass:[TableViewHeader class] forHeaderFooterViewReuseIdentifier:[TableViewHeader identifierWithContext:self]];
        tableView.tableFooterView = [UIView new];
        tableView;
    });
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(20, 0, 0, 0));
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        LabelCell *cell = [tableView dequeueReusableCellWithIdentifier:[LabelCell identifierWithContext:self]];
        cell.label.text = @"Label Cell";
        return cell;
    } else if (indexPath.section == 1) {
        LabelTFCell *cell = [tableView dequeueReusableCellWithIdentifier:[LabelTFCell identifierWithContext:self]];
        cell.label.text = @"银行卡号：";
        cell.textField.placeholder = @"请输入银行卡号";
        return cell;
    } else if (indexPath.section == 2) {
        IconLabelCell *cell = [tableView dequeueReusableCellWithIdentifier:[IconLabelCell identifierWithContext:self]];
        cell.icon.image = [UIImage imageNamed:@"profile"];
        cell.label.text = @"我的信息";
        return cell;
    } else if (indexPath.section == 3) {
        IconTFCell *cell = [tableView dequeueReusableCellWithIdentifier:[IconTFCell identifierWithContext:self]];
        cell.icon.image = [UIImage imageNamed:@"password"];
        cell.textField.placeholder = @"请输入密码";
        cell.edge = 20;
        return cell;
    } else if (indexPath.section == 4) {
        TextViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[TextViewCell identifierWithContext:self]];
        //cell.insets = UIEdgeInsetsMake(20, 20, 20, 20);
        return cell;
    } else if (indexPath.section == 5) {
        ButtonCell *cell = [tableView dequeueReusableCellWithIdentifier:[ButtonCell identifierWithContext:self]];
        [cell setClickBtnBlock:^(UIButton *button) {
            NSLog(@"click button");
        }];
        return cell;
    }
    return [UITableViewCell new];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 44;
    } else if (indexPath.section == 1) {
        return 44;
    } else if (indexPath.section == 2) {
        return 44;
    } else if (indexPath.section == 3) {
        return 50;
    } else if (indexPath.section == 4) {
        return 150;
    } else if (indexPath.section == 5) {
        return 50;
    }
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        return 35;
    }
    return 20;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        TableViewHeader *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:[TableViewHeader identifierWithContext:self]];
        header.label.text = @"个人信息";
        header.contentView.backgroundColor = BG_COLOR;
        return header;
    }
    UIView *header = [[UIView alloc] init];
    header.backgroundColor = [UIColor clearColor];
    return header;
}

@end
