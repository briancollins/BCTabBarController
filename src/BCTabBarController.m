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

- (void)loadView {
	self.tabBarView = [[[BCTabBarView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]] autorelease];
	self.view = self.tabBarView;

	self.tabBar = [[[BCTabBar alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 44, 
															  self.view.bounds.size.width, 44)]
				   autorelease];
	self.tabBar.delegate = self;
	
	self.tabBarView.backgroundColor = [UIColor clearColor];
	self.tabBarView.tabBar = self.tabBar;
	[self loadTabs];
	
	UIViewController *tmp = selectedViewController;
	selectedViewController = nil;
	[self setSelectedViewController:tmp];
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
	if (selectedViewController != vc) {
		[selectedViewController release];
		selectedViewController = [vc retain];
		if (visible) {
			[oldVC viewWillDisappear:NO];
			[selectedViewController viewWillAppear:NO];
		}
		self.tabBarView.contentView = vc.view;
		if (visible) {
			[oldVC viewDidDisappear:NO];
			[selectedViewController viewDidAppear:NO];
		}
		
		[self.tabBar setSelectedTab:[self.tabBar.tabs objectAtIndex:self.selectedIndex] animated:(oldVC != nil)];
	}
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[self.selectedViewController viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	[self.selectedViewController viewDidAppear:animated];
	visible = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
	[self.selectedViewController viewWillDisappear:animated];	
}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
	[self.selectedViewController viewDidDisappear:animated];
	visible = NO;
}



- (NSUInteger)selectedIndex {
	return [self.viewControllers indexOfObject:self.selectedViewController];
}

- (void)setSelectedIndex:(NSUInteger)aSelectedIndex {
	if (self.viewControllers.count > aSelectedIndex)
		self.selectedViewController = [self.viewControllers objectAtIndex:aSelectedIndex];
}

- (void)loadTabs {
	NSMutableArray *tabs = [NSMutableArray arrayWithCapacity:self.viewControllers.count];
	for (UIViewController *vc in self.viewControllers) {
		[tabs addObject:[[[BCTab alloc] initWithIconImageName:[vc iconImageName]] autorelease]];
	}
	self.tabBar.tabs = tabs;
	[self.tabBar setSelectedTab:[self.tabBar.tabs objectAtIndex:self.selectedIndex] animated:NO];
}

- (void)viewDidUnload {
	self.tabBar = nil;
	self.selectedTab = nil;
}

- (void)setViewControllers:(NSArray *)array {
	if (array != viewControllers) {
		[viewControllers release];
		viewControllers = [array retain];
		
		if (viewControllers != nil) {
			[self loadTabs];
		}
	}
	
	self.selectedIndex = 0;
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
