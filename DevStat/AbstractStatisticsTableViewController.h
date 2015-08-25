//
//  AbstractStatisticsTableViewController.h
//  DevStat
//
//  Created by Ian Field on 25/08/2015.
//  Copyright (c) 2015 Ian Field. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StatisticsHelper.h"
#import "StatItem.h"

@interface AbstractStatisticsTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *statistics;

@end
