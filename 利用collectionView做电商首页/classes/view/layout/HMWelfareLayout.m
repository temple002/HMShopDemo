//
//  HMWelfareLayout.m
//  利用collectionView做电商首页
//
//  Created by Temple on 2018/1/24.
//  Copyright © 2018年 Temple. All rights reserved.
//

#import "HMWelfareLayout.h"

@interface HMWelfareLayout()

@property (nonatomic,strong) NSMutableArray *attributes;

@end

@implementation HMWelfareLayout

- (void)prepareLayout {
    [super prepareLayout];
    
    [self setAttributes];
}

// 计算每个item的属性，并保存到数组
- (void)setAttributes {
    NSInteger sections = [self.collectionView numberOfSections];
    for (int i=0; i<sections; i++) {
        NSInteger itemCount = [self.collectionView numberOfItemsInSection:i];
        for (int j=0; j<itemCount; j++) {
            UICollectionViewLayoutAttributes *attribute = [self attributesWithIndexPath:[NSIndexPath indexPathForItem:j inSection:i]];
            [self.attributes addObject:attribute];
        }
    }
}

// 返回每个item的属性
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return self.attributes;
}

- (UICollectionViewLayoutAttributes *)attributesWithIndexPath:(NSIndexPath *)indexpath {
    
    UICollectionViewLayoutAttributes *attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexpath];
    
    if (indexpath.section == 0) {
        // 目前只能三个
        CGFloat itemH = 85;
        CGFloat itemW = ScreenW / 2.0;
        
        if (indexpath.item == 0) {
            attribute.frame = CGRectMake(0, 0, itemW, itemH);
        }
        else if(indexpath.item == 1) {
            attribute.frame = CGRectMake(itemW, 0, itemW, itemH);
        }
        else {
            attribute.frame = CGRectMake(0, itemH, ScreenW, itemH);
        }
        return attribute;
    }
    else {
        return nil;
    }
}

- (NSMutableArray *)attributes {
    if (_attributes == nil) {
        _attributes = [NSMutableArray array];
    }
    return _attributes;
}

@end
