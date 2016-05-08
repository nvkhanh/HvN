/*============================================================================
 PROJECT: HvN
 FILE:    BaseViewController.h
 AUTHOR:  admin
 DATE:    08/05/16
 =============================================================================*/

/*============================================================================
 IMPORT
 =============================================================================*/
#import <UIKit/UIKit.h>

/*============================================================================
 MACRO
 =============================================================================*/

/*============================================================================
 PROTOCOL
 =============================================================================*/

/*============================================================================
 Interface:   BaseViewController
 =============================================================================*/


@interface BaseViewController : UIViewController

- (void)createRightBarButtonWithTitle:(NSString *)title;

- (void)didTouchedOnRightBarButton;

@end
