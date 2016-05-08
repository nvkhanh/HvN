/*============================================================================
 PROJECT: HvN
 FILE:    DataManager.m
 AUTHOR:  admin
 DATE:    08/05/16
 =============================================================================*/

/*============================================================================
 IMPORT
 =============================================================================*/
#import "DataManager.h"
#import "AFNetworking.h"
/*============================================================================
 PRIVATE MACRO
 =============================================================================*/
/*============================================================================
 PRIVATE INTERFACE
 =============================================================================*/

@implementation DataManager
+ (id)sharedInstance
{
    static DataManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}
+ (AFHTTPRequestSerializer*)baseRequestSerializer
{
    AFHTTPRequestSerializer *requestSerializer  = [AFJSONRequestSerializer serializer];
    [requestSerializer setValue:@"MlR6vYpYvLRxfibxE5cg0e73jXojL6jWFqXU6F8L" forHTTPHeaderField:@"X-Parse-Application-Id"];
    [requestSerializer setValue:@"7BTXVX1qUXKUCnsngL8LxhpEHKQ8KKd798kKpD9W" forHTTPHeaderField:@"X-Parse-REST-API-Key"];
    [requestSerializer setValue:@"Content-Type" forHTTPHeaderField:@"application/json"];
    [requestSerializer setValue:@"Cache-Control" forHTTPHeaderField:@"no-cache"];
    
    return requestSerializer;
}
- (void)getAllProductWithResponseBlock:(BaseResponseData)responseBlock
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    AFHTTPResponseSerializer *serializer = [AFHTTPResponseSerializer serializer];
    
    serializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",@"text/plain", nil];;
        
    manager.responseSerializer = serializer;
    
    manager.requestSerializer = [DataManager baseRequestSerializer];
    
    
    [manager GET:kGetAllProducts parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSError* error;
        NSDictionary* responseDict = [NSJSONSerialization JSONObjectWithData:responseObject
                                                             options:NSJSONReadingMutableLeaves
                                                               error:&error];
        responseBlock(YES, [Product getListProductsFromArray:responseDict[@"results"]], nil);
    }
    failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        responseBlock(NO, nil, error);
    }];
}
- (void)getAllReviewsWithResponseBlock:(BaseResponseData)responseBlock
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    AFHTTPResponseSerializer *serializer = [AFHTTPResponseSerializer serializer];
    
    serializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",@"text/plain", nil];;
    
    manager.responseSerializer = serializer;
    
    manager.requestSerializer = [DataManager baseRequestSerializer];
    
    
    [manager GET:kGetAllReviews parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSError* error;
        NSDictionary* responseDict = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                     options:NSJSONReadingMutableLeaves
                                                                       error:&error];
        responseBlock(YES, [Review getListReviewsFromArray:responseDict[@"results"]], nil);
    }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             responseBlock(NO, nil, error);
         }];
}
- (void)getAllBrandsWithResponseBlock:(BaseResponseData)responseBlock
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    AFHTTPResponseSerializer *serializer = [AFHTTPResponseSerializer serializer];
    
    serializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",@"text/plain", nil];;
    
    manager.responseSerializer = serializer;
    
    manager.requestSerializer = [DataManager baseRequestSerializer];
    
    
    [manager GET:kGetAllBrands parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSError* error;
        NSDictionary* responseDict = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                     options:NSJSONReadingMutableLeaves
                                                                       error:&error];
        responseBlock(YES, [Brand getListBrandsFromArray:responseDict[@"results"]], nil);
    }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             responseBlock(NO, nil, error);
         }];
}


- (void)getAllUsersWithResponseBlock:(BaseResponseData)responseBlock
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    AFHTTPResponseSerializer *serializer = [AFHTTPResponseSerializer serializer];
    
    serializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",@"text/plain", nil];;
    
    manager.responseSerializer = serializer;
    
    manager.requestSerializer = [DataManager baseRequestSerializer];
    
    
    [manager GET:kGetAllUsers parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSError* error;
        NSDictionary* responseDict = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                     options:NSJSONReadingMutableLeaves
                                                                       error:&error];
        responseBlock(YES, [User getListUsersFromArray:responseDict[@"results"]], nil);
    }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             responseBlock(NO, nil, error);
         }];
}
- (void)getAllProductByBrandName:(NSString *)brandName responseBlock:(BaseResponseData)responseBlock
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    AFHTTPResponseSerializer *serializer = [AFHTTPResponseSerializer serializer];
    
    serializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",@"text/plain", nil];;
    
    manager.responseSerializer = serializer;
    
    manager.requestSerializer = [DataManager baseRequestSerializer];
    
    
    NSDictionary *dict = @{@"brandID" : @{@"$inQuery" :@{@"where" : @{@"name" :brandName}, @"className": @"Brand" }}};
    NSString * url = @"https://api.parse.com/1/classes/Product?order=dateCreated&limit=10&where=";
    url = [url stringByAppendingString:[Utils convertDictionaryTojSonString:dict]];
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSError* error;
        NSDictionary* responseDict = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                     options:NSJSONReadingMutableLeaves
                                                                       error:&error];
        responseBlock(YES, [Product getListProductsFromArray:responseDict[@"results"]], nil);
    }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             responseBlock(NO, nil, error);
         }];
}

@end
