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
}

@property (nonatomic, strong) NSString *key;
@property (nonatomic, strong) NSDate *timeValue;
@property (nonatomic, strong) NSString *timeFormat;

@end
