//
//  SKMuteSwitchDetector.h
//
//  Created by Filipe on 09/12/13.
//  Copyright (c) 2013 skmobi. All rights reserved.
//
//  Adapted from SKMuteSwitchDetector by Moshe Gottlieb (Sharkfood) @ http://sharkfood.com/archives/450
//  All credits to him

#import <Foundation/Foundation.h>


typedef void(^SKMuteSwitchDetectorBlock)(BOOL success, BOOL silent);

@interface SKMuteSwitchDetector : NSObject

+ (void)checkSwitch:(SKMuteSwitchDetectorBlock)andPerform;

@end
