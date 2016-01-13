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

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.statistics = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
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

- (BOOL)tableView:(UITableView *)tableView shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (BOOL)tableView:(UITableView *)tableView canPerformAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender
{
    return (action == @selector(copy:));
}

- (void)tableView:(UITableView *)tableView performAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender
{
    if (action == @selector(copy:))
    {
        
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        NSString *value = [NSString stringWithFormat:@"%@: %@", [cell.textLabel.text copy], [cell.detailTextLabel.text copy]];
        NSLog(@"%@ copied!", value);
        [UIPasteboard generalPasteboard].string = value;
    }
}

@end
