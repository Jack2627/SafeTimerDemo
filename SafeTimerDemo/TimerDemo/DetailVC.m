//
//  DetailVC.m
//  SafeTimerDemo
//
//  Created by JackPersonal on 2022/4/19.
//

#import "DetailVC.h"
#import "SafeTimer.h"

static const NSInteger kDefaultSec = 10;

@interface DetailVC ()<SafeTimerDelegate>

@end

@implementation DetailVC{
    NSInteger _remainSec;
    UILabel *_img;          //模拟商品图片
    UILabel *_remainLabel;  //展示剩余时间
    SafeTimer *_timer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //准备工作
    _remainSec = kDefaultSec;
    [self setupInterface];
    //定时
    [self setupTimer];
    //展示初始时间
    [self updateLabel];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    _img.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.width);
    _remainLabel.frame = CGRectMake(0, CGRectGetMaxY(_img.frame), self.view.bounds.size.width, 30);
}

- (void)dealloc{
    NSLog(@"detailVC dealloc");
    if (_img) {
        [_img release]; _img = nil;
    }
    if (_remainLabel) {
        [_remainLabel release]; _remainLabel = nil;
    }
    if (_timer) {
        [_timer stopTimer];
        [_timer release]; _timer = nil;
    }
    [super dealloc];
}

#pragma mark - Private
- (void)setupInterface{
    _img = [[UILabel alloc] initWithFrame:CGRectZero];
    _img.textAlignment = NSTextAlignmentCenter;
    _img.backgroundColor = [UIColor grayColor];
    _img.text = @"img";
    [self.view addSubview:_img];
    
    _remainLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _remainLabel.textColor = [UIColor redColor];
    _remainLabel.font = [UIFont systemFontOfSize:30];
    [self.view addSubview:_remainLabel];
}

- (void)updateLabel{
    if (_remainSec <= 0) {
        _remainLabel.text = @"结束了";
    }else{
        _remainLabel.text = [NSString stringWithFormat:@"剩余%@s",@(_remainSec)];
    }
}

- (void)setupTimer{
    _timer = [[SafeTimer alloc] init];
    _timer.delegate = self;
    //回调的间隔时间
    [_timer fireTimerPerSecond:1];
}

#pragma mark - SafeTimerDelegate
- (void)timerTimeUp{
    _remainSec = _remainSec - 1;
    if (_remainSec <= 0) {
        //结束
        if (_timer) {
            [_timer stopTimer];
            [_timer release]; _timer = nil;
        }
    }
    [self updateLabel];
}

@end
