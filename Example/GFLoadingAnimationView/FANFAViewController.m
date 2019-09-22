//
//  FANFAViewController.m
//  GFLoadingAnimationView
//
//  Created by Guido Fanfani on 09/21/2019.
//  Copyright (c) 2019 Guido Fanfani. All rights reserved.
//

#import "FANFAViewController.h"
#import "GFLoadingAnimationView.h"

@interface FANFAViewController ()
@property (strong, nonatomic) IBOutlet UISlider *circleSize;
@property (strong, nonatomic) IBOutlet UISlider *spinnerWidth;
@property (strong, nonatomic) IBOutlet UISlider *imageSize;
@property (strong, nonatomic) IBOutlet UISwitch *imageOn;
@property (strong, nonatomic) IBOutlet UILabel *circleSizeLabel;
@property (strong, nonatomic) IBOutlet UILabel *spinnerWidthLabel;
@property (strong, nonatomic) IBOutlet UILabel *imageSizeLabel;
@property (strong, nonatomic) IBOutlet UIView *colorCircleBackgroundView;
@property (strong, nonatomic) IBOutlet UIView *colorSpinnerStrokeView;

@end

@implementation FANFAViewController {
	UIColor* colorCircleBackground;
	UIColor* colorSpinnerStroke;
	bool settingColorCircleBackground;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	[_circleSize addTarget:self action:@selector(onChangeCircleSize:) forControlEvents:UIControlEventValueChanged];
	[_spinnerWidth addTarget:self action:@selector(onChangeSpinnerWidth:) forControlEvents:UIControlEventValueChanged];
	[_imageSize addTarget:self action:@selector(onChangeImageSize:) forControlEvents:UIControlEventValueChanged];
	_circleSizeLabel.text = [NSString stringWithFormat:@"%.0f", _circleSize.value];
	_spinnerWidthLabel.text = [NSString stringWithFormat:@"%.0f", _spinnerWidth.value];
	_imageSizeLabel.text = [NSString stringWithFormat:@"%.02f %%", _imageSize.value];
	colorCircleBackground = [UIColor groupTableViewBackgroundColor];
	colorSpinnerStroke = [UIColor grayColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)start {
	[self setSettings];
	[GFLoadingAnimationView showLoadingView];
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		[GFLoadingAnimationView hideLoadingView];
	});
}

- (void)setSettings {
//	background
	[GFLoadingAnimationView setCircleSize:_circleSize.value];
	[GFLoadingAnimationView setCircleBackgroundColor:colorCircleBackground];
//	spinner
	[GFLoadingAnimationView setSpinnerStrokeColor:colorSpinnerStroke];
	[GFLoadingAnimationView setSpinnerStrokeWidth:_spinnerWidth.value];
//	image
	[GFLoadingAnimationView setImageSizePerc:_imageSize.value / 100];
	[GFLoadingAnimationView setImage:_imageOn.on ? [UIImage imageNamed:@"test"] : nil];
}

- (IBAction)onChangeCircleSize:(UISlider *)sender {
	_circleSizeLabel.text = [NSString stringWithFormat:@"%.0f", sender.value];
}

- (IBAction)onChangeSpinnerWidth:(UISlider *)sender {
	_spinnerWidthLabel.text = [NSString stringWithFormat:@"%.0f", sender.value];
}

- (IBAction)onChangeImageSize:(UISlider *)sender {
	_imageSizeLabel.text = [NSString stringWithFormat:@"%.02f %%", sender.value];
}

-(IBAction)chooseColor:(id)sender {
    FCColorPickerViewController *colorPicker = [FCColorPickerViewController colorPicker];
	if (((UIView*)sender).tag == 1) {
		colorPicker.color = colorCircleBackground;
		settingColorCircleBackground = true;
	} else {
		colorPicker.color = colorSpinnerStroke;
		settingColorCircleBackground = false;
	}
    colorPicker.delegate = self;
    
    [colorPicker setModalPresentationStyle:UIModalPresentationFormSheet];
    [self presentViewController:colorPicker animated:YES completion:nil];
}

#pragma mark - FCColorPickerViewControllerDelegate Methods

-(void)colorPickerViewController:(FCColorPickerViewController *)colorPicker didSelectColor:(UIColor *)color {
	if (settingColorCircleBackground) {
		colorCircleBackground = color;
		_colorCircleBackgroundView.backgroundColor = color;
	} else {
		colorSpinnerStroke = color;
		_colorSpinnerStrokeView.backgroundColor = color;
	}
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)colorPickerViewControllerDidCancel:(FCColorPickerViewController *)colorPicker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
