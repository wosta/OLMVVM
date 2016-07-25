//
//  UIView+OLUtils.m
//  OLMVVM
//
//  Created by olive on 16/7/23.
//  Copyright © 2016年 olive. All rights reserved.
//

#import "UIView+OLUtils.h"

@implementation UIView (OLUtils)
- (CGFloat)currentX {
    return self.frame.origin.x;
}

- (CGFloat)currentY {
    return self.frame.origin.y;
}

- (CGFloat)currentWidth {
    return self.frame.size.width;
}

- (CGFloat)currentHeight {
    return self.frame.size.height;
}

- (CGFloat)currentMaxX {
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)currentMaxY {
    return self.frame.origin.y + self.frame.size.height;
}

@end
