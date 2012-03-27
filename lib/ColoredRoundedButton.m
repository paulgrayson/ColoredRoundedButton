//
//  ColouredRoundedButton.m
//
//  Created by Paul Grayson on 01/05/2011.
//  Copyright 2011 Grayson Technology Ltd. All rights reserved.
//

#import "ColoredRoundedButton.h"
#import <QuartzCore/QuartzCore.h>
#import "Common.h"

@implementation ColoredRoundedButton

@synthesize titleColor=__titleColor;
@synthesize buttonBackgroundColor=__buttonBackgroundColor;
@synthesize highlightedTitleColor=__highlightedTitleColor;
@synthesize highlightedButtonBackgroundColor=__highlightedButtonBackgroundColor;
@synthesize borderWidth=__borderWidth;
@synthesize borderColor=__borderColour;

- (void) setTitleColor:(UIColor *)color {
    __titleColor = color;
    [self setTitleColor:self.titleColor forState:UIControlStateNormal];
}

- (void) setButtonBackgroundColor:(UIColor *)color {
    __buttonBackgroundColor = color;
    [self setBackgroundColor:self.buttonBackgroundColor];
}

- (void) setHighlightedTitleColor:(UIColor *)color {
    __highlightedTitleColor = color;
    [self setTitleColor:self.highlightedTitleColor forState:UIControlStateHighlighted];    
}

- (void) setReverseWhenHighlightedWithTitleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor
{
    [self setTitleColor:titleColor];
    [self setButtonBackgroundColor:backgroundColor];
    [self setHighlightedTitleColor:backgroundColor];
    [self setHighlightedButtonBackgroundColor:titleColor];
}

- (void) setNeedsLayout { 
    if( !self.borderWidth ) self.borderWidth = 1.5f;
    [self.titleLabel setFont:[UIFont boldSystemFontOfSize:[UIFont labelFontSize]]];
    [self.layer setCornerRadius:10.0f];
    [self.layer setOpacity:(self.enabled ? 1.0 : 0.3)];
    [self.layer setMasksToBounds:YES];
    [self.layer setBorderColor:[self.borderColor CGColor]];
    [self.layer setBorderWidth:self.borderWidth];
    [self addTarget:self action:@selector(highlightButton:) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(dehighlightButton:) forControlEvents:UIControlEventTouchUpInside];    
    [self addTarget:self action:@selector(dehighlightButton:) forControlEvents:UIControlEventTouchCancel];
    [self addTarget:self action:@selector(dehighlightButton:) forControlEvents:UIControlEventTouchUpOutside];
    [super setNeedsLayout];
}

- (void) drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, self.backgroundColor.CGColor);
    CGContextFillRect(context, rect);
    CGContextSetFillColorWithColor(context, [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.07].CGColor);
    CGContextFillRect(context, CGRectMake(rect.origin.x, rect.origin.y + rect.size.height/2.0, rect.size.width, rect.size.height/2.0));    
}

- (void) highlightButton:(id)button {
    [button setBackgroundColor:self.highlightedButtonBackgroundColor];
}

- (void) dehighlightButton:(id)button {
    [button setBackgroundColor:self.buttonBackgroundColor];
}

@end
