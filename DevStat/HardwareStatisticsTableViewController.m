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
    
    [self.statistics addObject:[StatisticsHelper getHardware:HSIModel]];
    [self.statistics addObject:[StatisticsHelper getHardware:HSIScreenWidth]];
    [self.statistics addObject:[StatisticsHelper getHardware:HSIScreenHeight]];
    [self.statistics addObject:[StatisticsHelper getHardware:HSIScale]];
}



@end
