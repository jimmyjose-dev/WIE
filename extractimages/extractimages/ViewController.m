//
//  ViewController.m
//  extractimages
//
//  Created by Jimmy on 22/12/12.
//  Copyright (c) 2012 VarshylMobile. All rights reserved.
//

#import "ViewController.h"
#import "EGOImageView.h"
#import "ExtractedImagesViewController.h"
#import "MBProgressHUD.h"
#import <WIEFramework/VMWIEHeader.h>


@interface ViewController () <UIWebViewDelegate, EGOImageViewDelegate, UIScrollViewDelegate, VMWIEDelegate, VMWIEDebugDelegate> {
	IBOutlet UIScrollView *scrollView;
	IBOutlet UILabel *label;
}

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad {
	[super viewDidLoad];

	NSString *weblink = @"https://developer.apple.com/LIBRARY/ios/documentation/Cocoa/Conceptual/Strings/Articles/readingFiles.html";//@"https://play.google.com/store/apps/details?id=com.varshylmobile.cloudqrscan&hl=en";//@"http://www.varshylmobile.com/";

	VMWIE *vm = [VMWIE instance];
    NSLog(@"vm.slowAndAccurate %d",vm.slowAndAccurate);
    vm.slowAndAccurate = YES;
    NSLog(@"vm.slowAndAccurate %d",vm.slowAndAccurate);
	vm.delegate = self;
    vm.debugdelegate = self;
	[vm extractImagesForURL:weblink];
}

- (void)logThisForJimmy:(NSString *)log {
	[MBProgressHUD hideHUDForView:self.view animated:YES];
	NSLog(@"error %@", log);
}

- (void)anErrorOccuredDueToReason:(NSString *)reason {
	[MBProgressHUD hideHUDForView:self.view animated:YES];
	NSLog(@"error %@", reason);
}

- (void)imageExtractFailedWithError:(NSError *)error {
	NSLog(@"error %@", [error localizedDescription]);

	[MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (void)imageExtractStarted {
	NSLog(@"start");
    [MBProgressHUD showHUDAddedTo:self.view animated:YES].detailsLabelText = @"Extracting images....";
}

- (void)imageExtractFinishedWithPaths:(NSArray *)imageSourcePath {

	NSLog(@"end");
	
    [MBProgressHUD hideHUDForView:self.view animated:YES];

    if (imageSourcePath) {
        
	ExtractedImagesViewController *extractedImagesVC = [[ExtractedImagesViewController alloc] initWithNibName:@"ExtractedImagesViewController" bundle:nil];
    extractedImagesVC.imagesArray = [NSArray arrayWithArray:imageSourcePath];
    extractedImagesVC.title = @"Extracted Images";
        [self.navigationController pushViewController:extractedImagesVC animated:YES];
    
    }else{
    
        NSLog(@"No images found");
    }
    
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
