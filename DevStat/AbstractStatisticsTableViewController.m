//
//  AbstractStatisticsTableViewController.m
//  DevStat
//
//  Created by Ian Field on 25/08/2015.
//  Copyright (c) 2015 Ian Field. All rights reserved.
//

#import "AbstractStatisticsTableViewController.h"

@interface AbstractStatisticsTableViewController ()

@end

@implementation AbstractStatisticsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.statistics = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.statistics count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StatItemCell" forIndexPath:indexPath];
    
    StatItem *statItem = [self.statistics objectAtIndex:indexPath.row];
    cell.textLabel.text = statItem.title;
    cell.detailTextLabel.text = statItem.value;
    
    return cell;
}

@end
