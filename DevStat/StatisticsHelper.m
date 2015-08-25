//
//  StatisticsHelper.m
//  DevStat
//
//  Created by Ian Field on 25/08/2015.
//  Copyright (c) 2015 Ian Field. All rights reserved.
//

#import "StatisticsHelper.h"
#import "StatItem.h"

@implementation StatisticsHelper

+(StatItem *) getHardware: (enum HardwareStatItem) item {
    StatItem *statItem = [[StatItem alloc] init];
    
    switch (item) {
        case HSIModel:
            statItem.title = @"Model";
            statItem.value = @"TODO findout";
            break;
            
        default:
            break;
    }

    return statItem;
}


+(StatItem *) getSoftware: (enum SoftwareStatItem) item {
    StatItem *statItem = [[StatItem alloc] init];
    
    switch (item) {
        case SSIOS:
            statItem.title = @"OS";
            statItem.value = @"TODO findout";
            break;
            
        default:
            break;
    }
    
    return statItem;
}

@end
