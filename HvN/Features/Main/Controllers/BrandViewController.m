/*============================================================================
 PROJECT: HvN
 FILE:    BrandViewController.m
 AUTHOR:  admin
 DATE:    08/05/16
 =============================================================================*/

/*============================================================================
 IMPORT
 =============================================================================*/
#import "BrandViewController.h"
#import "BrandTableViewCell.h"
/*============================================================================
 PRIVATE MACRO
 =============================================================================*/
/*============================================================================
 PRIVATE INTERFACE
 =============================================================================*/

@interface BrandViewController ()
@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end

@implementation BrandViewController

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
    if (_datasouces == nil || _datasouces.count == 0) {
        [self showHUD];
        [[DataManager sharedInstance] getAllBrandsWithResponseBlock:^(BOOL success, id responseData, NSError *error) {
            if (success && [responseData isKindOfClass:[NSArray class]]) {
                self.datasouces = responseData;
                [_tableView reloadData];
            }
            [self removeHUD];
        }];
    }
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
- (void)setDatasouces:(NSArray *)datasouces
{
    _datasouces = datasouces;
}
#pragma mark - TableView Protocol
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _datasouces.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIndentifier = @"BrandTableViewCell";
    BrandTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier forIndexPath:indexPath];
    Brand *object = _datasouces[indexPath.row];
    cell.data = object;
    cell.brandName.text = object.brandName;
    cell.brandDescription.text = object.brandDescription;
    if ([object.brandId isEqualToString:_selectedBrand.brandId]) {
        cell.selectedImageWidthContraint.constant = 24;
    }else {
        cell.selectedImageWidthContraint.constant = 0;
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Brand *object = _datasouces[indexPath.row];
    if (_delegate && [_delegate respondsToSelector:@selector(brandViewControllerDidSelectedBrand:selectedBrand:)]) {
        [_delegate brandViewControllerDidSelectedBrand:self selectedBrand:object];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
