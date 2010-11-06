@class BCTabBar;

@interface BCTabBarView : UIView {
	UIView *contentView;
	BCTabBar *tabBar;
}

@property (nonatomic, assign) UIView *contentView;
@property (nonatomic, assign) BCTabBar *tabBar;


@end
