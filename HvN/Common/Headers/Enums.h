
/*============================================================================
 PROJECT: HvN
 FILE:    Enums.h
 AUTHOR:  admin
 DATE:    08/05/16
 =============================================================================*/

/*============================================================================
 IMPORT
 =============================================================================*/

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ProductStatus ) {
    ProductStatusInStock  = 1,
    ProductStatusOutOfStock = 2,
    ProductStatusArchived = 3
};