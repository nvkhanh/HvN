/*============================================================================
 PROJECT: MarkitEzy
 FILE:    IBHelpers.h
 AUTHOR:  Khanh Nguyen
 DATE:    12/14/15
 =============================================================================*/

/*============================================================================
 IMPORT
 =============================================================================*/
#import <Foundation/Foundation.h>

/*============================================================================
 INTERFACE:   IBHelpers
 =============================================================================*/

@interface IBHelpers : NSObject


+ (id)loadViewNib:(NSString *)nibName;
+ (id)loadViewControllerNib:(NSString *)nibName;
+ (id)loadStoryBoard:(NSString *)storyName;
+ (id)loadViewController:(NSString *)name inStory:(NSString *)story;
+ (id)loadInitialViewControllerInStory:(NSString *)story;

@end
