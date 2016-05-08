/*============================================================================
 PROJECT: HvN
 FILE:    UIAlertView+Messages.h
 AUTHOR:  admin
 DATE:    08/05/16
 =============================================================================*/

/*============================================================================
 IMPORT
 =============================================================================*/

#import <UIKit/UIKit.h>

@class EcchoAPIMessageObject;

@interface UIAlertView (Messages)


+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message cancelButtonMessage:(NSString *)cancelButtonMessage;
@end
