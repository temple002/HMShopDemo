//
//  HMYoulikeCell.m
//  利用collectionView做电商首页
//
//  Created by Temple on 2018/1/27.
//  Copyright © 2018年 Temple. All rights reserved.
//

#import "HMYoulikeCell.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"

@interface HMYoulikeCell()

@property (nonatomic,strong) UIImageView *imageview;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *priceLabel;
@property (nonatomic,strong) UIButton *seeSameBtn;

@end

@implementation HMYoulikeCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imageview];
        [self addSubview:self.titleLabel];
        [self addSubview:self.priceLabel];
        [self addSubview:self.seeSameBtn];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        [make.top.mas_equalTo(self)setOffset:10];
        make.size.mas_equalTo(CGSizeMake(ScreenW * 0.5 - 50 , ScreenW * 0.5 - 50));
        
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.width.mas_equalTo(self).multipliedBy(0.8);
        make.height.mas_equalTo(40);
        [make.top.mas_equalTo(self.imageview.mas_bottom)setOffset:10];
        
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.imageview);
        make.width.mas_equalTo(self).multipliedBy(0.5);
        make.top.mas_equalTo(self.titleLabel.mas_bottom);
        
    }];
    
    [self.seeSameBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.right.mas_equalTo(self)setOffset:-10];
        make.centerY.mas_equalTo(_priceLabel);
        make.size.mas_equalTo(CGSizeMake(35, 18));
    }];
}

- (void)setItem:(HMRecommendItem *)item {
    _item = item;
    [self.imageview sd_setImageWithURL:[NSURL URLWithString:item.image_url]];
    self.titleLabel.text = item.main_title;
    self.priceLabel.text = [NSString stringWithFormat:@"￥%@",item.price];
}

- (UIImageView *)imageview {
    if (_imageview == nil) {
        _imageview = [UIImageView new];
        _imageview.contentMode = UIViewContentModeScaleToFill;
    }
    return _imageview;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = PFR12Font;
        _titleLabel.numberOfLines = 0;
        _titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLabel;
}

- (UILabel *)priceLabel {
    if (_priceLabel == nil) {
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.textColor = [UIColor redColor];
        _priceLabel.font = PFR15Font;
    }
    return _priceLabel;
}

- (UIButton *)seeSameBtn {
    if (_seeSameBtn == nil) {
        _seeSameBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _seeSameBtn.titleLabel.font = PFR10Font;
        [_seeSameBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [_seeSameBtn setTitle:@"看相似" forState:UIControlStateNormal];
        _seeSameBtn.layer.borderWidth = 1;
        _seeSameBtn.layer.borderColor = [UIColor darkGrayColor].CGColor;
        _seeSameBtn.layer.masksToBounds = YES;
    }
    return _seeSameBtn;
}

@end
