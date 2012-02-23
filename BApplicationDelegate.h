
@class MailApplication;
@class WebView;

@interface BApplicationDelegate : NSObject <NSApplicationDelegate>
{
	MailApplication *mailapp;
	NSString *display;
	WebView *creditsView;
	NSWindow *aboutPanel;
    NSWindow *window;
}

@property (retain) MailApplication *mailapp;
@property (copy) NSString *display;
@property (retain) IBOutlet WebView *creditsView;
@property (retain) IBOutlet NSWindow *aboutPanel;
@property (retain) IBOutlet NSWindow *window;

- (IBAction) showAboutPanel: (id) sender;
- (void) update: (NSTimer *) timer;

@end
