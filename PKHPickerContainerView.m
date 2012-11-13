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
#define kSelfHeight_STATUSBAR_NAVBAR 324


#define kPickerContainerView_CGRect_OFFSCREEN CGRectMake(0, ([UIScreen mainScreen].bounds.size.height+1), self.bounds.size.width, 260)
#define kPickerContainerView_CGRect_ONSCREEN CGRectMake(0, ([UIScreen mainScreen].bounds.size.height-kSelfHeight_STATUSBAR_NAVBAR), kSelfWidth, 260)


@implementation PKHPickerContainerView

- (id)init {
    if (self = [super init]) {
        
        self.frame = kPickerContainerView_CGRect_OFFSCREEN;
        
        self.navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, kSelfWidth, 44)];
        
        self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 44, kSelfWidth, 216)];
        self.pickerView.showsSelectionIndicator = YES;
        
        [self addSubview:self.navigationBar];
        [self addSubview:self.pickerView];
    }
    
    return self;
}


#pragma mark - Show/hide view

- (void)showPickerContainerView {
    
    [UIView animateWithDuration:0.333 animations:^ {
        self.frame = kPickerContainerView_CGRect_ONSCREEN;
    }];
    
}


- (void)hidePickerContainerView {
    
    [UIView animateWithDuration:0.333 animations:^ {
        self.frame = kPickerContainerView_CGRect_OFFSCREEN;
    }];
    
}

@end
