//
//  OptionsTableViewController.m
//  RTGen
//
//  Created by João Guilherme on 21/08/16.
//  Copyright © 2016 João Guilherme Geniselli. All rights reserved.
//

#import "OptionsTableViewController.h"
#import "OptionModel.h"
#import "OptionDataSource.h"
#import "OptionTableViewCell.h"

@interface OptionsTableViewController () <OptionTableViewCellDelegate>

@property (nonatomic) OptionDataSource * optionDataSource;

@end

@implementation OptionsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _optionDataSource = [[OptionDataSource alloc] init];
    self.tableView.tableFooterView = [UIView new];
}

-(void)viewWillDisappear:(BOOL)animated {
    [_optionDataSource updateActiveStates];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _optionDataSource.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OptionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    [cell configureFromModel:_optionDataSource.items[indexPath.row]];
    [cell setDelegate:self];

    return cell;
}

-(void)optionTableViewCellValueChanged:(OptionTableViewCell *)cell {
    NSIndexPath * cellPath = [self.tableView indexPathForCell:cell];
    OptionModel * model = _optionDataSource.items[cellPath.row];
    model.active = @(cell.on);
}

@end
