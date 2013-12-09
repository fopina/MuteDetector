//
//  SKViewController.m
//  MuteDetector
//
//  Created by Filipe on 09/12/13.
//  Copyright (c) 2013 skmobi. All rights reserved.
//

#import "SKViewController.h"
#import "SKMuteSwitchDetector.h"

@interface SKViewController ()

@end

@implementation SKViewController

- (IBAction)checkButton:(id)sender {
    [SKMuteSwitchDetector checkSwitch:^(BOOL success, BOOL silent) {
        NSString *message;
        if (success) {
            message = [NSString stringWithFormat:@"Mute switch is %@", silent ? @"ON" : @"OFF"];
        }
        else {
            message = @"Failed to detect mute switch state";
        }
        [[[UIAlertView alloc] initWithTitle:nil message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }];
}

@end
