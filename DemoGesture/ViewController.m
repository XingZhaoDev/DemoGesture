//
//  ViewController.m
//  DemoGesture
//
//  Created by Xing Zhao on 2021-11-16.
//

#import "ViewController.h"
#import "UISwipeDownLeftGesture.h"

@interface ViewController () <UIGestureRecognizerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.orangeColor;

    UISwipeDownLeftGesture* gesture = [[UISwipeDownLeftGesture alloc]initWithTarget:self action:@selector(testGesture:)];
    gesture.delegate = self;
    [self.view addGestureRecognizer: gesture];
}

- (void)testGesture:(UIGestureRecognizer*)recognizer {
    NSLog(@"down left.......");
}

@end
