
#import "BTransparentWindow.h"

@implementation BTransparentWindow

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

-(void)mouseDown:(NSEvent *)event
{
	hitLocation = [NSEvent mouseLocation];
}

- (void) mouseDragged: (NSEvent *) event
{
	NSPoint dragLocation = [NSEvent mouseLocation];

	[self setFrameOrigin:NSMakePoint(self.frame.origin.x + dragLocation.x - hitLocation.x,
									 self.frame.origin.y + dragLocation.y - hitLocation.y)];
	hitLocation = dragLocation;
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
