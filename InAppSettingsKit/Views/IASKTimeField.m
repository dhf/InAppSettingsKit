//
//  IASKTimeField.m
//  http://www.inappsettingskit.com
//
//  Copyright (c) 2013:
//  Daniel Friedrich, ser.soft GmbH, http://www.sersoft.de
//  All rights reserved.
//
//  This code is licensed under the BSD license that is available at: http://www.opensource.org/licenses/bsd-license.php

#import "IASKTimeField.h"


@implementation IASKTimeField

@synthesize key=_key;
@synthesize timeValue=_timeValue;

- (void)dealloc {
    [_key release], _key = nil;
    [_timeValue release], _timeValue = nil;
	
    [super dealloc];
}

@end

