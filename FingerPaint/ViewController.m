//
//  ViewController.m
//  FingerPaint
//
//  Created by Jeff Huang on 2015-07-10.
//  Copyright (c) 2015 Jeff Huang. All rights reserved.
//

#import "ViewController.h"
#import "FingerPaint.h"

@interface ViewController ()

@property (nonatomic) FingerPaint* paint;
@property (weak, nonatomic) IBOutlet UIView *drawingBoard;
@property (nonatomic) BOOL hasOrigin;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.paint = [[FingerPaint alloc] initWithFrame:self.drawingBoard.frame];
    [self.drawingBoard addSubview:self.paint];
    //self.hasOrigin = NO;
    
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(processTap:)];
//    
//    [self.view addGestureRecognizer:tapGesture];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    CGPoint point = [[touches anyObject] locationInView:self.paint];
    if ([self.paint.arrLine count] == 0)
        self.paint.pointStart = point;
    else
        self.paint.pointEnd = point;
    self.paint.hasLine = YES;
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    self.paint.pointEnd = [[touches anyObject] locationInView:self.paint];
    [self.paint.arrLine addObject:[NSArray arrayWithObjects:[NSValue valueWithCGPoint:self.paint.pointStart], [NSValue valueWithCGPoint:self.paint.pointEnd], nil]];
    self.paint.pointStart = self.paint.pointEnd;
    self.paint.pointEnd = CGPointZero;
    self.paint.hasLine = NO;
    [self.paint setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    self.paint.pointEnd = [[touches anyObject] locationInView:self.paint];
    [self.paint.arrLine addObject:[NSArray arrayWithObjects:[NSValue valueWithCGPoint:self.paint.pointStart], [NSValue valueWithCGPoint:self.paint.pointEnd], nil]];
    self.paint.pointStart = self.paint.pointEnd;
    self.paint.pointEnd = CGPointZero;
    self.paint.hasLine = NO;
    [self.paint setNeedsDisplay];
}

@end
