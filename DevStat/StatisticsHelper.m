//
//  StatisticsHelper.m
//  DevStat
//
//  Created by Ian Field on 25/08/2015.
//  Copyright (c) 2015 Ian Field. All rights reserved.
//

#import "StatisticsHelper.h"
@implementation StatisticsHelper

+(StatItem *) getHardware: (enum HardwareStatItem) item {
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
        default:
            break;
    }

    return statItem;
}


+(StatItem *) getSoftware: (enum SoftwareStatItem) item {
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
            
            if(status == NotReachable)
            {
                //No internet
                statItem.value = @"Network not reachable";
            }
            else if (status == ReachableViaWiFi)
            {
                //WiFi
                statItem.value = @"WiFi";
            }
            else if (status == ReachableViaWWAN) 
            {
                //3G
                statItem.value = @"Mobile";
            }
            [reachability stopNotifier];
        }
            break;
            
        default:
            break;
    }
    
    return statItem;
}

@end
