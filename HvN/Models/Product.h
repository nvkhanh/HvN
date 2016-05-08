/*============================================================================
 PROJECT: HvN
 FILE:    Product.h
 AUTHOR:  admin
 DATE:    08/05/16
 =============================================================================*/

/*============================================================================
 IMPORT
 =============================================================================*/
#import "BaseModel.h"

/*============================================================================
 MACRO
 =============================================================================*/

/*============================================================================
 PROTOCOL
 =============================================================================*/

/*============================================================================
 Interface:   Product
 =============================================================================*/


@interface Product : BaseModel

@property (nonatomic, strong) NSString * productId;
@property (nonatomic, strong) NSString * productName;
@property (nonatomic, strong) NSString * productDescription;
@property (nonatomic, strong) NSString * price;
@property (nonatomic, strong) NSString * color;
@property (nonatomic, strong) NSDate * dateCreated;
@property (nonatomic, strong) NSString * availabilityStatus;
@property (nonatomic, strong) NSString * brandId;

@property (nonatomic, strong) NSString *brandName;
@property (nonatomic, strong) NSNumber * rating;

+ (NSArray *)getListProductsFromArray:(NSArray *)arrayDict;

- (void)updateBrandNameWithBrands:(NSArray *)brands;

- (void)updateratingWithReviews:(NSArray *)reviews;
@end
