
#import "BApplicationDelegate.h"
#import "Mail.h"
#import "WebKit/WebKit.h"

@implementation BApplicationDelegate

@synthesize credits;
@synthesize about;
@synthesize window;
@synthesize mailapp;
@synthesize display;

- (void) applicationDidFinishLaunching: (NSNotification *) aNotification
{
	window.level = NSScreenSaverWindowLevel + 2000;
	mailapp = [SBApplication applicationWithBundleIdentifier:@"com.apple.mail"];
	[NSTimer scheduledTimerWithTimeInterval:0.5
									 target:self
								   selector:@selector(update:)
								   userInfo:nil
									repeats:YES];
	NSString *creditsPath = [[NSBundle mainBundle] pathForResource:@"Credits"
															ofType:@"html"];
	NSData *creditsData = [NSData dataWithContentsOfFile:creditsPath];
	[[credits mainFrame] loadData:creditsData
						 MIMEType:@"text/html"
				 textEncodingName:@"UTF-8"
						  baseURL:nil];
}

- (IBAction) showAboutPanel: (id) sender
{
	[about center];
	[about makeKeyAndOrderFront:self];
}

- (void) update: (NSTimer *) timer
{
	if(![mailapp isRunning])
	{
		self.display = @"⚠";
		return;
	}

	NSInteger count = [[mailapp inbox] unreadCount];
	self.display = [NSString stringWithFormat:@"%d", count];
}

@end
