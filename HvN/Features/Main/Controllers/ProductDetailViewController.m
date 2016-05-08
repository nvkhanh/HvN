/*============================================================================
 PROJECT: HvN
 FILE:    ProductDetailViewController.m
 AUTHOR:  admin
 DATE:    08/05/16
 =============================================================================*/

/*============================================================================
 IMPORT
 =============================================================================*/
#import "ProductDetailViewController.h"
#import "ReviewTableViewCell.h"

/*============================================================================
 PRIVATE MACRO
 =============================================================================*/
/*============================================================================
 PRIVATE INTERFACE
 =============================================================================*/

@interface ProductDetailViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView * tableView;
@property (nonatomic, weak) IBOutlet UILabel * productNameLabel;
@property (nonatomic, weak) IBOutlet UILabel * productDescriptionLabel;
@property (nonatomic, weak) IBOutlet UILabel * productBrandNameLabel;
@property (nonatomic, strong) NSArray *reviews;
@property (nonatomic, strong) NSArray *users;
@end

@implementation ProductDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self setUpUI];
    [self initData];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
#pragma mark -- Private Methods
- (void)setUpUI
{
    _productBrandNameLabel.text = _product.brandName;
    _productDescriptionLabel.text = _product.productDescription;
    _productNameLabel.text = _product.productName;
    
    
    [self createRightBarButtonWithTitle:@"Add Review"];
}
- (void)didTouchedOnRightBarButton
{
    AddReviewViewController * viewController = [IBHelpers loadViewController:@"AddReviewViewController" inStory:@"Main"];
    viewController.productId = _product.productId;
    [self.navigationController pushViewController:viewController animated:YES];
}
- (void)initReviewDatasourcesWithSystemUser:(NSArray *)users
{
    NSMutableArray *result = [NSMutableArray array];
    [_reviewsOfSystem enumerateObjectsUsingBlock:^(Review *review, NSUInteger idx, BOOL *stop) {
        [_users enumerateObjectsUsingBlock:^(User * user, NSUInteger idx, BOOL *stop) {
            if ([review.userId isEqualToString:user.userId] && [review.productId isEqualToString:_product.productId]) {
                if (![result containsObject:review]) {
                    review.userName = user.userName;
                    [result addObject:review];
                }
                *stop = YES;
            }
        }];
    }];
    _reviews = [NSArray arrayWithArray:result];
}
- (void)initData
{
    [self showHUD];
    [[DataManager sharedInstance] getAllUsersWithResponseBlock:^(BOOL success, id responseData, NSError *error) {
        if (success && responseData && [responseData isKindOfClass:[NSArray class]]) {
            _users = [NSArray arrayWithArray:responseData];
            [self initReviewDatasourcesWithSystemUser:_users];
            [_tableView reloadData];
        }
        [self removeHUD];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _reviews.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIndentifier = @"ReviewTableViewCell";
    ReviewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier forIndexPath:indexPath];
    cell.review = _reviews[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Review *item = _reviews[indexPath.row];
    return [ReviewTableViewCell getHeightWithComment:item.comment];
}




@end
