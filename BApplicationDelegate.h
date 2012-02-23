@class MailApplication;
@class WebView;

@interface BApplicationDelegate : NSObject <NSApplicationDelegate> {
	WebView *credits;
	NSWindow *about;
    NSWindow *window;
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
