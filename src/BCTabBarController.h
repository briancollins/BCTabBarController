#import "BCTabBar.h"
@class BCTabBarView;

@interface BCTabBarController : UIViewController <BCTabBarDelegate> {
	NSArray *viewControllers;
	UIViewController *selectedViewController;
	BCTabBar *tabBar;
	BCTabBarView *tabBarView;
}

@property (nonatomic, retain) NSArray *viewControllers;
@property (nonatomic, retain) BCTabBar *tabBar;
@property (nonatomic, retain) UIViewController *selectedViewController;
@property (nonatomic, retain) BCTabBarView *tabBarView;

@end
