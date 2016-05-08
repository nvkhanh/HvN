//
//  ViewController+Common.m
//  LNReader
//
//  Created by Trung Le on 5/18/15.
//  Copyright (c) 2015 XXX. All rights reserved.
//

#import "ViewController+Common.h"
#import <objc/runtime.h>
#import "AppDelegate.h"
#import <MBProgressHUD.h>

@implementation UIViewController(Common)

-(UIView*) rootView
{
    AppDelegate *appDel=[UIApplication sharedApplication].delegate;
    
    
    return appDel.window;
}

-(void)showHUD
{
    [MBProgressHUD showHUDAddedTo:[self rootView] animated:true];
}

-(void)removeHUD
{
    [MBProgressHUD hideAllHUDsForView:[self rootView] animated:true];
}

@end

@implementation UIViewController(Storyboard)

+(UIStoryboard *)mainStoryboard
{
    return [UIStoryboard storyboardWithName:@"Main" bundle:nil];
}

@end

char ViewControllerRegisteredKeyboardNotificationKey;
@implementation UIViewController(RegisterKeyboardNotification)

-(NSNumber*) _isRegisteredKeyboardNotifications
{
    return objc_getAssociatedObject(self, &ViewControllerRegisteredKeyboardNotificationKey);
}

-(void) _setIsRegisteredKeyboardNotifications:(NSNumber*) isRegisteredKeyboardNotifications
{
    objc_setAssociatedObject(self, &ViewControllerRegisteredKeyboardNotificationKey, isRegisteredKeyboardNotifications, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(BOOL)isRegisteredKeyboardNotification
{
    return [self _isRegisteredKeyboardNotifications].boolValue;
}

-(void) registerKeyboardNotifications
{
    if([self _isRegisteredKeyboardNotifications].boolValue)
        return;
    
    [self _setIsRegisteredKeyboardNotifications:@(true)];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
}

-(void)unregisterKeyboardNotification
{
    if(![self _isRegisteredKeyboardNotifications].boolValue)
        return;
    
    [self _setIsRegisteredKeyboardNotifications:@(false)];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
}

-(void)keyboardWillShow:(NSNotification *)notification
{
    
}

-(void)keyboardDidShow:(NSNotification *)notification
{
    
}

-(void)keyboardWillHide:(NSNotification *)notification
{
    
}

-(void)keyboardDidHide:(NSNotification *)notification
{
    
}




@end