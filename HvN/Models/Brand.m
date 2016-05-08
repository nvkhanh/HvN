/*============================================================================
 PROJECT: HvN
 FILE:    Brand.m
 AUTHOR:  admin
 DATE:    08/05/16
 =============================================================================*/

/*============================================================================
 IMPORT
 =============================================================================*/
#import "Brand.h"

/*============================================================================
 PRIVATE MACRO
 =============================================================================*/
/*============================================================================
 PRIVATE INTERFACE
 =============================================================================*/

@implementation Brand

+ (id)objectFromDictionary:(NSDictionary *)dict
{
    Brand *object = [Brand new];
    object.brandId = makeString(dict[@"objectId"]);
    object.brandName = makeString(dict[@"name"]);
    object.brandDescription = makeString(dict[@"description"]);
    
    return object;
}

+ (NSArray *)getListBrandsFromArray:(NSArray *)arrayDict
{
    NSMutableArray * result = [NSMutableArray array];
    [arrayDict enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL *stop) {
        if (obj && [obj isKindOfClass:[NSDictionary class]]) {
            [result addObject:[Brand objectFromDictionary:obj]];
        }
    }];
    return result;
}
@end
