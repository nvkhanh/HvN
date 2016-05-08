/*============================================================================
 PROJECT: HvN
 FILE:    Product.m
 AUTHOR:  admin
 DATE:    08/05/16
 =============================================================================*/

/*============================================================================
 IMPORT
 =============================================================================*/
#import "Product.h"

/*============================================================================
 PRIVATE MACRO
 =============================================================================*/
/*============================================================================
 PRIVATE INTERFACE
 =============================================================================*/

@implementation Product


+ (id)objectFromDictionary:(NSDictionary *)dict
{
    Product *object = [Product new];
    object.brandId = makeString(makeDict(dict[@"brandID"])[@"objectId"]) ;
    object.color = makeString(dict[@"colour"]);
    object.dateCreated = [NSDate date];
    object.productDescription = makeString(dict[@"description"]);
    object.productId = makeString(dict[@"objectId"]);
    object.price = makeString(dict[@"price"]);
    object.productName = makeString(dict[@"productName"]);
    object.availabilityStatus = makeString(dict[@"availabilityStatus"]);
    NSString *dateCreate = makeString(makeDict(dict[@"dateCreated"])[@"iso"]);
    object.dateCreated = [Utils convertStringToDate:dateCreate];
    return object;
}
+ (NSArray *)getListProductsFromArray:(NSArray *)arrayDict
{
    NSMutableArray * result = [NSMutableArray array];
    [arrayDict enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL *stop) {
        if (obj && [obj isKindOfClass:[NSDictionary class]]) {
            [result addObject:[Product objectFromDictionary:obj]];
        }
    }];
    [result sortUsingComparator:^NSComparisonResult(Product *obj1, Product *obj2) {
        return [obj2.dateCreated compare:obj1.dateCreated];
    }];
    return result;
}
- (void)updateBrandNameWithBrands:(NSArray *)brands
{
    if (self.brandName == nil) {
        __block NSString * brandName = nil;
        [brands enumerateObjectsUsingBlock:^(Brand *obj, NSUInteger idx, BOOL *stop) {
            if ([obj isKindOfClass:[Brand class]]) {
                if ([obj.brandId isEqualToString:self.brandId]) {
                    brandName = obj.brandName;
                    *stop = YES;
                }
            }
        }];
        self.brandName = brandName;
    }

}
- (void)updateratingWithReviews:(NSArray *)reviews
{
    if (self.rating == nil) {
        __block NSInteger count = 0;
        __block CGFloat totalRating = 0;
        [reviews enumerateObjectsUsingBlock:^(Review *obj, NSUInteger idx, BOOL *stop) {
            if ([obj isKindOfClass:[Review class]]) {
                if ([obj.productId isEqualToString:self.productId]) {
                    count ++;
                    totalRating += obj.rating.floatValue;
                }
            }
        }];
        if (count != 0) {
            self.rating = @(totalRating / count);
        }else {
            self.rating = nil;
        }
    }
    
}
@end
