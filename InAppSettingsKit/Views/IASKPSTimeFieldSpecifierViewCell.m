//
//  IASKPSTimeFieldSpecifierViewCell.m
//  http://www.inappsettingskit.com
//
//  Copyright (c) 2013:
//  Daniel Friedrich, ser.soft GmbH, http://www.sersoft.de
//  All rights reserved.
//
//  This code is licensed under the BSD license that is available at: http://www.opensource.org/licenses/bsd-license.php
//

#import "IASKPSTimeFieldSpecifierViewCell.h"
#import "IASKTimeField.h"
#import "IASKSettingsReader.h"

@implementation IASKPSTimeFieldSpecifierViewCell

@synthesize timeField=_timeField;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
		self.textLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleRightMargin;
        
        // TextField
        _timeField = [[IASKTimeField alloc] initWithFrame:CGRectMake(0, 0, 200, 21)];
        _timeField.autoresizingMask = UIViewAutoresizingFlexibleWidth |
        UIViewAutoresizingFlexibleBottomMargin |
        UIViewAutoresizingFlexibleLeftMargin;
        _timeField.font = [UIFont systemFontOfSize:17.0f];
		_timeField.minimumFontSize = kIASKMinimumFontSize;
        _timeField.textColor = [UIColor colorWithRed:0.275 green:0.376 blue:0.522 alpha:1.000];
        // Configure the inputView for the item
        UIDatePicker *timePicker = [[UIDatePicker alloc] init];
        timePicker.datePickerMode = UIDatePickerModeTime;
        [timePicker addTarget:self action:@selector(timePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
        _timeField.inputView = timePicker;
        [self.contentView addSubview:_timeField];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // Label
	CGFloat imageOffset = self.imageView.image ? self.imageView.bounds.size.width + kIASKPaddingLeft : 0;
    CGSize labelSize = [self.textLabel sizeThatFits:CGSizeZero];
	labelSize.width = MAX(labelSize.width, kIASKMinLabelWidth - imageOffset);
    self.textLabel.frame = (CGRect){self.textLabel.frame.origin, {MIN(kIASKMaxLabelWidth, labelSize.width), self.textLabel.frame.size.height}} ;
    
    // TimeField
    _timeField.center = CGPointMake(_timeField.center.x, self.contentView.center.y);
	CGRect timeFieldFrame = _timeField.frame;
	timeFieldFrame.origin.x = self.textLabel.frame.origin.x + MAX(kIASKMinLabelWidth - imageOffset, self.textLabel.frame.size.width) + kIASKSpacing;
	timeFieldFrame.size.width = _timeField.superview.frame.size.width - timeFieldFrame.origin.x - kIASKPaddingRight;
	
	if (!self.textLabel.text.length) {
		timeFieldFrame.origin.x = kIASKPaddingLeft + imageOffset;
		timeFieldFrame.size.width = self.contentView.bounds.size.width - 2* kIASKPaddingLeft - imageOffset;
	} else if (_timeField.textAlignment == NSTextAlignmentRight) {
		timeFieldFrame.origin.x = self.textLabel.frame.origin.x + labelSize.width + kIASKSpacing;
		timeFieldFrame.size.width = _timeField.superview.frame.size.width - timeFieldFrame.origin.x - kIASKPaddingRight;
	}
	_timeField.frame = timeFieldFrame;
}

- (void)timePickerValueChanged:(id)sender{
    UIDatePicker *timePicker = (UIDatePicker *)sender;
    NSDate *timeValue = timePicker.date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale currentLocale]];
    [formatter setDateStyle:NSDateFormatterNoStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    if (_timeField.timeFormat) {
        [formatter setDateFormat:_timeField.timeFormat];
    }
    [_timeField setText:[formatter stringFromDate:timeValue]];
    [_timeField setTimeValue:timePicker.date];
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"UITextFieldTextDidChangeNotification" object:_timeField];
    [_timeField sendActionsForControlEvents:UIControlEventEditingChanged];
}


@end

