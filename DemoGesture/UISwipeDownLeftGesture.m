//
//  UISwipeDownLeftGesture.m
//  DemoGesture
//
//  Created by Xing Zhao on 2021-11-16.
//

#import "UISwipeDownLeftGesture.h"
@interface UISwipeDownLeftGesture ()
@property (nonatomic, assign) CGPoint startPoint;
@end

@implementation UISwipeDownLeftGesture

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    if (touches.count != 1) {
        self.state = UIGestureRecognizerStateFailed;
        return;
    }
    UITouch* touch = (UITouch *)[[[event allTouches] allObjects] objectAtIndex: 0];
    self.startPoint = [touch locationInView:touch.view];
}


- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
}


- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    UITouch* endTouch = [touches anyObject];
    CGPoint endPoint = [endTouch locationInView:endTouch.view];
    if (self.startPoint.y < endPoint.y && self.startPoint.x > endPoint.x) {
        self.state = UIGestureRecognizerStateEnded;
        [self reset];
    } else {
        NSLog(@"invalid gesture direction");
    }
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
    self.state = UIGestureRecognizerStateCancelled;
}

- (void)reset {
    [super reset];
    self.startPoint = CGPointZero;
}

- (BOOL)shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    BOOL res = [super shouldRequireFailureOfGestureRecognizer:otherGestureRecognizer];
    return res;
}

- (BOOL)canPreventGestureRecognizer:(UIGestureRecognizer *)preventedGestureRecognizer{
    BOOL res = [super canPreventGestureRecognizer:preventedGestureRecognizer];
    self.state = UIGestureRecognizerStateCancelled;
    [self reset];
    return res;
}
@end
