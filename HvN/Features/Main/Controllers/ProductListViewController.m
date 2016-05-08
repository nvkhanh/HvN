/*============================================================================
 PROJECT: HvN
 FILE:    ProductListViewController.m
 AUTHOR:  admin
 DATE:    08/05/16
 =============================================================================*/

/*============================================================================
 IMPORT
 =============================================================================*/
#import "ProductListViewController.h"
#import "ProductTableViewCell.h"
/*============================================================================
 PRIVATE MACRO
 =============================================================================*/
/*============================================================================
 PRIVATE INTERFACE
 =============================================================================*/

@interface ProductListViewController () < UITableViewDataSource, UITableViewDelegate, BrandViewControllerDelegate>

@property (nonatomic, strong) NSArray * datasources;
@property (nonatomic, strong) NSArray * listUsers;
@property (nonatomic, strong) NSArray * listBrands;
@property (nonatomic, strong) NSArray * listReviews;
@property (nonatomic, weak) IBOutlet UITableView * tableView;
@property (nonatomic, weak) IBOutlet UIButton * brandButton;
@property (nonatomic, strong) Brand *selectedBrand;

@end

@implementation ProductListViewController

#pragma mark -- View cycle
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
    self.view.backgroundColor = [UIColor greenColor];
    
    [self initData];
    [self setUpUI];
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
- (void) initData
{
    [self showHUD];
    
    AsyncSteps *steps = [AsyncSteps new];
    [steps enqueueStep:^(AsyncStepsStepCompletion stepCompletion) {
        [[DataManager sharedInstance] getAllProductWithResponseBlock:^(BOOL success, id responseData, NSError *error) {
            if ([responseData isKindOfClass:[NSArray class]]) {
                self.datasources = [NSArray arrayWithArray:responseData];
            }
             stepCompletion();
        }];
    }];
    
    [steps enqueueStep:^(AsyncStepsStepCompletion stepCompletion) {
        [[DataManager sharedInstance] getAllBrandsWithResponseBlock:^(BOOL success, id responseData, NSError *error) {
            if ([responseData isKindOfClass:[NSArray class]]) {
                self.listBrands = [NSArray arrayWithArray:responseData];
                
                
            }
            stepCompletion();
        }];
    }];
    [steps enqueueStep:^(AsyncStepsStepCompletion stepCompletion) {
        [[DataManager sharedInstance] getAllReviewsWithResponseBlock:^(BOOL success, id responseData, NSError *error) {
            if ([responseData isKindOfClass:[NSArray class]]) {
                self.listReviews = [NSArray arrayWithArray:responseData];
            }
            stepCompletion();
        }];
    }];
    [steps setCompletedBlock:^{
       [self removeHUD];
        [_tableView reloadData];
    }];
    [steps run];
    
}
- (void) setUpUI
{
    [self updateBrandBySelectedBrand:nil];
    self.title = @"Product List";
}
- (void)updateBrandBySelectedBrand:(Brand *)brand
{
    if (brand == nil) {
        [_brandButton setTitle:@"ALL" forState:UIControlStateNormal];
    }else {
        [_brandButton setTitle:brand.brandName forState:UIControlStateNormal];
    }
}
- (void)setSelectedBrand:(Brand *)selectedBrand
{
    _selectedBrand = selectedBrand;
    [self updateBrandBySelectedBrand:_selectedBrand];
    
    //data call api
    self.datasources = @[];
    [self showHUD];
    [[DataManager sharedInstance] getAllProductByBrandName:_selectedBrand.brandName responseBlock:^(BOOL success, NSArray * responseData, NSError *error) {
        [self removeHUD];
        
        if (success && [responseData isKindOfClass:[NSArray class]] && responseData.count > 0) {
            self.datasources = [NSArray arrayWithArray:responseData];
        }else {
            [UIAlertView showAlertWithTitle:@"" message:@"No Product Found" cancelButtonMessage:nil];
        }
        [_tableView reloadData];
    }];
    
}
- (IBAction)didTouchedOnBrandButton:(id)sender
{
    BrandViewController *brandViewController = [IBHelpers loadViewController:@"BrandViewController" inStory:@"Main"];
    brandViewController.delegate = self;
    brandViewController.selectedBrand = _selectedBrand;
    brandViewController.datasouces = _listBrands;
    [self.navigationController pushViewController:brandViewController animated:YES];
}
#pragma mark -- Brand Delegate
- (void)brandViewControllerDidSelectedBrand:(BrandViewController *)viewController selectedBrand:(Brand *)selectedBrand
{
    self.selectedBrand = selectedBrand;
}
#pragma mark -- TableView Datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  [_datasources count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductTableViewCell" forIndexPath:indexPath];
    [cell reloadCellWithProduct:_datasources[indexPath.row] reivews:_listReviews brands:_listBrands];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProductDetailViewController * viewController = [IBHelpers loadViewController:@"ProductDetailViewController" inStory:@"Main"];
    viewController.reviewsOfSystem = _listReviews;
    viewController.product = _datasources[indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
}
@end
