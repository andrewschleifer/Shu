
@interface BApplicationDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
	NSString *display;
	id mail;
}

@property (assign) IBOutlet NSWindow *window;
@property (copy) NSString *display;

-(void)update:(NSTimer *)timer;

@end
