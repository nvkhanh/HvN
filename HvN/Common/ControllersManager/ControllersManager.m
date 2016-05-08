/*============================================================================
 PROJECT: HvN
 FILE:    ControllersManager.m
 AUTHOR:  admin
 DATE:    08/05/16
 =============================================================================*/

/*============================================================================
 IMPORT
 =============================================================================*/
#import "ControllersManager.h"

/*============================================================================
 PRIVATE MACRO
 =============================================================================*/
/*============================================================================
 PRIVATE INTERFACE
 =============================================================================*/
@interface ControllersManager ()

@property (nonatomic, strong) BaseNavigationController *mainNavigationController;
@property (nonatomic, strong) UIWindow *mainWindow;
@property (nonatomic, strong) UIViewController *mainViewController;

@end
@implementation ControllersManager


+ (ControllersManager *)sharedInstance {
    static ControllersManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ControllersManager alloc] init];
    });
    return instance;
}

- (void)launchAppWithWindow:(UIWindow *)window {
    _mainWindow = window;
    
    BaseNavigationController *navigationController = [[BaseNavigationController alloc] init];
    _mainWindow.rootViewController = navigationController;
    _mainNavigationController = navigationController;
    ProductListViewController *productListViewController = [IBHelpers loadViewController:@"ProductListViewController" inStory:@"Main"];
    _mainViewController = productListViewController;
    _mainNavigationController.viewControllers = @[ productListViewController ];}
@end
