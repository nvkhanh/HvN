/*============================================================================
 PROJECT: HvN
 FILE:    User.m
 AUTHOR:  admin
 DATE:    08/05/16
 =============================================================================*/

/*============================================================================
 IMPORT
 =============================================================================*/
#import "User.h"

/*============================================================================
 PRIVATE MACRO
 =============================================================================*/
/*============================================================================
 PRIVATE INTERFACE
 =============================================================================*/

@implementation User

+ (id)objectFromDictionary:(NSDictionary *)dict
{
    User *object = [User new];
    object.userId = makeString(dict[@"objectId"]);
    object.isCustomer = [dict[@"IsCustomer"] boolValue];
    object.email = makeString(dict[@"email"]);
    object.userName = makeString(dict[@"userName"]);

    
    return object;
}

+ (NSArray *)getListUsersFromArray:(NSArray *)arrayDict
{
    NSMutableArray * result = [NSMutableArray array];
    [arrayDict enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL *stop) {
        if (obj && [obj isKindOfClass:[NSDictionary class]]) {
            [result addObject:[User objectFromDictionary:obj]];
        }
    }];
    return result;
}

@end
