/*============================================================================
 PROJECT: HvN
 FILE:    ProductTableViewCell.m
 AUTHOR:  admin
 DATE:    08/05/16
 =============================================================================*/

/*============================================================================
 IMPORT
 =============================================================================*/
#import "ProductTableViewCell.h"

/*============================================================================
 PRIVATE MACRO
 =============================================================================*/
/*============================================================================
 PRIVATE INTERFACE
 =============================================================================*/

@interface ProductTableViewCell ()

@property (nonatomic, weak) IBOutlet UILabel *productNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *productBrandLabel;
@property (nonatomic, weak) IBOutlet UILabel *scoreLabel;

@property (nonatomic, strong) Product * product;

@end
@implementation ProductTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void) reloadCellWithProduct:(Product *)product reivews:(NSArray *)reviews brands:(NSArray *)brands
{
    _product = product;
    _productNameLabel.text = _product.productName;
    [_product updateBrandNameWithBrands:brands];
    _productBrandLabel.text = _product.brandName ? _product.brandName : @"";

    
    [_product updateratingWithReviews:reviews];
    _scoreLabel.text = [NSString stringWithFormat:@"Rating: %.2f",_product.rating.floatValue];
}
@end
