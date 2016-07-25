
//
//  OLHomeTableViewCell.m
//  OLMVVM
//
//  Created by olive on 16/7/25.
//  Copyright © 2016年 olive. All rights reserved.
//

#import "OLHomeTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "UIView+OLUtils.h"
#import "OLHomeModel.h"

//字体
#define UIFont_size(size) [UIFont systemFontOfSize:size]
#define UICOLOR_FROM_RGB(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define kAppWhiteColor [UIColor whiteColor]//白色
#define kAppDarkGrayColor [UIColor darkGrayColor]//深灰色
#define kAppGrayColor [UIColor grayColor]//灰色
//宽度
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
//高度
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface OLHomeTableViewCell()

@property (nonatomic, strong) UIImageView *newsImageView;
@property (nonatomic, strong) UILabel     *newsTitleLabel;
@property (nonatomic, strong) UILabel     *newsSourceLabel;
@property (nonatomic, strong) UILabel     *newsTypeLabel;

@end

@implementation OLHomeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self uiConfig];
    }
    return self;
}

- (void)uiConfig {
    //图片
    [self.contentView addSubview:self.newsImageView];
    //标题
    [self.contentView addSubview:self.newsTitleLabel];
    //来源
    [self.contentView addSubview:self.newsSourceLabel];
    //类型
    [self.contentView addSubview:self.newsTypeLabel];
}


- (void)setHomeModel:(OLHomeModel *)homeModel {
    if (homeModel) {
        _homeModel = homeModel;
        [self loadViewData];
    }
}

- (void)loadViewData {
    //图片
    [self.newsImageView sd_setImageWithURL:[NSURL URLWithString:_homeModel.newsImage] placeholderImage:[UIImage imageNamed:@"tu_empty"]];
    //标题
    [self.newsTitleLabel setText:_homeModel.newsTitle];
    //来源
    [self.newsSourceLabel setText:_homeModel.newsSource];
    //类型
    [self.newsTypeLabel setText:_homeModel.newsTypeName];
}

- (UIImageView *)newsImageView{
    if (!_newsImageView) {
        _newsImageView=[[UIImageView alloc]init];
        [_newsImageView setFrame:CGRectMake(10.0, 10.0, 85.0, 60.0)];
    }
    return _newsImageView;
}

- (UILabel *)newsTitleLabel{
    if (!_newsTitleLabel) {
        _newsTitleLabel=[[UILabel alloc]init];
        [_newsTitleLabel setFrame:CGRectMake(self.newsImageView.currentMaxX+10.0, self.newsImageView.currentX, kScreenWidth-self.newsImageView.currentMaxX-20.0, 40.0)];
        [_newsTitleLabel setFont:UIFont_size(15.0)];
        [_newsTitleLabel setTextColor:kAppDarkGrayColor];
        [_newsTitleLabel setTextAlignment:NSTextAlignmentLeft];
        [_newsTitleLabel setNumberOfLines:0];
    }
    return _newsTitleLabel;
}

- (UILabel *)newsSourceLabel{
    if (!_newsSourceLabel) {
        _newsSourceLabel=[[UILabel alloc]init];
        [_newsSourceLabel setFrame:CGRectMake(self.newsTitleLabel.currentX, 55.0, self.newsTitleLabel.currentWidth/2, 15.0)];
        [_newsSourceLabel setTextAlignment:NSTextAlignmentLeft];
        [_newsSourceLabel setTextColor:kAppGrayColor];
        [_newsSourceLabel setFont:UIFont_size(12.0)];
    }
    return _newsSourceLabel;
}

- (UILabel *)newsTypeLabel{
    if (!_newsTypeLabel) {
        _newsTypeLabel=[[UILabel alloc]init];
        [_newsTypeLabel setFrame:CGRectMake(self.newsImageView.currentMaxX+self.newsTitleLabel.currentWidth/2+10.0, self.newsSourceLabel.currentY, self.newsSourceLabel.currentWidth, self.newsSourceLabel.currentY)];
        [_newsTypeLabel setTextAlignment:NSTextAlignmentRight];
        [_newsTypeLabel setTextColor:kAppGrayColor];
        [_newsTypeLabel setFont:UIFont_size(12.0)];
    }
    return _newsTypeLabel;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
