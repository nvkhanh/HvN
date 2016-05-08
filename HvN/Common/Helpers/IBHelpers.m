/*============================================================================
 PROJECT: MarkitEzy
 FILE:    IBHelpers.m
 AUTHOR:  Khanh Nguyen
 DATE:    12/14/15
 =============================================================================*/

/*============================================================================
 IMPORT
 =============================================================================*/
#import "IBHelpers.h"

/*============================================================================
 PRIVATE CONSTANTS
 =============================================================================*/

/*============================================================================
 PRIVATE INTERFACE
 =============================================================================*/

@interface IBHelpers ()

@end

@implementation IBHelpers
+ (id)loadViewNib:(NSString *)nibName {
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil];
    if([nibs count] > 0) {
        return [nibs objectAtIndex:0];
    }
    return nil;
}

+ (id)loadViewControllerNib:(NSString *)nibName {
    UIViewController *viewController = [[NSClassFromString(nibName) alloc] initWithNibName:nibName bundle:nil];
    return viewController;
}

+ (id)loadStoryBoard:(NSString *)storyName {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:storyName bundle:nil];
    return storyBoard;
}

+ (id)loadViewController:(NSString *)name inStory:(NSString *)story {
    UIStoryboard *storyBoard = [self loadStoryBoard:story];
    return [storyBoard instantiateViewControllerWithIdentifier:name];
}

+ (id)loadInitialViewControllerInStory:(NSString *)story{
    UIStoryboard *storyBoard = [self loadStoryBoard:story];
    return [storyBoard instantiateInitialViewController];
}

@end
