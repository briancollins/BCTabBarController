#import "EXAppDelegate.h"
#import "BCTabBarController.h"
#import "EXViewController.h"

@implementation EXAppDelegate
@synthesize tabBarController, window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions { 
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	self.tabBarController = [[BCTabBarController alloc] init];
	self.tabBarController.viewControllers = [NSArray arrayWithObjects:
											 [[UINavigationController alloc]
											  initWithRootViewController:[[EXViewController alloc] init]],
											 [[EXViewController alloc] init],
											 [[EXViewController alloc] init],
											 [[EXViewController alloc] init],
											 [[EXViewController alloc] init],
											 nil];
	[self.window addSubview:self.tabBarController.view];
	[self.window makeKeyAndVisible];
	return YES;
}

@end
