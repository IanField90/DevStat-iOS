//
//  StatisticsHelper.m
//  DevStat
//
//  Created by Ian Field on 25/08/2015.
//  Copyright (c) 2015 Ian Field. All rights reserved.
//

#import "StatisticsHelper.h"

@interface StatisticsHelper () <CBCentralManagerDelegate>

@property (nonatomic, retain) CBCentralManager *bluetoothManager;

@end

@implementation StatisticsHelper

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.bluetoothManager = [[CBCentralManager alloc] initWithDelegate:self
                                                                     queue:nil
                                                                   options: @{CBCentralManagerOptionShowPowerAlertKey: @0}];
        self.motionManager = [[CMMotionManager alloc] init];
    }
    return self;
}

+ (StatisticsHelper *)sharedHelper
{
    static StatisticsHelper *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

+ (StatItem *)getHardware:(enum HardwareStatItem)item
{
    StatItem *statItem = [[StatItem alloc] init];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];

    switch (item) {
        case HSIModel:
            statItem.title = @"Model";
            statItem.value = [UIDevice currentDevice].model;
            break;
            
        case HSIScreenWidth:
            statItem.title = @"Screen Width";
            statItem.value = [NSString stringWithFormat: @"%.0f", screenRect.size.width];
            break;
            
        case HSIScreenHeight:
            statItem.title = @"Screen Height";
            statItem.value = [NSString stringWithFormat: @"%.0f", screenRect.size.height];
            break;
        
        case HSIScale:
            statItem.title = @"Scale";
            statItem.value = [NSString stringWithFormat: @"@%.1fx", [[UIScreen mainScreen] scale]];
            break;
            
        case HSIAccelerometer:
            statItem.title = @"Accelerometer";
            statItem.value = self.sharedHelper.motionManager.accelerometerAvailable ? @"Yes" : @"No";
            break;
            
        case HSIGyro:
            statItem.title = @"Gyro";
            statItem.value = self.sharedHelper.motionManager.gyroAvailable ? @"Yes" : @"No";
            break;

            // Not really needed - left for information, as this is accelerometer + gyro
//        case HSIDeviceMotion:
//            statItem.title = @"Device Motion";
//            statItem.value = self.sharedHelper.motionManager.deviceMotionAvailable ? @"Yes" : @"No";
//            break;
            
        case HSIForceTouch: {
                statItem.title = @"Force Touch";
                UIView *view = [UIApplication sharedApplication].keyWindow.rootViewController.view;
                switch (view.traitCollection.forceTouchCapability) {
                    case UIForceTouchCapabilityAvailable:
                        statItem.value = @"Available";
                        break;
                    case UIForceTouchCapabilityUnavailable:
                        statItem.value = @"Unavailable";
                        break;
                    case UIForceTouchCapabilityUnknown:
                        statItem.value = @"Unknown";
                        break;
                }
            }
            break;
        default:
            break;
    }

    return statItem;
}

+ (StatItem *)getSoftware:(enum SoftwareStatItem)item
{
    StatItem *statItem = [[StatItem alloc] init];
    
    switch (item) {
        case SSIOS:
            statItem.title = [UIDevice currentDevice].systemName;
            statItem.value = [UIDevice currentDevice].systemVersion;
            break;
            
        case SSIConnection: {
            statItem.title = @"Connectivity";
            Reachability *reachability = [Reachability reachabilityForInternetConnection];
            [reachability startNotifier];

            NetworkStatus status = [reachability currentReachabilityStatus];
            
            if (status == NotReachable) {
                // No Internet
                statItem.value = @"Network not reachable";
            } else if (status == ReachableViaWiFi) {
                // WiFi
                statItem.value = @"WiFi";
            } else if (status == ReachableViaWWAN)  {
                // 3G
                statItem.value = @"Mobile";
            }
            [reachability stopNotifier];
        }
            break;
        case SSILocation:
            statItem.title = @"Location services enabled";
            if ([CLLocationManager locationServicesEnabled]) {
                statItem.value = @"Yes";
            } else {
                statItem.value = @"No";
            }
            break;
        case SSIBluetooth: {
            statItem.title = @"Bluetooth";
            statItem.value = self.sharedHelper.bluetoothState == nil ? @"Fetching..." : self.sharedHelper.bluetoothState;
        }
            break;
            
        default:
            break;
    }
    
    return statItem;
}



#pragma mark - CBCentralManagerDelegate

- (void)centralManagerDidUpdateState:(CBCentralManager *)central
{
    // This delegate method will monitor for any changes in bluetooth state and respond accordingly
    switch(_bluetoothManager.state)
    {
        case CBManagerStatePoweredOn:
            self.bluetoothState = @"Powered on";
            break;
        case CBManagerStatePoweredOff:
            self.bluetoothState = @"Powered off";
            break;
        case CBManagerStateResetting:
            self.bluetoothState = @"Resetting";
            break;
        case CBManagerStateUnsupported:
            self.bluetoothState = @"Unsupported";
            break;
        case CBManagerStateUnauthorized:
            self.bluetoothState = @"Unauthorized";
            break;
            
        default:
            self.bluetoothState = @"Unknown";
            break;
    }
    NSLog(@"Bluetooth State: %@", self.bluetoothState);
}

@end
