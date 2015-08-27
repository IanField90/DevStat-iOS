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
    [self.statistics addObject: [StatisticsHelper getSoftware: SSIOS]];
    [self.statistics addObject: [StatisticsHelper getSoftware: SSIConnection]];
}

@end
