//
//  SizeInfoView.m
//  Resizing
//
//  Created by Dave Kennedy on 06/01/2016.
//  Copyright © 2016 Dave Kennedy. All rights reserved.
//

#import "SizeInfoView.h"

@implementation SizeInfoView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    NSRect bounds = [self bounds];
    NSString* info = [NSString stringWithFormat:@"Width: %f Height: %f", bounds.size.width, bounds.size.height];
    NSSize size = [info sizeWithAttributes:nil];
    NSPoint pt = NSMakePoint((bounds.size.width - size.width) / 2,
                             (bounds.size.height - size.height) / 2);
    [info drawAtPoint:pt withAttributes:nil];
    NSBezierPath* path = [NSBezierPath bezierPathWithRect:bounds];
    [path setLineWidth:5];
    [[NSColor redColor] setStroke];
    [path stroke];
}

@end
