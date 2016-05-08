//
//  ViewController+Common.h
//  LNReader
//
//  Created by Trung Le on 5/18/15.
//  Copyright (c) 2015 XXX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController(Common)

-(void) showHUD;
-(void) removeHUD;

//@property (nonatomic, readwrite) BOOL hidesBottomBarWhenWillShowViewController;
//@property (nonatomic, readwrite) BOOL hidesNavigationBarWhenWillShowViewController;

@end

@interface UIViewController(Storyboard)

+(UIStoryboard*) mainStoryboard;

@end

@interface UIViewController(RegisterKeyboardNotification)

-(void) registerKeyboardNotifications;
-(void) unregisterKeyboardNotification;

-(void) keyboardWillShow:(NSNotification*) notification;
-(void) keyboardDidShow:(NSNotification*) notification;
-(void) keyboardWillHide:(NSNotification*) notification;
-(void) keyboardDidHide:(NSNotification*) notification;

-(BOOL) isRegisteredKeyboardNotification;

@end

@interface UIViewController(UIActionSheet)



@end

