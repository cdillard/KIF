//
//  ModalViewTests.m
//  Test Suite
//
//  Created by Brian Nickel on 6/28/13.
//  Copyright (c) 2013 Brian Nickel. All rights reserved.
//

#import <KIF/KIF.h>

@interface ModalViewTests : KIFTestCase
@end

@implementation ModalViewTests

- (void)beforeEach
{
    [tester waitForTimeInterval:0.25];
}

- (void)testInteractionWithAnAlertView
{
    [tester tapViewWithAccessibilityLabel:@"UIAlertView"];
    [tester waitForViewWithAccessibilityLabel:@"Alert View"];
    [tester waitForViewWithAccessibilityLabel:@"Message"];
    [tester waitForTappableViewWithAccessibilityLabel:@"Cancel"];
    [tester waitForTappableViewWithAccessibilityLabel:@"Continue"];
    [tester tapViewWithAccessibilityLabel:@"Continue"];
    [tester waitForAbsenceOfViewWithAccessibilityLabel:@"Message"];
}

- (void)testInteractionWithAnActionSheet
{
    [tester tapViewWithAccessibilityLabel:@"UIActionSheet"];
    [tester waitForViewWithAccessibilityLabel:@"Action Sheet"];
    [tester waitForTappableViewWithAccessibilityLabel:@"Destroy"];
    [tester waitForTappableViewWithAccessibilityLabel:@"A"];
    [tester waitForTappableViewWithAccessibilityLabel:@"B"];
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        [tester dismissPopover];
    } else {
        [tester tapViewWithAccessibilityLabel:@"Cancel"];
    }
}

- (void)testInteractionWithAnActivityViewController
{
    if (!NSClassFromString(@"UIActivityViewController")) {
        return;
    }
    
    [tester tapViewWithAccessibilityLabel:@"UIActivityViewController"];
    [tester waitForTappableViewWithAccessibilityLabel:@"Copy"];
    [tester waitForTappableViewWithAccessibilityLabel:@"Mail"];
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone) {
        [tester tapViewWithAccessibilityLabel:@"Cancel"];
    } else {
        [tester dismissPopover];
    }
}

@end
