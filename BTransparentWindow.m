
#import "BTransparentWindow.h"

@implementation BTransparentWindow

-(id)initWithContentRect:(NSRect)contentRect styleMask:(NSUInteger)windowStyle backing:(NSBackingStoreType)bufferingType defer:(BOOL)deferCreation
{
    if (![super initWithContentRect:contentRect
						  styleMask:NSBorderlessWindowMask
							backing:bufferingType
							  defer:deferCreation])
		return nil;

    [self setBackgroundColor: [NSColor clearColor]];
    [self setOpaque:NO];

    return self;
}

@end
