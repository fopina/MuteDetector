MuteDetector
============

Helper class to detect mute switch state

Due to the recent need of detecting mute switch state, I've found SharkfoodMuteSwitchDetector by Moshe Gottlieb (Sharkfood - http://sharkfood.com/archives/450).

This is simply a small redesign of the Moshe's solution to make it easily usable for those of us who simply want to quickly check its state (instead of actively watching it).

Usage
---

* Add _SKMuteSwitchDetector.h_ and _SKMuteSwitchDetector.m_ to your project
* Import _SKMuteSwitchDetector.h_ in your class and use it as simply as (taken from this demo project _SKViewController.m_):

```objective-c
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
```
