### BCTabBarController

BCTabBarController is a Tweetie-style tab bar for iPhone. See below for screenshots.


### Why?

There are several problems with using the standard UITabBarController including:

* It is too tall, especially in landscape mode
* The height doesn't match the UIToolbar
* It cannot be customized without using private APIs
* It has labels. Sometimes you don't need labels.

BCTabBarController is completely written from scratch using public APIs to fix all of these problems and behaves almost identically to a normal UITabBarController.

### Features

* A cool little arrow that slides around to indicate the current tab
* Support for all orientations
* Same height as a standard UIToolbar

### Usage
* Add BCTabBarController.xcodeproj to your project by dragging it into the Groups & Files sidebar.
* Select the added project file in the sidebar and then check the box next to libBCTabBarController.a
* Select your project's target and right-click and choose "Get Info"
* Click the + icon underneath Direct Dependencies and add the BCTabBarController target
* libBCTabBarController.a should already be in the list of Linked Libraries
* Drag BCTabBarController.bundle into your project's resources
* If you haven't already, add the QuartzCore and Core Graphics frameworks to your project
* Define the method <code>- (NSString *)iconImageName</code> in each view controller that you add to the tab bar. It should return the filename of the grey tab icon (see creation steps below)
* See the example target for usage


### Creating icons
Unlike UITabBarController, the tab bar icons in BCTabBars are have two pre-rendered states (four if you count the retina versions). You can use the provided tab.psd file to create those files.

* Replace the layer masks in the PSD with the silhouette of the icon you wish to create
* Save the grey layer as name.png and the blue layer as name-selected.png and add them to your project. 


### Screenshots
![](http://brisy.info/upload/b2AxI.png) ![](http://brisy.info/upload/CWX5J.png)


### Acknowledgements
This controller wouldn't be possible without the original innovative design of Tweetie by Loren Brichter (atebits).
