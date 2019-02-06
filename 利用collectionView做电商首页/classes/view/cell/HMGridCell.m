//
//  HMGridCell.m
//  利用collectionView做电商首页
//
//  Created by Temple on 2018/1/23.
//  Copyright © 2018年 Temple. All rights reserved.
//

#import "HMGridCell.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"

@interface HMGridCell()

@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UILabel *desLabel;
@property (nonatomic,strong) UILabel *tipLabel;

@end

@implementation HMGridCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imageView];
        [self addSubview:self.desLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(10);
        make.size.mas_equalTo(CGSizeMake(45, 45));
        make.centerX.mas_equalTo(self);
    }];
    
    [self.desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self.imageView.mas_bottom).offset(5);
    }];
}

- (void)setGridItem:(HMGridItem *)gridItem {
    _gridItem = gridItem;
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:gridItem.iconImage] placeholderImage:[UIImage imageNamed:@"default_49_11"]];
    self.desLabel.text = gridItem.gridTitle;
}

- (UIImageView *)imageView {
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _imageView;
}

- (UILabel *)desLabel {
    if (_desLabel == nil) {
        _desLabel = [[UILabel alloc] init];
        _desLabel.font = PFR13Font;
        _desLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _desLabel;
}

@end
