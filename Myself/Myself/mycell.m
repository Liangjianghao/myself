#import "mycell.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)


@interface mycell()
@property (nonatomic,strong)UIView *bgView;
@end

@implementation mycell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self createUI];
    }
    return self;
}
//重点在这里
- (void)createUI{
    //创建一个UIView比self.contentView小一圈
    self.bgView  = [[UIView alloc] initWithFrame:CGRectMake(10, 5, SCREEN_WIDTH - 20, 70)];
    self.bgView.backgroundColor = [UIColor whiteColor];
    //给bgView边框设置阴影
    self.bgView.layer.shadowOffset = CGSizeMake(1,1);
    self.bgView.layer.shadowOpacity = 0.3;
    self.bgView.layer.shadowColor = [UIColor blackColor].CGColor;
    [self.contentView addSubview:self.bgView];
}
+ (CGFloat)getHeight{
    //在这里能计算高度，动态调整
    return 100;
}
@end
