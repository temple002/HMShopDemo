//
//  HMWelfareCell.m
//  利用collectionView做电商首页
//
//  Created by Temple on 2018/1/24.
//  Copyright © 2018年 Temple. All rights reserved.
//

#import "HMWelfareCell.h"
#import "Masonry.h"
#import "HMWelfareLayout.h"
#import "HMImageCell.h"

static NSString *const HMImageCellID = @"HMImageCellID";

@interface HMWelfareCell()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *collectionView;

@end

@implementation HMWelfareCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.collectionView];
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HMImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HMImageCellID forIndexPath:indexPath];
    NSArray *imageArr = GoodsNewWelfareImagesArray;
    cell.imageUrlStr = imageArr[indexPath.row];
    return cell;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        HMWelfareLayout *layout = [[HMWelfareLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.frame = self.bounds;
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;

        [_collectionView registerClass:[HMImageCell class] forCellWithReuseIdentifier:HMImageCellID];
    }
    return _collectionView;
}

@end
