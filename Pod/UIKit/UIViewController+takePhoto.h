//
//  UIViewController+takePhoto.h
//  ZZFoundation
//
//  Created by zz on 16/1/8.
//  Copyright © 2016年 zz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (takePhoto)<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

/*打开照片库*/
- (void)localPhoto;

/*打开照相机*/
-(void)takePhoto;

@end
