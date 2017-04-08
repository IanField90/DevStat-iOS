//
//  CustomTabBarController.m
//  DevStat
//
//  Created by Ian Field on 07/09/2015.
//  Copyright (c) 2015 Ian Field. All rights reserved.
//

#import "CustomTabBarController.h"
#import "StatisticsHelper.h"
#import "DevStat-Swift.h"
#import <MNFloatingActionButton/MNFloatingActionButton.h>
#import <MessageUI/MessageUI.h>

const CGFloat kFABDiameter = 50;

@interface CustomTabBarController ()

@property (nonatomic, strong) MNFloatingActionButton *button;

@end

@implementation CustomTabBarController

- (void)dealloc
{
    _button = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.button = [[MNFloatingActionButton alloc] init];
    self.button.backgroundColor = [Constants purple];
    self.button.centerImageView.image = [UIImage imageNamed:@"ic_share"];
    self.button.animationScale = 1.10f;
    
    [self.button addTarget:self action:@selector(sendEmail:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.button];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGFloat baseline = self.tabBar.frame.size.height;
    CGFloat originY = self.view.frame.size.height - baseline - 65;
    CGFloat originX = (self.view.frame.size.width - kFABDiameter) / 2;
    
    self.button.frame = CGRectMake(originX, originY, kFABDiameter, kFABDiameter);
}

- (void)sendEmail:(MNFloatingActionButton *)button
{
    NSMutableArray *softwareStatistics = [[NSMutableArray alloc] init];
    [softwareStatistics addObject:[StatisticsHelper getSoftware:SSIOS]];
    [softwareStatistics addObject:[StatisticsHelper getSoftware:SSIConnection]];
    [softwareStatistics addObject:[StatisticsHelper getSoftware:SSILocation]];
    // Note: Can't do this as of yet as it is async
//    [softwareStatistics addObject:[StatisticsHelper getSoftware:SSIBluetooth]];

    NSMutableArray *hardwareStatistics = [[NSMutableArray alloc] init];
    [hardwareStatistics addObject:[StatisticsHelper getHardware:HSIModel]];
    [hardwareStatistics addObject:[StatisticsHelper getHardware:HSIScreenWidth]];
    [hardwareStatistics addObject:[StatisticsHelper getHardware:HSIScreenHeight]];
    [hardwareStatistics addObject:[StatisticsHelper getHardware:HSIScale]];
    [hardwareStatistics addObject:[StatisticsHelper getHardware:HSIAccelerometer]];
    [hardwareStatistics addObject:[StatisticsHelper getHardware:HSIGyro]];
    
    NSString *emailTitle = @"DevStat information";
    
    NSString *messageBody = @"HARDWARE";
    
    for (StatItem *stat in hardwareStatistics) {
        messageBody = [messageBody stringByAppendingString: [NSString stringWithFormat:@"\n%@: %@", stat.title, stat.value]];
    }
    
    messageBody = [messageBody stringByAppendingString:@"\n\nSOFTWARE"];
    for (StatItem *stat in softwareStatistics) {
        messageBody = [messageBody stringByAppendingString: [NSString stringWithFormat:@"\n%@: %@", stat.title, stat.value]];
    }
    
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    
    if (mc && [MFMailComposeViewController canSendMail]) {
        mc.mailComposeDelegate = self;
        [mc setSubject:emailTitle];
        [mc setMessageBody:messageBody isHTML:NO];
        
        // Present mail view controller on screen
        [self presentViewController:mc animated:YES completion:NULL];
    }
}


- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result) {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
