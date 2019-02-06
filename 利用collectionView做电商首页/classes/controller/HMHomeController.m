//
//  HMHomeController.m
//  利用collectionView做电商首页
//
//  Created by Temple on 2018/1/23.
//  Copyright © 2018年 Temple. All rights reserved.
//

#import "HMHomeController.h"
#import "MJExtension.h"
#import "HMGridItem.h"
#import "HMRecommendItem.h"
#import "HMGridCell.h"
#import "HMWelfareCell.h"
#import "HMCountDownCell.h"
#import "HMRecommandCell.h"
#import "HMImageCell.h"
#import "HMYoulikeCell.h"

static NSString *const HMGridCellID = @"HMGridCellID";
static NSString *const HMWelfareCellID = @"HMWelfareCellID";
static NSString *const HMCountDownCellID = @"HMCountDownCellID";
static NSString *const HMRecommandCellID = @"HMRecommandCellID";
static NSString *const HMImageCellID = @"HMImageCellID";
static NSString *const HMYoulikeCellID = @"HMYoulikeCellID";

@interface HMHomeController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,strong) NSArray <HMGridItem *> * gridItems;
@property (nonatomic,strong) NSArray <HMRecommendItem *> *youlikeItems;

@end

@implementation HMHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    [self setupData];
}

- (void)setupUI{
    self.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.collectionView];
    self.collectionView.backgroundColor = HMBGColor;
}

// 初始化数据
- (void)setupData {
    self.gridItems = [HMGridItem mj_objectArrayWithFilename:@"GoodsGrid.plist"];
    self.youlikeItems = [HMRecommendItem mj_objectArrayWithFilename:@"HomeHighGoods.plist"];
}

#pragma mark - collectionviewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 7;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return self.gridItems.count;
    } else if (section == 1 || section == 2 || section == 3) {
        return 1;
    } else if (section == 4) {
        return GoodsHandheldImagesArray.count;
    } else if (section == 5) {
        return self.youlikeItems.count;
    } else {
        return 0;
    }
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        HMGridCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HMGridCellID forIndexPath:indexPath];
        cell.gridItem = self.gridItems[indexPath.row];
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
    }
    else if (indexPath.section == 1) {
        HMWelfareCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HMWelfareCellID forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
    }
    else if (indexPath.section == 2) {
        HMCountDownCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HMCountDownCellID forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
    }
    else if (indexPath.section == 3) {
        HMRecommandCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HMRecommandCellID forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
    }
    else if (indexPath.section == 4) {
        HMImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HMImageCellID forIndexPath:indexPath];
        NSArray *images = GoodsHandheldImagesArray;
        cell.backgroundColor = [UIColor whiteColor];
        cell.imageUrlStr = images[indexPath.row];
        return cell;
    }
    else if (indexPath.section == 5) {
        HMYoulikeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HMYoulikeCellID forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        cell.item = self.youlikeItems[indexPath.row];
        return cell;
    }
    else {
        return nil;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return CGSizeMake(ScreenW/5 , ScreenW/5 + 10);
    }
    else if (indexPath.section == 1) {
        return CGSizeMake(ScreenW, 170);
    }
    else if (indexPath.section == 2) {//计时
        return CGSizeMake(ScreenW, 130);
    }
    else if (indexPath.section == 3) {
        return CGSizeMake(ScreenW, 105);
    }
    else if (indexPath.section == 4) {
        return [self sizeForItemAtIndexPath:indexPath].size;
    }
    else if (indexPath.section == 5) {
        return CGSizeMake((ScreenW - 4)/2, (ScreenW - 4)/2 + 40);
    }
    else {
        return CGSizeZero;
    }
}

- (UICollectionViewLayoutAttributes *)sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *layoutAttributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    if (indexPath.section == 4) {
        if (indexPath.row == 0) {
            layoutAttributes.size = CGSizeMake(ScreenW, ScreenW * 0.38);
        }else if (indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 4){
            layoutAttributes.size = CGSizeMake(ScreenW * 0.5, ScreenW * 0.24);
        }else{
            layoutAttributes.size = CGSizeMake(ScreenW * 0.25, ScreenW * 0.35);
        }
    }
    return layoutAttributes;
}

#pragma mark - head宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    return CGSizeMake(ScreenW, 10);  //推荐适合的宽高
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return (section == 5) ? 4:0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return (section == 5) ? 4:0;
}

#pragma mark - getter

- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.frame = self.view.bounds;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerClass:[HMGridCell class] forCellWithReuseIdentifier:HMGridCellID];
        [_collectionView registerClass:[HMWelfareCell class] forCellWithReuseIdentifier:HMWelfareCellID];
        [_collectionView registerClass:[HMCountDownCell class] forCellWithReuseIdentifier:HMCountDownCellID];
        [_collectionView registerClass:[HMRecommandCell class] forCellWithReuseIdentifier:HMRecommandCellID];
        [_collectionView registerClass:[HMImageCell class] forCellWithReuseIdentifier:HMImageCellID];
        [_collectionView registerClass:[HMYoulikeCell class] forCellWithReuseIdentifier:HMYoulikeCellID];
    }
    return _collectionView;
}

- (NSArray<HMGridItem *> *)gridItems {
    if (_gridItems == nil) {
        _gridItems = [NSArray array];
    }
    return _gridItems;
}

- (NSArray<HMRecommendItem *> *)youlikeItems {
    if (_youlikeItems == nil) {
        _youlikeItems = [NSArray array];
    }
    return _youlikeItems;
}

@end
