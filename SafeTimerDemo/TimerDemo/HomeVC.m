//
//  HomeVC.m
//  SafeTimerDemo
//
//  Created by JackPersonal on 2022/4/19.
//

#import "HomeVC.h"
#import "DetailVC.h"

@interface HomeVC ()

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    
    DetailVC *vc = [[DetailVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    [vc release]; vc = nil;
}

@end
