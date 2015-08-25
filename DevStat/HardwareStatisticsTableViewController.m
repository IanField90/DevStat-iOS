//
//  HardwareStatisticsTableViewController.m
//  DevStat
//
//  Created by Ian Field on 25/08/2015.
//  Copyright (c) 2015 Ian Field. All rights reserved.
//

#import "HardwareStatisticsTableViewController.h"

@interface HardwareStatisticsTableViewController ()

@end

@implementation HardwareStatisticsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    StatItem *model = [StatisticsHelper getHardware:HSIModel];
    
    [self.statistics addObject:model];


}



@end
