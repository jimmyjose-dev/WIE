//
//  VMWIE.h
//  WIEFramework
//
//  Created by Jimmy on 11/06/13.
//  Copyright (c) 2013 Varshyl Mobile Private Limited. All rights reserved.
//

#import <UIKit/UIKit.h>

//Image extract delegate
@protocol VMWIEDelegate <NSObject>

-(void)imageExtractFailedWithError:(NSError *)error;

@optional
-(void)imageExtractStarted;
-(void)imageExtractFinishedWithPaths:(NSArray *)imageSourcePath; // Array of String object

@end


//WIE framework debug delegate
@protocol VMWIEDebugDelegate <NSObject>

-(void)anErrorOccuredDueToReason:(NSString *)reason;

@optional
-(void)logThisForJimmy:(NSString *)log; // Log error msg not caught by
                                        // anErrorOccuredDueToReason and imageExtractFailedWithError
@end



@interface VMWIE : UIView

@property(retain,nonatomic) id <VMWIEDelegate> delegate;
@property(retain,nonatomic) id <VMWIEDebugDelegate> debugdelegate;

-(void)extractImagesForURL:(NSString *)urlString;

// Singleton
+(VMWIE *)instance;

@end
