//
//  TestSuiteViewController.m
//  Test Suite
//
//  Created by Brian K Nickel on 6/26/13.
//  Copyright (c) 2013 Brian Nickel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestSuiteViewController : UITableViewController <UIPopoverControllerDelegate>

@property (nonatomic, strong) UIPopoverController *currentPopoverController;

@end

@implementation TestSuiteViewController

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section != 1) {
        return;
    }
    
    switch (indexPath.row) {
        case 0:
        {
            [[[UIAlertView alloc] initWithTitle:@"Alert View" message:@"Message" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"Continue", nil] show];
            break;
        }
            
        case 1:
        {
            [[[UIActionSheet alloc] initWithTitle:@"Action Sheet" delegate:nil cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Destroy" otherButtonTitles:@"A", @"B", nil] showFromRect:[tableView cellForRowAtIndexPath:indexPath].frame inView:tableView animated:YES];
            break;
        }
            
        case 2:
        {
            Class AVCClass = NSClassFromString(@"UIActivityViewController");
            if (AVCClass) {
                UIActivityViewController *activityViewController = [[AVCClass alloc] initWithActivityItems:@[@"Hello World"] applicationActivities:nil];
                
                if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone) {
                    [self presentViewController:activityViewController animated:YES completion:nil];
                } else {
                    self.currentPopoverController = [[UIPopoverController alloc] initWithContentViewController:activityViewController];
                    self.currentPopoverController.delegate = self;
                    [self.currentPopoverController presentPopoverFromRect:[tableView cellForRowAtIndexPath:indexPath].frame inView:tableView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
                }
            }
            break;
        }
    }
}

#pragma mark - UIPopoverControllerDelegate

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    self.currentPopoverController = nil;
}

@end
