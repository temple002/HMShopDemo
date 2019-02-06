//
//  HMImageCell.m
//  利用collectionView做电商首页
//
//  Created by Temple on 2018/1/27.
//  Copyright © 2018年 Temple. All rights reserved.
//

#import "HMImageCell.h"
#import "UIImageView+WebCache.h"

@interface HMImageCell()

@property (nonatomic,strong) UIImageView *imageview;

@end

@implementation HMImageCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imageview];
    }
    return self;
}

- (void)setImageUrlStr:(NSString *)imageUrlStr {
    _imageUrlStr = imageUrlStr;
    
    [self.imageview sd_setImageWithURL:[NSURL URLWithString:imageUrlStr]];
}

- (UIImageView *)imageview {
    if (_imageview == nil) {
        _imageview = [[UIImageView alloc] init];
        _imageview.contentMode = UIViewContentModeScaleToFill;
        _imageview.frame = self.bounds;
    }
    return _imageview;
}

@end
