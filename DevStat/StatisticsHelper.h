//
//  StatisticsHelper.h
//  DevStat
//
//  Created by Ian Field on 25/08/2015.
//  Copyright (c) 2015 Ian Field. All rights reserved.
//
#import "StatisticsHelper.h"
#import "StatItem.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Reachability.h"
#import <CoreLocation/CoreLocation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@class StatItem;

enum HardwareStatItem : NSUInteger {
    HSIModel,
    HSIScreenWidth,
    HSIScreenHeight,
    HSIScale
};

enum SoftwareStatItem : NSUInteger {
    SSIOS,
    SSIConnection,
    SSILocation,
    SSIBluetooth
};

@interface StatisticsHelper : NSObject
+(StatItem *) getHardware: (enum HardwareStatItem) item;
+(StatItem *) getSoftware: (enum SoftwareStatItem) item;


@property (nonatomic, retain) CBCentralManager *bluetoothManager;
+(StatisticsHelper *) sharedHelper;

@end
