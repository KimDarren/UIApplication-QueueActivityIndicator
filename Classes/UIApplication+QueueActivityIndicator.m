//    The MIT License (MIT)
//
//    Copyright (c) 2016 KIM TAE JUN
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy
//    of this software and associated documentation files (the "Software"), to deal
//    in the Software without restriction, including without limitation the rights
//    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//    copies of the Software, and to permit persons to whom the Software is
//    furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in all
//    copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//    SOFTWARE.

#import <objc/runtime.h>
#import "UIApplication+QueueActivityIndicator.h"

@interface UIApplication ()

@property (nonatomic) NSInteger indicatorCount;

@end

@implementation UIApplication (QueueActivityIndicator)

- (void)pushActivityIndicator
{
    self.indicatorCount ++;
    [self reloadActivityIndicator];
}

- (void)popActivityIndicator
{
    self.indicatorCount = MAX(0, self.indicatorCount - 1);
    [self reloadActivityIndicator];
}

- (void)reloadActivityIndicator
{
    self.networkActivityIndicatorVisible = (self.indicatorCount > 0);
}

#pragma mark - Indicator count

- (NSInteger)indicatorCount
{
    NSNumber *indicatorCount = objc_getAssociatedObject(self, @selector(indicatorCount));
    if (!indicatorCount) {
        return 0;
    }
    return indicatorCount.integerValue;
}

- (void)setIndicatorCount:(NSInteger)indicatorCount
{
    objc_setAssociatedObject(self, @selector(indicatorCount), @(indicatorCount), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end