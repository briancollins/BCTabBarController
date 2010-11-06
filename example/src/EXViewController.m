#import "EXViewController.h"

@implementation EXViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.view.backgroundColor = RGBCOLOR(rand() % 255, rand() % 255, rand() % 255);
}

- (NSString *)iconImageName {
	return @"magnifying-glass.png";
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
	return YES;
}

@end
