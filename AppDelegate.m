

#import "AppDelegate.h"
#import "PinterestViewController.h"

@interface AppDelegate ()
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application
{	
	// using the viewController xib outlet, add its view to our window
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //ReflectViewController *reflectViewController = [[ReflectViewController alloc] initWithNibName:@"ReflectViewController" bundle:[NSBundle mainBundle]];
    //self.window.rootViewController = reflectViewController;
    
    PinterestViewController *videoPlayerViewController = [[PinterestViewController alloc] initWithNibName:@"PinterestViewController" bundle:[NSBundle mainBundle]];
    self.window.rootViewController = videoPlayerViewController;
	[self.window makeKeyAndVisible];
}


@end
