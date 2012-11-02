//
//  VideoPlayerViewController.m
//  Reflection
//
//  Created by Suraj Mirajkar on 01/11/12.
//
//

#import "PinterestViewController.h"


@interface PinterestViewController ()

@end

@implementation PinterestViewController
@synthesize webViewPinterest;
@synthesize busyIndicator;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [webViewPinterest setHidden:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    busyIndicator=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [busyIndicator setFrame:CGRectMake(150, 180, 20, 20)];
    [self.view addSubview:busyIndicator];
}

- (IBAction)pinit:(id)sender {
    [self postToPinterest];
}

- (IBAction)closeWebVIew:(id)sender {
    [webViewPinterest setHidden:YES];
}

- (NSString*) generatePinterestHTML {
    NSString *description = @"Post your description here";
    
    NSString *sUrl = [NSString stringWithFormat:@"http://www.alkalima.com/images/08-02/nature.jpg"];
    NSLog(@"URL:%@", sUrl);
    NSString *protectedUrl = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,(__bridge CFStringRef)sUrl, NULL, (CFStringRef)@"!*'\"();:@&=+$,/?%#[]% ",CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    NSLog(@"Protected URL:%@", protectedUrl);
    NSString *imageUrl = [NSString stringWithFormat:@"\"%@\"", sUrl];
    NSString *buttonUrl = [NSString stringWithFormat:@"\"http://pinterest.com/pin/create/button/?url=www.flor.com&media=%@&description=%@\"", protectedUrl, description];
    
    NSMutableString *htmlString = [[NSMutableString alloc] initWithCapacity:1000];
    [htmlString appendFormat:@"<html> <body>"];
    [htmlString appendFormat:@"<p align=\"center\"><a href=%@ class=\"pin-it-button\" count-layout=\"horizontal\"><img border=\"0\" src=\"http://assets.pinterest.com/images/PinExt.png\" title=\"Pin It\" /></a></p>", buttonUrl];
    [htmlString appendFormat:@"<p align=\"center\"><img width=\"400px\" height = \"400px\" src=%@></img></p>", imageUrl];
    [htmlString appendFormat:@"<script type=\"text/javascript\" src=\"//assets.pinterest.com/js/pinit.js\"></script>"];
    [htmlString appendFormat:@"</body> </html>"];
    return htmlString;
}

- (void) postToPinterest {
    NSString *htmlString = [self generatePinterestHTML];
    NSLog(@"Generated HTML String:%@", htmlString);
    webViewPinterest.backgroundColor = [UIColor clearColor];
    webViewPinterest.opaque = NO;
    if ([webViewPinterest isHidden]) {
        [webViewPinterest setHidden:NO];
    }
    [webViewPinterest loadHTMLString:htmlString baseURL:nil];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [busyIndicator startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    [busyIndicator stopAnimating];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



- (void)viewDidUnload {
    [self setWebViewPinterest:nil];
    [super viewDidUnload];
}

@end
