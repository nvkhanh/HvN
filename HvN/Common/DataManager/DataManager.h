/*============================================================================
 PROJECT: HvN
 FILE:    DataManager.h
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
typedef void(^BaseResponseData)(BOOL success,id responseData, NSError *error);
/*============================================================================
 PROTOCOL
 =============================================================================*/

/*============================================================================
 Interface:   DataManager
 =============================================================================*/


@interface DataManager : NSObject
+ (id)sharedInstance;
- (void)getAllProductWithResponseBlock:(BaseResponseData)responseBlock;
- (void)getAllReviewsWithResponseBlock:(BaseResponseData)responseBlock;
- (void)getAllBrandsWithResponseBlock:(BaseResponseData)responseBlock;
- (void)getAllUsersWithResponseBlock:(BaseResponseData)responseBlock;
- (void)getAllProductByBrandName:(NSString *)brandName responseBlock:(BaseResponseData)responseBlock;
@end
