//
//  SafeTimer.m
//  SafeTimerDemo
//
//  Created by JackPersonal on 2022/4/19.
//

#import "SafeTimer.h"

@implementation SafeTimer{
    NSTimer *_timer;
}

- (void)dealloc{
    NSLog(@"safeTimer dealloc");
    [super dealloc];
}

#pragma mark - Private
- (void)actionTimeUp{
    if (self.delegate && [self.delegate respondsToSelector:@selector(timerTimeUp)]) {
        [self.delegate timerTimeUp];
    }
}

- (void)removeTimer{
    if (_timer) {
        [_timer invalidate];
        [_timer release]; _timer = nil;
    }
}

#pragma mark - Public
- (void)fireTimerPerSecond:(NSTimeInterval)ti{
    [self removeTimer];
    _timer = [[NSTimer scheduledTimerWithTimeInterval:ti target:self selector:@selector(actionTimeUp) userInfo:nil repeats:YES] retain];
}

- (void)stopTimer{
    [self removeTimer];
    self.delegate = nil;
}

@end
