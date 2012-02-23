@class MailApplication;
@class WebView;

	WebView *credits;
	NSWindow *about;
    NSWindow *window;
@interface BApplicationDelegate : NSObject <NSApplicationDelegate>
{
	MailApplication *mailapp;
	NSString *display;
}

@property (assign) IBOutlet WebView *credits;
@property (assign) IBOutlet NSWindow *about;
@property (assign) IBOutlet NSWindow *window;
@property (retain) MailApplication *mailapp;
@property (copy) NSString *display;

- (IBAction) showAboutPanel: (id) sender;
- (void) update: (NSTimer *) timer;

@end
