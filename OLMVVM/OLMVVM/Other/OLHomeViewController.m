//
//  OLHomeViewController.m
//  OLMVVM
//
//  Created by olive on 16/7/11.
//  Copyright © 2016年 olive. All rights reserved.
//

#import "OLHomeViewController.h"

@interface OLHomeViewController ()<UITableViewDelegate, UITableViewDataSource>
/** data */
@property (nonatomic, strong) NSMutableArray *dataArray;
/** tableView */
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation OLHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"MVVM";
    [self navigationConfig];
    [self uiConfig];
}

#pragma mark - ***** UI *****
- (void)navigationConfig {

}

- (void)uiConfig {

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
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
}


#pragma mark - ***** POST *****


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
