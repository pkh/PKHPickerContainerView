//
//  DemoViewController.h
//  PKHPickerDemoApp
//
//  Created by Patrick Hanlon on 11/15/12.
//  Copyright (c) 2012 pkh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PKHPickerContainerView.h"


@interface DemoViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic) PKHPickerContainerView *pickerContainerView;
@property (nonatomic) UILabel *myLabel;

@end
