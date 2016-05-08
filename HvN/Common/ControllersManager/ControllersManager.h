/*============================================================================
 PROJECT: HvN
 FILE:    ControllersManager.h
 AUTHOR:  admin
 DATE:    08/05/16
 =============================================================================*/

/*============================================================================
 IMPORT
 =============================================================================*/
#import <Foundation/Foundation.h>

/*============================================================================
 MACRO
 =============================================================================*/

/*============================================================================
 PROTOCOL
 =============================================================================*/

/*============================================================================
 Interface:   ControllersManager
 =============================================================================*/


@interface ControllersManager : NSObject

+ (ControllersManager *)sharedInstance;

- (void)launchAppWithWindow:(UIWindow *)window;

@end