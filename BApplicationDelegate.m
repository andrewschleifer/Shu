
#import "BApplicationDelegate.h"
#import "Mail.h"

@implementation BApplicationDelegate

@synthesize window;
@synthesize display;

-(void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	window.level = NSScreenSaverWindowLevel + 2000;
	mail = [SBApplication applicationWithBundleIdentifier:@"com.apple.mail"];
	[NSTimer scheduledTimerWithTimeInterval:0.5
									 target:self
								   selector:@selector(update:)
								   userInfo:nil
									repeats:YES];
}

-(void)update:(NSTimer *)timer
{
	if(![mail isRunning])
	{
		self.display = @"⚠";
		return;
	}

	NSInteger count = [[mail inbox] unreadCount];
	self.display = [NSString stringWithFormat:@"%d", count];
}

@end
