/*============================================================================
 PROJECT: MarkitEzy
 FILE:    ParserJSONHelper.h
 AUTHOR:  Trung Le
 DATE:    11/25/14
 =============================================================================*/

/*============================================================================
 IMPORT
 =============================================================================*/
#import <Foundation/Foundation.h>

/*============================================================================
 MACRO
 =============================================================================*/

/*============================================================================
 PROTOCOL
 =============================================================================*/

/*============================================================================
 Interface:   ParserJSONHelper
 =============================================================================*/

NSNumber* makeNumber(id obj);
NSNumber* makeNumberWithDefaultValue(id obj, NSNumber* defaultValue);
NSString* makeString(id obj);
NSArray* makeArray(id obj);
NSDictionary* makeDict(id obj);
NSDate* makeDate(id obj);

@interface NSObject(DetectEmptyData)

-(BOOL) hasData;

@end

@interface NSArray(ParserJSONHelper)

+(NSArray*) makeArray:(id) obj;

@end

@interface NSDictionary(ParserJSONHelper)

+(NSDictionary*) makeDict:(id) obj;

@end

@interface NSString(ParserJSONHelper)

+(NSString*) makeString:(id) obj;

@end

@interface NSNumber(ParserJSONHelper)

+(NSNumber*) makeNumber:(id) obj;
+(NSNumber*) makeNumber:(id) obj withDefaultValue:(NSNumber*) defaultValue;

@end



@interface NSNull(ParserJSONHelper)

@end