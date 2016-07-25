//
//  OLHomeViewController.m
//  OLMVVM
//
//  Created by olive on 16/7/11.
//  Copyright © 2016年 olive. All rights reserved.
//

#import "OLHomeViewController.h"
#import "OLHomeViewModel.h"
#import "OLHomeTableViewCell.h"

static NSString *OLHomeTableViewCellReuseIdentifierID = @"OLHomeTableViewCellReuseIdentifierID";

@interface OLHomeViewController ()<UITableViewDelegate, UITableViewDataSource>
/** data */
@property (nonatomic, strong) NSMutableArray *dataArray;
/** tableView */
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation OLHomeViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.dataArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"MVVM";
    self.view.backgroundColor = [UIColor whiteColor];
    [self navigationConfig];
    [self uiConfig];
    [self requestData];
}

#pragma mark - ***** UI *****
- (void)navigationConfig {
    UIButton *settingButton;
    settingButton = ({
        settingButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 23, 23)];
        [settingButton setImage:[UIImage imageNamed:@"navigationbar_setting"] forState:UIControlStateNormal];
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:settingButton];
        self.navigationItem.rightBarButtonItem = item;
        settingButton;
    });
}

- (void)uiConfig {
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        tableView.dataSource = self;
        tableView.delegate = self;
        [tableView registerClass:[OLHomeTableViewCell class] forCellReuseIdentifier:OLHomeTableViewCellReuseIdentifierID];
        tableView;
    });
    [self.view addSubview:self.tableView];
}

#pragma mark - ***** Delegate *****
#pragma mark - tableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OLHomeTableViewCell *homeTabelViewCell = [tableView dequeueReusableCellWithIdentifier:OLHomeTableViewCellReuseIdentifierID forIndexPath:indexPath];
    [homeTabelViewCell setHomeModel:self.dataArray[indexPath.row]];
    return  homeTabelViewCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
}

#pragma mark - ***** POST *****
#pragma mark - ***** request Data *****
- (void)requestData {
    OLHomeViewModel *homeViewModel = [[OLHomeViewModel alloc] init];
    __weak typeof(self) weakSelf = self;
    [homeViewModel handleData:^(NSArray *array) {
        [weakSelf.dataArray removeAllObjects];
        [weakSelf.dataArray addObjectsFromArray:array];
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.tableView reloadData];
        });
    } failure:^(NSError *error) {
        NSLog(@"error:%@", error.description);
    }];
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
