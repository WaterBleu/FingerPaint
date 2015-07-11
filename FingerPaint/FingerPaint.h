//
//  FingerPaint.h
//  FingerPaint
//
//  Created by Jeff Huang on 2015-07-10.
//  Copyright (c) 2015 Jeff Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FingerPaint : UIView

@property (nonatomic) BOOL hasLine;
@property (nonatomic) NSMutableArray *arrLine;
@property (nonatomic) CGPoint pointStart;
@property (nonatomic) CGPoint pointEnd;

@end
