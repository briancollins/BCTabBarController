@class BCTabBarController;

@interface EXAppDelegate : NSObject <UIApplicationDelegate> {
	BCTabBarController *tabBarController;
	UIWindow *window;
}

@property (nonatomic, retain) BCTabBarController *tabBarController;
@property (nonatomic, retain) UIWindow *window;
@end
