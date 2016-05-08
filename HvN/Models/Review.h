/*============================================================================
 PROJECT: HvN
 FILE:    Review.h
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
 Interface:   Review
 =============================================================================*/


@interface Review : BaseModel


@property (nonatomic, strong) NSString * productId;
@property (nonatomic, strong) NSString * userId;
@property (nonatomic, strong) NSString * reviewId;
@property (nonatomic, strong) NSString * comment;
@property (nonatomic, strong) NSNumber * rating;
@property (nonatomic, strong) NSDate * date;


@property (nonatomic, strong) NSString * userName;

+ (NSArray *)getListReviewsFromArray:(NSArray *)arrayDict;

@end
