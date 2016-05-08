/*============================================================================
 PROJECT: HvN
 FILE:    UIAlertView+Messages.m
 AUTHOR:  admin
 DATE:    08/05/16
 =============================================================================*/

/*============================================================================
 IMPORT
 =============================================================================*/

#import "UIAlertView+Messages.h"

@implementation UIAlertView (Messages)


+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message cancelButtonMessage:(NSString *)cancelButtonMessage {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelButtonMessage otherButtonTitles:@"OK", nil];
    [alertView show];
}

@end