//
//  HMCountDownItemCell.m
//  利用collectionView做电商首页
//
//  Created by Temple on 2018/1/25.
//  Copyright © 2018年 Temple. All rights reserved.
//

#import "HMCountDownItemCell.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"

@interface HMCountDownItemCell()

/* 图片 */
@property (strong , nonatomic)UIImageView *imageView;
/* 价格 */
@property (strong , nonatomic)UILabel *priceLabel;
/* 剩余 */
@property (strong , nonatomic)UILabel *stockLabel;
/* 属性 */
@property (strong , nonatomic)UILabel *tipLabel;

@end

@implementation HMCountDownItemCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imageView];
        [self addSubview:self.priceLabel];
        [self addSubview:self.stockLabel];
        [self addSubview:self.tipLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self);
        make.width.mas_equalTo(self).multipliedBy(0.8);
        make.height.mas_equalTo(self.frame.size.width * 0.8);
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.mas_equalTo(self.imageView.mas_bottom)setOffset:2];
        make.centerX.mas_equalTo(self);
    }];
    
    [self.stockLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.mas_equalTo(self.priceLabel.mas_bottom)setOffset:2];
        make.centerX.mas_equalTo(self);
    }];
    
    [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.imageView.mas_bottom);
        make.left.mas_equalTo(self.imageView);
        make.size.mas_equalTo(CGSizeMake(30, 15));
    }];
}

- (void)setRecommendItem:(HMRecommendItem *)recommendItem {
    _recommendItem = recommendItem;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:recommendItem.image_url]];
    self.tipLabel.text = recommendItem.nature;
    _stockLabel.text = [NSString stringWithFormat:@"仅剩：%@件",recommendItem.stock];
    _priceLabel.text = ([recommendItem.price integerValue] >= 10000) ? [NSString stringWithFormat:@"¥ %.2f万",[recommendItem.price floatValue] / 10000.0] : [NSString stringWithFormat:@"¥ %.2f",[recommendItem.price floatValue]];
}

- (UIImageView *)imageView {
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _imageView;
}

- (UILabel *)priceLabel {
    if (_priceLabel == nil) {
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.font = PFR12Font;
        _priceLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _priceLabel;
}

- (UILabel *)stockLabel {
    if (_stockLabel == nil) {
        _stockLabel = [[UILabel alloc] init];
        _stockLabel.textColor = [UIColor darkGrayColor];
        _stockLabel.font = PFR10Font;
        _stockLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _stockLabel;
}

- (UILabel *)tipLabel {
    if (_tipLabel == nil) {
        _tipLabel = [[UILabel alloc] init];
        _tipLabel.textAlignment = NSTextAlignmentCenter;
        _tipLabel.backgroundColor = [UIColor redColor];
        _tipLabel.font = PFR10Font;
        _tipLabel.textColor = [UIColor whiteColor];
    }
    return _tipLabel;
}

@end
