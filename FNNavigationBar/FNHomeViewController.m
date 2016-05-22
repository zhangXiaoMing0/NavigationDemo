//
//  FNHomeViewController.m
//  FNNavigationBar
//
//  Created by zmx on 16/1/24.
//  Copyright © 2016年 zmx. All rights reserved.
//

#import "FNHomeViewController.h"
#import "FNHeaderView.h"

static NSString *tableViewCell = @"UITableViewCell";
static CGFloat headerViewHeight = 100.f;

@interface FNHomeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) UIView *navigationView;
@property (nonatomic ,strong) FNHeaderView *headerView;

@end

@implementation FNHomeViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    [self setUp];
    _navigationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 64)];
    _navigationView.backgroundColor = [UIColor orangeColor];
    _navigationView.alpha = 0;
    [self.view addSubview:_navigationView];
    
}

- (void)setUp
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableHeaderView = self.headerView;
    [self.view addSubview:_tableView];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:tableViewCell];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewCell];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetHeight = scrollView.contentOffset.y;
    if (offsetHeight>0&&offsetHeight<=1) {
        _navigationView.alpha = 0;
    }else if (offsetHeight<=headerViewHeight){
        _navigationView.alpha = offsetHeight/100;
    }else if (offsetHeight>headerViewHeight){
        _navigationView.alpha = 1;
    }
    
    if (offsetHeight<0) {
        _headerView.contentView.frame = CGRectMake(offsetHeight, offsetHeight, Main_Screen_Width-offsetHeight*2, headerViewHeight-offsetHeight);
    }
}

- (UIView *)headerView
{
    if (!_headerView) {
        _headerView = [[FNHeaderView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, headerViewHeight)];
        _headerView.backgroundColor = [UIColor purpleColor];
    }
    return _headerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
