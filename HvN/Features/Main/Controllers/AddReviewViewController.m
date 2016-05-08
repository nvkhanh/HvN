/*============================================================================
 PROJECT: HvN
 FILE:    AddReviewViewController.m
 AUTHOR:  admin
 DATE:    08/05/16
 =============================================================================*/

/*============================================================================
 IMPORT
 =============================================================================*/
#import "AddReviewViewController.h"

/*============================================================================
 PRIVATE MACRO
 =============================================================================*/
/*============================================================================
 PRIVATE INTERFACE
 =============================================================================*/

@interface AddReviewViewController ()

@property (nonatomic, weak)IBOutlet UIScrollView * scrollView;

@property (nonatomic, weak) IBOutlet UILabel *mesageLabel;
@property (nonatomic, weak) IBOutlet UITextField *emailTextField;
@property (nonatomic, weak) IBOutlet UITextField *productIdTextField;
@property (nonatomic, weak) IBOutlet UITextField *ratingTextField;
@property (nonatomic, weak) IBOutlet UITextView * commentTextView;

@end

@implementation AddReviewViewController

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
    [self createRightBarButtonWithTitle:@"BarCode"];
    [self setUpUI];
    
}
- (void)setUpUI
{
    if (_productId) {
        _productIdTextField.text = _productId;
    }
    _mesageLabel.text = @"";
    self.view.backgroundColor = [UIColor grayColor];
}
- (void)didTouchedOnRightBarButton
{
    ScanBarCodeViewController * viewController = [IBHelpers loadViewController:@"ScanBarCodeViewController" inStory:@"Main"];
    [self.navigationController pushViewController:viewController animated:YES];
}
- (IBAction)didTouchedOnSaveButton:(id)sender
{
    [self.view endEditing:YES];
    NSString *message = [self validate];
    if (message.length > 0) {
        //call API
        _mesageLabel.text = @"";
    }else {
        _mesageLabel.text = message;
    }
}
- (NSString *)validate
{
    return @"";
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

@end
