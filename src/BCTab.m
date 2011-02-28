#import "BCTab.h"

@interface BCTab ()
@property (nonatomic, retain) UIImage *rightBorder;
@property (nonatomic, retain) UIImage *background;
@property (nonatomic, retain) NSString *imageName;
@end

@implementation BCTab
@synthesize rightBorder, background, imageName;

- (void) assignImages: (NSString *) imageName  {
  NSString *selectedName = [NSString stringWithFormat:@"%@-selected.%@",
								   [imageName stringByDeletingPathExtension],
								   [imageName pathExtension]];
		
		[self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
		[self setImage:[UIImage imageNamed:selectedName] forState:UIControlStateSelected];

}
- (id)initWithIconImageName:(NSString *)imageName {
	if (self = [super init]) {
		self.adjustsImageWhenHighlighted = NO;
		self.background = [UIImage imageNamed:@"BCTabBarController.bundle/tab-background.png"];
		self.rightBorder = [UIImage imageNamed:@"BCTabBarController.bundle/tab-right-border.png"];
		self.backgroundColor = [UIColor clearColor];
		
		[self assignImages: imageName];
        self.imageName = imageName;

	}
	return self;
}

- (void)dealloc {
	self.rightBorder = nil;
	self.background = nil;
    self.imageName = nil;
	[super dealloc];
}

- (void)setHighlighted:(BOOL)aBool {
	// no highlight state
}

- (void)drawRect:(CGRect)rect {
	if (self.selected) {
		[background drawAtPoint:CGPointMake(0, 2)];
		[rightBorder drawAtPoint:CGPointMake(self.bounds.size.width - rightBorder.size.width, 2)];
		CGContextRef c = UIGraphicsGetCurrentContext();
		[RGBCOLOR(24, 24, 24) set]; 
		CGContextFillRect(c, CGRectMake(0, self.bounds.size.height / 2, self.bounds.size.width, self.bounds.size.height / 2));
		[RGBCOLOR(14, 14, 14) set];		
		CGContextFillRect(c, CGRectMake(0, self.bounds.size.height / 2, 0.5, self.bounds.size.height / 2));
		CGContextFillRect(c, CGRectMake(self.bounds.size.width - 0.5, self.bounds.size.height / 2, 0.5, self.bounds.size.height / 2));
	}
}

- (void)setFrame:(CGRect)aFrame {
	[super setFrame:aFrame];
	[self setNeedsDisplay];
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	UIEdgeInsets imageInsets = UIEdgeInsetsMake(floor((self.bounds.size.height / 2) -
												(self.imageView.image.size.height / 2)),
												floor((self.bounds.size.width / 2) -
												(self.imageView.image.size.width / 2)),
												floor((self.bounds.size.height / 2) -
												(self.imageView.image.size.height / 2)),
												floor((self.bounds.size.width / 2) -
												(self.imageView.image.size.width / 2)));
	self.imageEdgeInsets = imageInsets;
}

- (void)adjustImageForOrientation {
    NSString *orientationSuffix = @"";
    if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation)) {
        orientationSuffix = @"-landscape";
    }
    NSString *orientationAwareName = [NSString stringWithFormat:@"%@%@.%@",
                              [self.imageName stringByDeletingPathExtension], orientationSuffix,
                              [self.imageName pathExtension]];
    [self assignImages:orientationAwareName];
}

@end
