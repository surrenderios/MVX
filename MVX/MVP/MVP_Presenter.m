//
//  MVP_Presenter.m
//  MVX
//
//  Created by Alex_Wu on 9/29/20.
//

#import "MVP_Presenter.h"

@interface MVP_Presenter ()
@property (nonatomic, strong) MVP_Model *model;
@property (nonatomic, weak) id<MVPPresenterProtocol> protocol;
@end

@implementation MVP_Presenter
- (instancetype)initWithModel:(MVP_Model *)model viewController:(id<MVPPresenterProtocol>)protocol;
{
    if (self = [super init]) {
        _model = model;
        _protocol = protocol;
        
        // presenter 和 model 通信
        // 1. 通过 update 更新 model
        [_model setBackgroundColor:[UIColor blackColor]];
        // 2. notify 告知 presenter
        [_model addObserver:self forKeyPath:@"backgroundColor" options:NSKeyValueObservingOptionNew context:NULL];
    }
    return self;
}

- (void)btnClicked:(id)sender
{
    NSLog(@"presenter 接收到了来自 controller 的 update");
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"backgroundColor"]) {
        // presenter 通过协议方法通知 controller
        [self.protocol setBackgroundColor:self.model.backgroundColor];
    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self forKeyPath:@"backgroundColor"];
}
@end
