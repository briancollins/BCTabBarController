#import "EXAppDelegate.h"
#import "BCTabBarController.h"
#import "EXViewController.h"

@implementation EXAppDelegate
@synthesize tabBarController, window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions { 
	self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
	self.tabBarController = [[[BCTabBarController alloc] init] autorelease];
	self.tabBarController.viewControllers = [NSArray arrayWithObjects:
											 [[[UINavigationController alloc]
											  initWithRootViewController:[[[EXViewController alloc] init] autorelease]]
											  autorelease],
											 [[[EXViewController alloc] init] autorelease],
											 [[[EXViewController alloc] init] autorelease],
											 [[[EXViewController alloc] init] autorelease],
											 [[[EXViewController alloc] init] autorelease],
											 nil];
	[self.window addSubview:self.tabBarController.view];
	[self.window makeKeyAndVisible];
	return YES;
}

- (void)dealloc {
	self.tabBarController = nil;
	self.window = nil;
	[super dealloc];
}

@end
