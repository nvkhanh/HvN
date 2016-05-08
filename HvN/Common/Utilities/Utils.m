/*============================================================================
 PROJECT: MarkitEzy
 FILE:    Utils.m
 AUTHOR:  Khanh Nguyen
 DATE:    1/6/16
 =============================================================================*/

/*============================================================================
 IMPORT
 =============================================================================*/
#import "Utils.h"

/*============================================================================
 PRIVATE CONSTANTS
 =============================================================================*/

/*============================================================================
 PRIVATE INTERFACE
 =============================================================================*/

@interface Utils ()

@end

@implementation Utils
+ (NSString *)convertDictionaryTojSonString:(NSDictionary *)dict
{
    NSString *result = @"";
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict
                                                       options:0
                                                         error:&error];
    
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        result = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return result;
}
+ (NSDate *)convertStringToDate:(NSString *)string
{
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];//2015-09-01T09:09:00.000Z
    [dateFormat setDateFormat:@"YYYY-mm-dd'T'HH:mm:ss.sss'Z'"];
    NSDate *date = [dateFormat dateFromString:string];
    return date;
}
@end
