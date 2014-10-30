//
//  RootView.h
//  PhotoTest
//
//  Created by chen on 14-10-29.
//  Copyright (c) 2014年 zichen0422. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+fixOrientation.h"

@interface RootView : UIViewController<UIImagePickerControllerDelegate, UICollectionViewDataSource, UICollectionViewDelegate>
{
    NSDateFormatter *m_formatter;
}
@property(nonatomic, strong)UIImagePickerController *imageControl;
@property(nonatomic, strong)NSMutableDictionary *imageDic;
@property(nonatomic, strong)IBOutlet UICollectionView *m_CollectionView;
@property(nonatomic, strong)NSString *docDirPath;

@end
