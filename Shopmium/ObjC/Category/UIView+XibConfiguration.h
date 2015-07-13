//
//  UIView+XibConfiguration.h
//  Shopmium
//
//  Created by Amine Bezzarga on 7/12/15.
//  Copyright (c) 2015 Amine Bezzarga. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XibConfiguration)

@property (nonatomic) IBInspectable UIColor *borderColor;
@property (nonatomic) IBInspectable NSInteger borderWidth;
@property (nonatomic) IBInspectable NSInteger cornerRadius;

@end
