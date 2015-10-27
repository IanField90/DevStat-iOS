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
#import <Reachability/Reachability.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import <CoreMotion/CoreMotion.h>

@class StatItem;

enum HardwareStatItem : NSUInteger {
    HSIModel,
    HSIScreenWidth,
    HSIScreenHeight,
    HSIScale,
    HSIAccelerometer,
    HSIGyro,
    HSIForceTouch
};

enum SoftwareStatItem : NSUInteger {
    SSIOS,
    SSIConnection,
    SSILocation,
    SSIBluetooth
};


@interface StatisticsHelper : NSObject

@property (nonatomic, retain) CMMotionManager *motionManager;

@property NSString *bluetoothState;
@property NSString *accelerometerState;
@property NSString *gyroState;
@property NSString *deviceMotionState;

+ (StatItem *)getHardware:(enum HardwareStatItem)item;
+ (StatItem *)getSoftware:(enum SoftwareStatItem)item;

+ (StatisticsHelper *)sharedHelper;

@end
