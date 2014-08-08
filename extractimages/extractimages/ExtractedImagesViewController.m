//
//  ExtractedImagesViewController.m
//  extractimages
//
//  Created by Jimmy on 24/12/12.
//  Copyright (c) 2012 VarshylMobile. All rights reserved.
//

#import "ExtractedImagesViewController.h"
#import "EGOImageView.h"

@interface ExtractedImagesViewController ()<EGOImageViewDelegate,UIScrollViewDelegate>{
    
    IBOutlet UIScrollView *scrollView;
    IBOutlet  UILabel *label;
    
}

@end

@implementation ExtractedImagesViewController
@synthesize imagesArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    [scrollView setDelegate:self];
    [label setText:[NSString stringWithFormat:@"Image 1/%d",[imagesArray count]]];
    [self setImages:imagesArray];
}


-(void)setImages:(NSArray *)array{
    
    
    int size = [array count];
    CGFloat contentOffset = 0.0f;
    if (size) {
        
        for (int i =0; i<size; ++i) {
            
            EGOImageView* imageView = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"Default.png"]];
            imageView.frame = CGRectMake(contentOffset, 0.0f, 320.0f, 435.0f);
            imageView.delegate = self;
            
            //show the placeholder image instantly
            [scrollView addSubview:imageView];
            
            NSString *imageURlStr= [array objectAtIndex:i];
            
            imageView.imageURL = [NSURL URLWithString:imageURlStr];
            
            imageView.contentMode = UIViewContentModeCenter;
            
            contentOffset += imageView.frame.size.width;
            scrollView.contentSize = CGSizeMake(contentOffset, scrollView.frame.size.height);
            
        }
        
    }
    
    
}


- (void)scrollViewDidScroll:(UIScrollView *)sender {
    
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 2;
    int totalpage = scrollView.contentSize.width / 320;
    
    [label setText:[NSString stringWithFormat:@"Image %d/%d",page,totalpage]];
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
