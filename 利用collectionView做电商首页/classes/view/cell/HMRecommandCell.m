//
//  HMRecommandCell.m
//  利用collectionView做电商首页
//
//  Created by WYSD-YTJ-010 on 2018/1/26.
//  Copyright © 2018年 Temple. All rights reserved.
//

#import "HMRecommandCell.h"
#import "HMImageCell.h"

static NSString *const HMImageCellID = @"HMImageCellID";

@interface HMRecommandCell()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSArray *recommands;

@end

@implementation HMRecommandCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.collectionView];
        self.recommands = GoodsRecommendArray;
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.recommands.count - 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HMImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HMImageCellID forIndexPath:indexPath];
    NSString *imageUrl = self.recommands[indexPath.row + 1];
    cell.imageUrlStr = imageUrl;
    
    return cell;
}

- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = CGSizeMake(self.bounds.size.width / 3.5, self.bounds.size.height);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.frame = self.bounds;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = self.backgroundColor;
        _collectionView.showsHorizontalScrollIndicator = NO;
        
        [_collectionView registerClass:[HMImageCell class] forCellWithReuseIdentifier:HMImageCellID];
    }
    return _collectionView;
}

@end
