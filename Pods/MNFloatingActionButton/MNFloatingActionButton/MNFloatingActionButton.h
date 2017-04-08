//
//  MNFloatingActionButton.h
//  Matt Nydam
//
//  Created by Matthew Nydam on 1/12/14.
//  Copyright (c) 2014 MN. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface MNFloatingActionButton : UIControl

// -- Appearance

// Defaults to plus symbol. Set to nil to remove image completely.
@property (nonatomic, strong) IBInspectable UIImageView *centerImageView;
@property (nonatomic, strong) IBInspectable UIColor *backgroundColor;

// Defaults to background color because I was inspired by this http://ianstormtaylor.com/design-tip-never-use-black/
@property (nonatomic, strong) IBInspectable UIColor *shadowColor;
// Default = 0.6
@property (nonatomic) IBInspectable CGFloat  shadowOpacity;
// Default = 1.5
@property (nonatomic) IBInspectable CGFloat  shadowRadius;

// -- Animation

// Default = 0.85
@property (nonatomic) CGFloat animationScale;
// Default = 0.05f
@property (nonatomic) CGFloat animationDuration;

@end
