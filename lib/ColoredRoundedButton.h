//
//  ColouredRoundedButton.h
//
//  Created by Paul Grayson on 01/05/2011.
//  Copyright 2011 Grayson Technology Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ColoredRoundedButton : UIButton {
    
}
@property (nonatomic, strong, readonly) UIColor *titleColor;
@property (nonatomic, strong, readonly) UIColor *buttonBackgroundColor;

@property (nonatomic, strong, readonly) UIColor *highlightedTitleColor;
@property (nonatomic, strong) UIColor *highlightedButtonBackgroundColor;

@property (nonatomic, assign) CGFloat borderWidth;
@property (nonatomic, strong) UIColor *borderColor;

- (void) setTitleColor:(UIColor *)color;
- (void) setButtonBackgroundColor:(UIColor *)color;
- (void) setHighlightedTitleColor:(UIColor *)color;

- (void) setReverseWhenHighlightedWithTitleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor;

@end
