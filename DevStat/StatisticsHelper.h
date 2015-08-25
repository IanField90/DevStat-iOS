//
//  StatisticsHelper.h
//  DevStat
//
//  Created by Ian Field on 25/08/2015.
//  Copyright (c) 2015 Ian Field. All rights reserved.
//

#import <Foundation/Foundation.h>
@class StatItem;

enum HardwareStatItem : NSUInteger {
    HSIModel = 1
};

enum SoftwareStatItem : NSUInteger {
    SSIOS = 1
};

@interface StatisticsHelper : NSObject
+(StatItem *) getHardware: (enum HardwareStatItem) item;
+(StatItem *) getSoftware: (enum SoftwareStatItem) item;

@end
