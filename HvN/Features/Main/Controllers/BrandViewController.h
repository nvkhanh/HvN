/*============================================================================
 PROJECT: HvN
 FILE:    BrandViewController.h
 AUTHOR:  admin
 DATE:    08/05/16
 =============================================================================*/

/*============================================================================
 IMPORT
 =============================================================================*/
#import "BaseViewController.h"

/*============================================================================
 MACRO
 =============================================================================*/
@class BrandViewController;
/*============================================================================
 PROTOCOL
 =============================================================================*/
@protocol BrandViewControllerDelegate <NSObject>

- (void)brandViewControllerDidSelectedBrand:(BrandViewController *)viewController selectedBrand:(Brand *)selectedBrand;

@end
/*============================================================================
 Interface:   BrandViewController
 =============================================================================*/


@interface BrandViewController : BaseViewController
@property (nonatomic, strong) NSArray *datasouces;
@property (nonatomic, strong) Brand *selectedBrand;
@property (nonatomic, assign) id<BrandViewControllerDelegate> delegate;
@end
