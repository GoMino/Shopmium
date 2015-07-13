//
//  UIView+XibConfiguration.m
//  Shopmium
//
//  Created by Amine Bezzarga on 7/12/15.
//  Copyright (c) 2015 Amine Bezzarga. All rights reserved.
//

#import "UIView+XibConfiguration.h"

@implementation UIView (XibConfiguration)

@dynamic borderColor,borderWidth,cornerRadius;

-(void)setBorderColor:(UIColor *)borderColor{
    [self.layer setBorderColor:borderColor.CGColor];
}

-(void)setBorderWidth:(NSInteger)borderWidth{
    [self.layer setBorderWidth:borderWidth];
}

-(void)setCornerRadius:(NSInteger)cornerRadius{
    [self.layer setCornerRadius:cornerRadius];
}

@end
