PKHPickerContainerView
======================

A UIView subclass to display a UIPickerView, with accompanying navigation bar, using keyboard or UIActionSheet-like hide/show animations.

PKHPickerContainerView was originally written in Xcode 4.5.2 and uses ARC. It does not use Interface Builder and is compatible out-of-the-box with the iPhone 4/4S and iPhone 5 screen sizes.

![screenshot](https://dl.dropbox.com/u/503108/pkhpickercontainerview-screenshot.png)

## Installation

There are only two files to add to your project:

- PKHPickerContainerView.h
- PKHPickerContainerView.m

Once you have both added to your project, in the header file of the view controller you wish to use the picker view, import the `PKHPickerContainerView.h` file.

Then implement the UIPickerView Data Source and Delegate protocols and add the picker container view as a property:

```objective-c
@interface MyClass : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic) PKHPickerContainerView *pickerContainerView;
````

In the implementation file, create and set the attributes. It's best to enclose the creation code within an if-clause to check if there's already a picker instantiated:
```objective-c
if (!self.picker)
{
}
```` 

Initialize the object and pass it the view it will be shown within (typically self.view): 
```objective-c
self.pickerContainerView = [[PKHPickerContainerView alloc] initWithinView:self.view];
````

Set its data source and delegate:
```objective-c
[self.pickerContainerView.pickerView setDataSource:self];
[self.pickerContainerView.pickerView setDelegate:self];
````

Then configure the navigation bar with whatever buttons or attributes you want, tying the buttons to actions within your view controller:
```objective-c
UINavigationItem *navItem = [[UINavigationItem alloc] init];
UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneButtonAction:)];
UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonSystemItemCancel target:self action:@selector(cancelButtonAction:)];
[navItem setRightBarButtonItem:doneButton];
[navItem setLeftBarButtonItem:cancelButton];
[self.pickerContainerView.navigationBar setItems:[NSArray arrayWithObject:navItem]];
[self.pickerContainerView.navigationBar setBarStyle:UIBarStyleBlack];
````

Then add the pickerContainerView to your view (it starts out offscreen), and then call its showPickerContainerViewMethod:
```objective-c
[self.view addSubview:self.pickerContainerView];        
[self.pickerContainerView showPickerContainerView];
````

Within your navigation bar button actions, you can hide the pickerContainerView, as well as gather chosen data within the "Done button action".

Gather chosen data:
```objective-c
self.myLabel.text = [NSString stringWithFormat:@"%@",[self.pickerData objectAtIndex:[self.pickerContainerView.pickerView selectedRowInComponent:0]]];
````

Then hide and nil out the picker view:
```objective-c    
[self.pickerContainerView hidePickerContainerView];
self.pickerContainerView = nil;
````

Also make sure you implement the UIPickerView delegate and datasource methods!


## License
This code is distributed under the terms and conditions of the MIT license. 

Copyright (c) 2012 Patrick Hanlon

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.