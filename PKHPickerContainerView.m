//
// PKHPickerContainerView.m
// PKHPickerContainerView
//
//
// This code is distributed under the terms and conditions of the MIT license.
//
// Copyright (c) 2012 Patrick Hanlon
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//


#import "PKHPickerContainerView.h"

#define kSelfHeight 260
#define kSelfWidth 320


#define kSHOW_OFFSCREEN CGRectMake(0, ([UIScreen mainScreen].bounds.size.height+1), kSelfWidth, kSelfHeight);
#define kSHOW_ONSCREEN CGRectMake(0, (self.parentView.bounds.size.height-kSelfHeight), kSelfWidth, kSelfHeight);


@interface PKHPickerContainerView ()
@property (nonatomic) UIView *parentView;
@end


@implementation PKHPickerContainerView

- (id)initWithinView:(UIView *)view {
    if (self = [super init]) {
        
        self.parentView = [[UIView alloc] init];
        self.parentView = view;

        self.frame = kSHOW_OFFSCREEN;
        
        self.toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, kSelfWidth, 44)];
        
        if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) { // for iOS 7 and above
            [self.toolbar setTintColor:[UIColor whiteColor]];
            [self.toolbar setBarTintColor:[UIColor blackColor]];
        } else {
            [self.toolbar setBarStyle:UIBarStyleBlack];
        }
        
        self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 44, kSelfWidth, 216)];
        self.pickerView.showsSelectionIndicator = YES;
        
        [self addSubview:self.toolbar];
        [self addSubview:self.pickerView];
    }
    
    return self;
}


#pragma mark - Show/hide view

- (void)showPickerContainerView {
    
    [UIView animateWithDuration:0.333 animations:^ {
        self.frame = kSHOW_ONSCREEN
    }];
    
}


- (void)hidePickerContainerView {
    
    [UIView animateWithDuration:0.333 animations:^ {
        self.frame = kSHOW_OFFSCREEN;
    }];
    
}

#pragma mark - 

- (void)setToolbarItems:(NSArray *)toolbarItems {
    self.toolbar.items = nil;
    self.toolbar.items = toolbarItems;
}


@end
