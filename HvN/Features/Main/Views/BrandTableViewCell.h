/*============================================================================
 PROJECT: HvN
 FILE:    BrandTableViewCell.h
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
 Interface:   BrandTableViewCell
 =============================================================================*/

@interface BrandTableViewCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UILabel *brandName;
@property (nonatomic, strong) IBOutlet UILabel *brandDescription;
@property (nonatomic, strong) IBOutlet NSLayoutConstraint *selectedImageWidthContraint;
@property (nonatomic, strong) Brand *data;
@end
