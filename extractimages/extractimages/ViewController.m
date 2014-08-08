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

	NSString *weblink = @"http://www.varshylmobile.com/";

	VMWIE *vm = [VMWIE instance];
	vm.delegate = self;
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
	[MBProgressHUD showHUDAddedTo:self.view animated:YES].detailsLabelText = @"Extracting images....";
}

- (void)imageExtractFinishedWithPaths:(NSArray *)imageSourcePath {
	[MBProgressHUD hideHUDForView:self.view animated:YES];

	// being called twice..so added if condition, will fix it later,
	if (![self.navigationController.topViewController isKindOfClass:[ExtractedImagesViewController class]]) {
		ExtractedImagesViewController *extractedImagesVC = [[ExtractedImagesViewController alloc] initWithNibName:@"ExtractedImagesViewController" bundle:nil];
		extractedImagesVC.imagesArray = [NSArray arrayWithArray:imageSourcePath];
		extractedImagesVC.title = @"Extracted Images";
		[self.navigationController pushViewController:extractedImagesVC animated:YES];
	}
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
