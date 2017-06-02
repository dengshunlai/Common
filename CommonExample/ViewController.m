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
    _tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.backgroundColor = BG_COLOR;
        tableView.separatorColor = LINE_COLOR;
        tableView.dataSource = self;
        tableView.delegate = self;
        [tableView registerClass:[LabelCell class] forCellReuseIdentifier:[LabelCell identifierWithContext:self]];
        [tableView registerClass:[ButtonCell class] forCellReuseIdentifier:[ButtonCell identifierWithContext:self]];
        tableView.tableFooterView = [UIView new];
        tableView;
    });
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 3;
    } else if (section == 1) {
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
    return 20;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *header = [[UIView alloc] init];
    header.backgroundColor = [UIColor clearColor];
    return header;
}

@end
