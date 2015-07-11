//
//  FingerPaint.m
//  FingerPaint
//
//  Created by Jeff Huang on 2015-07-10.
//  Copyright (c) 2015 Jeff Huang. All rights reserved.
//

#import "FingerPaint.h"

@interface FingerPaint ()

@end

@implementation FingerPaint


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
        self.arrLine = [[NSMutableArray alloc] init];
        self.backgroundColor = [UIColor whiteColor];
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(c, 2);
    CGContextSetStrokeColorWithColor(c, [UIColor redColor].CGColor);
    for (NSArray *line in self.arrLine)
    {
        CGPoint points[2] = { [[line objectAtIndex:0] CGPointValue], [[line objectAtIndex:1] CGPointValue] };
        CGContextAddLines(c, points, 2);
    }
    
    CGContextStrokePath(c);
}


@end
