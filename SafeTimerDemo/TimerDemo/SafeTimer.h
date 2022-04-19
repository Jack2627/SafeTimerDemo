//
//  SafeTimer.h
//  SafeTimerDemo
//
//  Created by JackPersonal on 2022/4/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SafeTimerDelegate <NSObject>
@required
- (void)timerTimeUp;
@end

@interface SafeTimer : NSObject
@property(nullable, nonatomic, assign)id<SafeTimerDelegate> delegate;
- (void)fireTimerPerSecond:(NSTimeInterval)ti;
- (void)stopTimer;
@end

NS_ASSUME_NONNULL_END
