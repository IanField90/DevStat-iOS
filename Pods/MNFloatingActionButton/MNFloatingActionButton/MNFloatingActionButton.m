//
//  MNFloatingActionButton.m
//  Matt Nydam
//
//  Created by Matthew Nydam on 1/12/14.
//  Copyright (c) 2014 MN. All rights reserved.
//

#import "MNFloatingActionButton.h"

typedef NS_ENUM(NSInteger, ShadowState) {
    ShadowStateShown,
    ShadowStateHidden
};

@interface MNFloatingActionButton ()

@property (nonatomic) BOOL isAnimating;

@property (nonatomic, strong) UIView *backgroundCircle;

- (void)animateToSelectedState;
- (void)animateToDeselectedState;

- (void)toggleShadowAnimationToState:(ShadowState)state;

@end

static const CGFloat animationDuration = 0.05f;
static const CGFloat animationScale = 0.85f;
static const CGFloat shadowOpacity = 0.6f;
static const CGFloat shadowRadius = 1.5f;

@implementation MNFloatingActionButton

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
    
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    self.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.4f];
    self.backgroundColor = [UIColor colorWithRed:33.0f/255.0f green:150.0f/255.0f blue:243.0f/255.0f alpha:1.0f];
    self.backgroundCircle.backgroundColor = self.backgroundColor;

    self.shadowOpacity = shadowOpacity;
    self.shadowRadius = shadowRadius;
    self.animationScale = animationScale;
    self.animationDuration = animationDuration;
    
    [self.backgroundCircle addSubview:self.centerImageView];
    [self addSubview:self.backgroundCircle];
}

#pragma mark - Layout

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.centerImageView.center = self.backgroundCircle.center;

    if (!self.isAnimating) {
        
        self.backgroundCircle.frame = self.bounds;
        self.backgroundCircle.layer.cornerRadius = self.bounds.size.height/2;
        
        [self.backgroundCircle.layer setShadowColor:self.shadowColor ? self.shadowColor.CGColor : self.backgroundColor.CGColor];
        [self.backgroundCircle.layer setShadowOpacity:self.shadowOpacity];
        [self.backgroundCircle.layer setShadowRadius:self.shadowRadius];
        [self.backgroundCircle.layer setShadowOffset:CGSizeMake(1.0, 1.0)];
    }
}

#pragma mark - Touch Events

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self animateToSelectedState];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    [self animateToDeselectedState];
    [self sendActionsForControlEvents:UIControlEventTouchUpInside];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    [self animateToDeselectedState];
    [self sendActionsForControlEvents:UIControlEventTouchCancel];
}

#pragma mark - Animate states

- (void)animateToSelectedState
{
    self.isAnimating = YES;
    [self toggleShadowAnimationToState:ShadowStateHidden];
    [UIView animateWithDuration:animationDuration animations:^{
        self.backgroundCircle.transform = CGAffineTransformMakeScale(self.animationScale, self.animationScale);
    } completion:^(BOOL finished) {
        self.isAnimating = NO;
    }];
}

- (void)animateToDeselectedState
{
    self.isAnimating = YES;
    [self toggleShadowAnimationToState:ShadowStateShown];
    [UIView animateWithDuration:animationDuration animations:^{
        self.backgroundCircle.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    } completion:^(BOOL finished) {
        self.isAnimating = NO;
    }];
}

- (void)toggleShadowAnimationToState:(ShadowState)state
{
    CGFloat endOpacity = 0.0f;
    if (state == ShadowStateShown) {
        endOpacity = self.shadowOpacity;
    }
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"shadowOpacity"];
    animation.fromValue = [NSNumber numberWithFloat:self.shadowOpacity];
    animation.toValue = [NSNumber numberWithFloat:endOpacity];
    animation.duration = animationDuration;
    [self.backgroundCircle.layer addAnimation:animation forKey:@"shadowOpacity"];
    self.backgroundCircle.layer.shadowOpacity = endOpacity;
    
}

#pragma mark - Setters

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    _backgroundColor = backgroundColor;
    _backgroundCircle.backgroundColor = _backgroundColor;
}


#pragma mark - Getters

- (UIView *)backgroundCircle
{
    if (!_backgroundCircle) {
        _backgroundCircle = [UIView new];
    }
    return _backgroundCircle;
}

- (UIImageView *)centerImageView
{
    if (!_centerImageView) {
        _centerImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"plus"]];
    }
    return _centerImageView;
}

@end
