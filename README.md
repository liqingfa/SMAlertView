# SMAlertView

![Pod Version](https://img.shields.io/cocoapods/v/SMAlertView.svg?style=flat)
![Pod Platform](https://img.shields.io/cocoapods/p/SMAlertView.svg?style=flat)
![Pod License](https://img.shields.io/cocoapods/l/SVProgressHUD.svg?style=flat)

`SMAlertView` is a clean and easy-to-use AlertView on iOS.

![SMAlert](http://obon901vh.bkt.clouddn.com/smalertview1.gif)![SMAlert](http://obon901vh.bkt.clouddn.com/smalertview2.gif)



## Installation

### From CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like `SMAlertView` in your projects. First, add the following line to your [Podfile](http://guides.cocoapods.org/using/using-cocoapods.html):

```ruby
pod 'SMAlertView', '~> 0.0.6'
```

Second, install `SMAlertView` into your project:

```ruby
pod install
```

### Manually

Drag the `AlertDemo/SMAlert` folder into your project.



## Usage

(see sample Xcode project in `SMAlertView`)

`SMAlertView` is created as a singleton (i.e. it doesn't need to be explicitly allocated and instantiated; you directly call `[SMAlert method]`).

### Showing the AlertView

You can show content only using one of the following:

```objective-c
+ (void)showContent:(NSString*)content;
+ (void)showContent:(NSString*)content confirmButton:(SMButton*)confirmButton;
+ (void)showContent:(NSString*)content confirmButton:(SMButton*)confirmButton cancleButton:(SMButton*)cancleButton;
```

If you'd like the AlertView with an image:

```objective-c
+ (void)showImage:(UIImage*)image content:(NSString*)content;
+ (void)showImage:(UIImage*)image content:(NSString*)content confirmButton:		(SMButton*)confirmButton;
+ (void)showImage:(UIImage*)image content:(NSString*)content confirmButton:(SMButton*)confirmButton cancleButton:(SMButton*)cancleButton;
```

### Dismissing the AlertView

The AlertView can be dismissed using:

```objective-c
+(void)hide;
```

If you'd like to perform some action after the AlertView hide completion，then the block will be released:

```objective-c
+(void)hideCompletion:(void (^)(void))completion;
```



## Customization

`SMAlertView` can be customized via the following methods:

```objective-c
+ (void)setFadeInAnimationDuration:(NSTimeInterval)duration;	// default is 0.15
+ (void)setFadeOutAnimationDuration:(NSTimeInterval)duration;	// default is 0.15
+ (void)setAlertBackgroundColor:(UIColor*)color;				// default is clear clolor
+ (void)setConfirmBtBackgroundColor:(UIColor*)color;			// default is white clolor
+ (void)setCancleBtBackgroundColor:(UIColor*)color;				// default is white clolor
+ (void)setConfirmBtTitleColor:(UIColor*)color;					// default is red clolor
+ (void)setCancleBtTitleColor:(UIColor*)color;					// default is blue clolor
+ (void)setContentTextColor:(UIColor*)color;					// default is black clolor
+ (void)setContentFont:(UIFont*)font;							// default is 15 
+ (void)setBtTitleFont:(UIFont*)font;							// default is 15 
+ (void)setContentLineSpace:(CGFloat)lineSpace;					// default is 4
+ (void)setTouchToHide:(BOOL)touchToHide;						// default is NO
+ (void)setContentTextAlignment:(NSTextAlignment)textAlignment;	// default is left

```



## License

`SMAlert` is distributed under the terms and conditions of the [MIT license](https://github.com/liqingfa/SMAlertView/blob/master/LICENSE)
