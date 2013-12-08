//
//  SKViewController.m
//  MuteDetector
//
//  Created by Filipe on 09/12/13.
//  Copyright (c) 2013 skmobi. All rights reserved.
//

#import "SKViewController.h"

@interface SKViewController ()

@end

@implementation SKViewController

- (IBAction)checkButton:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Test" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

@end
