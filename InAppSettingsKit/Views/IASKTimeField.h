//
//  IASKTimeField.h
//  http://www.inappsettingskit.com
//
//  Copyright (c) 2013:
//  Daniel Friedrich, ser.soft GmbH, http://www.sersoft.de
//  All rights reserved.
//
//  This code is licensed under the BSD license that is available at: http://www.opensource.org/licenses/bsd-license.php
//

#import <UIKit/UIKit.h>


@interface IASKTimeField : UITextField {
    NSString *_key;
    NSDate   *_timeValue;
    NSString *_timeFormat;
}

@property (nonatomic, retain) NSString *key;
@property (nonatomic, retain) NSDate *timeValue;
@property (nonatomic, retain) NSString *timeFormat;

@end
