/*============================================================================
 PROJECT: HvN
 FILE:    Review.m
 AUTHOR:  admin
 DATE:    08/05/16
 =============================================================================*/

/*============================================================================
 IMPORT
 =============================================================================*/
#import "Review.h"

/*============================================================================
 PRIVATE MACRO
 =============================================================================*/
/*============================================================================
 PRIVATE INTERFACE
 =============================================================================*/

@implementation Review

+ (id)objectFromDictionary:(NSDictionary *)dict
{
    Review *object = [Review new];
    object.reviewId = makeString(dict[@"objectId"]);
    object.comment = makeString(dict[@"comment"]);
    object.productId = makeString(makeDict(dict[@"productID"])[@"objectId"]);
    object.rating = makeNumber(dict[@"rating"]);
    object.userId = makeString(makeDict(dict[@"userID"])[@"objectId"]);
    object.date = [Utils convertStringToDate:makeString(dict[@"updatedAt"])];
    return object;
}

+ (NSArray *)getListReviewsFromArray:(NSArray *)arrayDict
{
    NSMutableArray * result = [NSMutableArray array];
    [arrayDict enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL *stop) {
        if (obj && [obj isKindOfClass:[NSDictionary class]]) {
            [result addObject:[Review objectFromDictionary:obj]];
        }
    }];
    [result sortUsingComparator:^NSComparisonResult(Review *obj1, Review *obj2) {
        return [obj2.date compare:obj1.date];
    }];
    return result;
}

@end
