
@interface BCTab : UIButton {
	UIImage *background;
	UIImage *rightBorder;
    NSString *imageName;
}

- (id)initWithIconImageName:(NSString *)imageName;
- (void)adjustImageForOrientation;

@end
