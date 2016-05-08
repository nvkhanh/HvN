/*============================================================================
 PROJECT: MarkitEzy
 FILE:    ParserJSONHelper.m
 AUTHOR:  Trung Le
 DATE:    11/25/14
 =============================================================================*/

/*============================================================================
 IMPORT
 =============================================================================*/
#import "ParserJSONHelper.h"


/*============================================================================
 PRIVATE MACRO
 =============================================================================*/
/*============================================================================
 PRIVATE INTERFACE
 =============================================================================*/

NSNumber* makeNumber(id obj)
{
    return [NSNumber makeNumber:obj];
}

NSNumber* makeNumberWithDefaultValue(id obj, NSNumber* defaultValue)
{
    return [NSNumber makeNumber:obj withDefaultValue:defaultValue];
}

NSString* makeString(id obj)
{
    return [NSString makeString:obj];
}

NSArray* makeArray(id obj)
{
    return [NSArray makeArray:obj];
}

NSDictionary* makeDict(id obj)
{
    return [NSDictionary makeDict:obj];
}

NSDate* makeDate(id obj)
{
    return [NSDate date];
}

@implementation NSObject(DetectEmptyData)

-(BOOL) hasData
{
    if([self isKindOfClass:[NSNumber class]])
        return true;
    else if([self isKindOfClass:[NSString class]])
        return ((NSString*)self).length>0;
    else if([self isKindOfClass:[NSArray class]])
        return ((NSArray*)self).count>0;
    else if([self isKindOfClass:[NSDictionary class]])
        return ((NSDictionary*)self).count>0;
    
    return false;
}

@end

@implementation NSArray(ParserJSONHelper)

+(NSArray*) makeArray:(id) obj
{
    if([obj isKindOfClass:[NSArray class]])
    {
        // Lỗi chung của server khi left/right join lúc đó sẽ trả về 1 array với object đầu tiên là null
        if([obj count]==1 && [obj[0] isKindOfClass:[NSNull class]])
            return @[];
        
        return obj;
    }
    
    return @[];
}

@end

@implementation NSDictionary(ParserJSONHelper)

+(NSDictionary*) makeDict:(id) obj
{
    if([obj isKindOfClass:[NSDictionary class]])
        return obj;
    
    return @{};
}

@end

@implementation NSString(ParserJSONHelper)

+(NSString*) makeString:(id) obj
{
    if([obj isKindOfClass:[NSString class]])
        return obj;
    else if([obj isKindOfClass:[NSNumber class]])
        return [NSString stringWithFormat:@"%@",obj];
    else if([obj isKindOfClass:[NSNull class]])
        return @"";
    else if([obj respondsToSelector:@selector(description)])
        return [obj description];
    
    return @"";
}

@end

@implementation NSNumber(ParserJSONHelper)

+(NSNumber*) makeNumber:(id) obj
{
    return [NSNumber makeNumber:obj withDefaultValue:@(0)];
}

+(NSNumber*) makeNumber:(id) obj withDefaultValue:(NSNumber*) defaultValue
{
    if([obj isKindOfClass:[NSNumber class]])
        return obj;
    else if([obj isKindOfClass:[NSString class]])
        return @([obj doubleValue]);
    
    return defaultValue;
}

@end


@implementation NSNull(ParserJSONHelper)

@end