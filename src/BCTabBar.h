@class BCTab;

@protocol BCTabBarDelegate;

@interface BCTabBar : UIView {
	NSArray *tabs;
	BCTab *selectedTab;
	UIImage *backgroundImage;
	UIImageView *arrow;
	id <BCTabBarDelegate> delegate;
}

- (id)initWithFrame:(CGRect)aFrame;

@property (nonatomic, retain) NSArray *tabs;
@property (nonatomic, retain) BCTab *selectedTab;
@property (nonatomic, assign) id <BCTabBarDelegate> delegate;
@property (nonatomic, retain) UIImageView *arrow;
@end

@protocol BCTabBarDelegate
- (void)tabBar:(BCTabBar *)aTabBar didSelectTabAtIndex:(NSInteger)index;
@end