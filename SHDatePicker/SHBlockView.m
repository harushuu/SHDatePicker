//
//  SHBlockView.m
//  SHDatePicker
//
//  Created by shuu on 7/10/16.
//  Copyright (c) 2016 @harushuu. All rights reserved.
//  Copyright (c) 2016 @harushuu. All rights reserved.
//
// The MIT License (MIT)
//
// Copyright (c) 2016 @harushuu
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of
// this software and associated documentation files (the "Software"), to deal in
// the Software without restriction, including without limitation the rights to
// use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
// the Software, and to permit persons to whom the Software is furnished to do so,
// subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


#import "SHBlockView.h"
#import <Masonry/Masonry.h>

@implementation SHBlockView

# pragma mark - initialization

+ (SHBlockView *)sharedView {
    static SHBlockView *sharedView = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedView = [[[self class] alloc] init];
    });
    return sharedView;
}

- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor darkGrayColor];
        self.alpha = 0.6;
        self.hidden = YES;
        UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
        [window addSubview:self];
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(window);
        }];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGeatureHandle)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

# pragma mark - private API

- (void)tapGeatureHandle {
    if (self.willDismissBlockView) self.willDismissBlockView();
}

@end
