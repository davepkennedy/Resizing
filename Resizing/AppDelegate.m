//
//  AppDelegate.m
//  Resizing
//
//  Created by Dave Kennedy on 06/01/2016.
//  Copyright © 2016 Dave Kennedy. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSView *view;

- (IBAction)showSmall:(id)sender;
- (IBAction)showMedium:(id)sender;
- (IBAction)showLarge:(id)sender;

- (void) resizeToFit:(NSRect) rect;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [self showMedium:self];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)showSmall:(id)sender {
    [self resizeToFit:NSMakeRect(0, 0, 320, 240)];
}

- (IBAction)showMedium:(id)sender {
    [self resizeToFit:NSMakeRect(0, 0, 640, 480)];
}

- (IBAction)showLarge:(id)sender {
    [self resizeToFit:NSMakeRect(0, 0, 800, 600)];
}

- (void) resizeToFit:(NSRect) rect {
    
    NSRect screenFrame = [[NSScreen mainScreen] frame];
    NSRect frame = [NSWindow frameRectForContentRect:rect styleMask:[self.window styleMask]];
    
    CGPoint origin = NSMakePoint((screenFrame.size.width - frame.size.width) / 2,
                                 (screenFrame.size.height - frame.size.height) / 2);
    
    frame.origin = origin;
    
    [self.window setFrame:frame display:YES animate:YES];
}

@end
