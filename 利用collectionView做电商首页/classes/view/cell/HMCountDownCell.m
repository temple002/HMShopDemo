//
//  HMCountDownCell.m
//  利用collectionView做电商首页
//
//  Created by Temple on 2018/1/25.
//  Copyright © 2018年 Temple. All rights reserved.
//

#import "HMCountDownCell.h"
#import "HMCountDownItemCell.h"
#import "HMRecommendItem.h"
#import "MJExtension.h"

static NSString *const HMCountDownItemCellID = @"HMCountDownItemCellID";

@interface HMCountDownCell()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSArray <HMRecommendItem *>*recommendItems;

@end

@implementation HMCountDownCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.collectionView];
        [self setData];
    }
    return self;
}

- (void)setData {
    NSArray *countDownArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"CountDownShop.plist" ofType:nil]];
    self.recommendItems = [HMRecommendItem mj_objectArrayWithKeyValuesArray:countDownArray];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.recommendItems.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HMCountDownItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HMCountDownItemCellID forIndexPath:indexPath];
    cell.recommendItem = self.recommendItems[indexPath.row];
    return cell;
}

- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumLineSpacing = 1;
        layout.itemSize = CGSizeMake(self.frame.size.width/4, self.frame.size.height);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.frame = self.bounds;
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerClass:[HMCountDownItemCell class] forCellWithReuseIdentifier:HMCountDownItemCellID];
    }
    return _collectionView;
}

- (NSArray<HMRecommendItem *> *)recommendItems {
    if (_recommendItems == nil) {
        _recommendItems = [NSArray array];
    }
    return _recommendItems;
}

@end
