//
//  DemoViewController.m
//  PKHPickerDemoApp
//
//  Created by Patrick Hanlon on 11/15/12.
//  Copyright (c) 2012 pkh. All rights reserved.
//

#import "DemoViewController.h"
#import "PKHPickerContainerView.h"

@interface DemoViewController ()

@property (nonatomic) NSArray *pickerData;

@end

@implementation DemoViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    
    self.pickerData = @[@"Item 1", @"Item 2",@"Item 3",@"Item 4"];
    
    UIButton *showButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    showButton.frame = CGRectMake(10, 50, 300, 44);
    [showButton setTitle:@"Show Picker" forState:UIControlStateNormal];
    [showButton addTarget:self action:@selector(pickerButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showButton];
    
    self.myLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 320, 80)];
    self.myLabel.backgroundColor = [UIColor lightGrayColor];
    self.myLabel.text = @"";
    self.myLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.myLabel];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Picker Delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.pickerData count];;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.pickerData objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
}


#pragma mark - Button Actions

- (void)pickerButtonAction:(id)sender {
    
    if (!self.pickerContainerView) {
        self.pickerContainerView = [[PKHPickerContainerView alloc] initWithinView:self.view];
        [self.pickerContainerView.pickerView setDataSource:self];
        [self.pickerContainerView.pickerView setDelegate:self];
        
        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneButtonAction:)];
        UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonSystemItemCancel target:self action:@selector(cancelButtonAction:)];
        UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        
        [self.pickerContainerView setToolbarItems:@[cancelButton,spacer,doneButton]];
        
        [self.view addSubview:self.pickerContainerView];
        
        [self.pickerContainerView showPickerContainerView];
    }

}


- (void)doneButtonAction:(id)sender {
    
    NSLog(@"Chosen: %@",[self.pickerData objectAtIndex:[self.pickerContainerView.pickerView selectedRowInComponent:0]]);
    
    self.myLabel.text = [NSString stringWithFormat:@"%@",[self.pickerData objectAtIndex:[self.pickerContainerView.pickerView selectedRowInComponent:0]]];
    
    [self.pickerContainerView hidePickerContainerView];
    self.pickerContainerView = nil;
    
}

- (void)cancelButtonAction:(id)sender {
    
    [self.pickerContainerView hidePickerContainerView];
    self.pickerContainerView = nil;
    
}

@end
