//
//  SoftwareStatisticsTableViewController.m
//  DevStat
//
//  Created by Ian Field on 25/08/2015.
//  Copyright (c) 2015 Ian Field. All rights reserved.
//

#import "SoftwareStatisticsTableViewController.h"

@interface SoftwareStatisticsTableViewController ()

@end

@implementation SoftwareStatisticsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupStatistics];
    [self reload];
}

- (void) setupStatistics {
    [self.statistics removeAllObjects];
    [self.statistics addObject: [StatisticsHelper getSoftware: SSIOS]];
    [self.statistics addObject: [StatisticsHelper getSoftware: SSIConnection]];
    [self.statistics addObject: [StatisticsHelper getSoftware: SSILocation]];
    [self.statistics addObject: [StatisticsHelper getSoftware: SSIBluetooth]];
}

- (void) reload {
    [self setupStatistics];
    [self.tableView reloadData];

    StatItem *bluetooth = self.statistics.lastObject;
    
    if ([bluetooth.value isEqualToString:@"Fetching..."]) {
        [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(reload) userInfo:nil repeats: NO];
    }

}

@end
