
#import "BApplicationDelegate.h"
#import "Mail.h"

@implementation BApplicationDelegate


@synthesize mailapp;
@synthesize display;
@synthesize creditsView;
@synthesize aboutPanel;
@synthesize window;


- (void) applicationDidFinishLaunching: (NSNotification *) aNotification
{
    window.level = NSScreenSaverWindowLevel + 2000;
    self.mailapp = [SBApplication applicationWithBundleIdentifier:@"com.apple.mail"];
    [NSTimer scheduledTimerWithTimeInterval:0.5
                                     target:self
                                   selector:@selector(update:)
                                   userInfo:nil
                                    repeats:YES];
    NSString *creditsPath = [[NSBundle mainBundle] pathForResource:@"Credits"
                                                            ofType:@"html"];
    NSData *creditsData = [NSData dataWithContentsOfFile:creditsPath];
    [self.creditsView.mainFrame loadData:creditsData
                              MIMEType:@"text/html"
                      textEncodingName:@"UTF-8"
                               baseURL:nil];
}


- (IBAction) showAboutPanel: (id) sender
{
    [self.aboutPanel center];
    [self.aboutPanel makeKeyAndOrderFront:self];
}


- (void) update: (NSTimer *) timer
{
    if(![self.mailapp isRunning])
    {
        self.display = @"⚠";
        return;
    }

    NSInteger count = [[self.mailapp inbox] unreadCount];
    self.display = [NSString stringWithFormat:@"%d", count];
}


@end
