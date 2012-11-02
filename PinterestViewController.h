//
//  VideoPlayerViewController.h
//  Reflection
//
//  Created by Suraj Mirajkar on 01/11/12.
//
//

#import <UIKit/UIKit.h>

@interface PinterestViewController : UIViewController <UIWebViewDelegate> {

}
@property (weak, nonatomic) IBOutlet UIWebView *webViewPinterest;
@property (nonatomic,retain) UIActivityIndicatorView *busyIndicator;

- (IBAction)pinit:(id)sender;
- (IBAction)closeWebVIew:(id)sender;
- (void) postToPinterest;

@end
