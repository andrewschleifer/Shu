
#import "BTransparentWindow.h"

@interface BTransparentWindow ()
@property (assign) NSPoint hitLocation;
@end


@implementation BTransparentWindow

@synthesize hitLocation;

- (id) initWithContentRect: (NSRect) contentRect styleMask: (NSUInteger) windowStyle backing: (NSBackingStoreType) bufferingType defer: (BOOL) deferCreation
{
    if (![super initWithContentRect:contentRect
                          styleMask:NSBorderlessWindowMask
                            backing:bufferingType
                              defer:deferCreation])
        return nil;

    [self setBackgroundColor: [NSColor clearColor]];
    [self setOpaque:NO];
    [self setCollectionBehavior:NSWindowCollectionBehaviorCanJoinAllSpaces];

    return self;
}


- (void) mouseDown: (NSEvent *) event
{
    self.hitLocation = [NSEvent mouseLocation];
}


- (void) mouseDragged: (NSEvent *) event
{
    NSPoint dragLocation = [NSEvent mouseLocation];

    [self setFrameOrigin:NSMakePoint(self.frame.origin.x + dragLocation.x - self.hitLocation.x,
                                     self.frame.origin.y + dragLocation.y - self.hitLocation.y)];
    self.hitLocation = dragLocation;
}


- (void) mouseUp: (NSEvent *) event
{
    if([event clickCount] == 2)
        [[NSWorkspace sharedWorkspace] launchAppWithBundleIdentifier:@"com.apple.mail"
                                                             options:NSWorkspaceLaunchDefault
                                      additionalEventParamDescriptor:nil
                                                    launchIdentifier:NULL];
}

@end
