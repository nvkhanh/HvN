/*============================================================================
 PROJECT: HvN
 FILE:    ReviewTableViewCell.m
 AUTHOR:  admin
 DATE:    08/05/16
 =============================================================================*/

/*============================================================================
 IMPORT
 =============================================================================*/
#import "ReviewTableViewCell.h"

/*============================================================================
 PRIVATE MACRO
 =============================================================================*/
#define screenSize [UIScreen mainScreen].bounds.size
/*============================================================================
 PRIVATE INTERFACE
 =============================================================================*/

@interface ReviewTableViewCell ()

@property (nonatomic, weak) IBOutlet UILabel * userNameLabel;
@property (nonatomic, weak) IBOutlet UILabel * ratingLabel;
@property (nonatomic, weak) IBOutlet UILabel * commentLabel;

@end
@implementation ReviewTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setReview:(Review *)review
{
    _review = review;
    _userNameLabel.text = _review.userName;
    _ratingLabel.text = makeString(_review.rating);
    _commentLabel.text = _review.comment;
}
+ (float)getHeightWithComment:(NSString *)comment {
    NSDictionary *titleAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:14]};
    CGRect titleTextviewSize = [comment boundingRectWithSize:CGSizeMake(screenSize.width - 16  - 16, CGFLOAT_MAX)
                                                           options:NSStringDrawingUsesLineFragmentOrigin
                                                        attributes:titleAttributes
                                                           context:nil];
    return 25  + titleTextviewSize.size.height + 4 + 4 + 17;
}


@end
