#import "BCTabBarController.h"
#import "BCTabBar.h"
#import "BCTab.h"
#import "UIViewController+iconImage.h"
#import "BCTabBarView.h"

@interface BCTabBarController ()

- (void)loadTabs;

@property (nonatomic, retain) UIImageView *selectedTab;

@end


@implementation BCTabBarController
@synthesize viewControllers, tabBar, selectedTab, selectedViewController, tabBarView;

- (id)init {
	if (self = [super init]) {
	}
	
	return self;
}

- (void)viewDidLoad {
	self.tabBarView = [[[BCTabBarView alloc] initWithFrame:self.view.frame] autorelease];
	self.view = self.tabBarView;

	self.tabBar = [[[BCTabBar alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 44, 
															  self.view.bounds.size.width, 44)]
				   autorelease];
	self.tabBar.delegate = self;
	self.view.backgroundColor = [UIColor clearColor];
	self.tabBarView.tabBar = self.tabBar;
	[self loadTabs];
	[super viewDidLoad];
}

- (void)tabBar:(BCTabBar *)aTabBar didSelectTabAtIndex:(NSInteger)index {
	UIViewController *vc = [self.viewControllers objectAtIndex:index];
	if (self.selectedViewController == vc) {
		if ([self.selectedViewController isKindOfClass:[UINavigationController class]]) {
			[(UINavigationController *)self.selectedViewController popToRootViewControllerAnimated:YES];
		}
	} else {
		self.selectedViewController = vc;
	}
	
}

- (void)setSelectedViewController:(UIViewController *)vc {
	UIViewController *oldVC = selectedViewController;

	[selectedViewController release];
	selectedViewController = [vc retain];
	[oldVC viewWillDisappear:NO];
	[selectedViewController viewWillAppear:NO];
	self.tabBarView.contentView = vc.view;
	[oldVC viewDidDisappear:NO];
	[selectedViewController viewDidAppear:NO];
}

- (void)loadTabs {
	NSMutableArray *tabs = [NSMutableArray arrayWithCapacity:self.viewControllers.count];
	for (UIViewController *vc in self.viewControllers) {
		[tabs addObject:[[[BCTab alloc] initWithIconImageName:[vc iconImageName]] autorelease]];
	}
	self.tabBar.tabs = tabs;
}

- (void)viewDidUnload {
	self.tabBar = nil;
	self.selectedTab = nil;
}

- (void)setViewControllers:(NSArray *)array {
	[viewControllers release];
	viewControllers = [array retain];
	[self loadTabs];
}

- (void)dealloc {
	self.viewControllers = nil;
	self.tabBar = nil;
	self.selectedTab = nil;
	self.tabBarView = nil;
	[super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
	return [self.selectedViewController shouldAutorotateToInterfaceOrientation:toInterfaceOrientation];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
	[self.selectedViewController willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
}

- (void)willAnimateFirstHalfOfRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
	[self.selectedViewController willAnimateFirstHalfOfRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation duration:(NSTimeInterval)duration {
	[self.selectedViewController willAnimateRotationToInterfaceOrientation:interfaceOrientation duration:duration];
}

- (void)willAnimateSecondHalfOfRotationFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation duration:(NSTimeInterval)duration {
	[self.selectedViewController willAnimateSecondHalfOfRotationFromInterfaceOrientation:fromInterfaceOrientation duration:duration];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
	[self.selectedViewController didRotateFromInterfaceOrientation:fromInterfaceOrientation];
}

@end
