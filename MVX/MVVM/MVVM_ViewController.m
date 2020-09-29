//
//  MVVM_ViewController.m
//  MVX
//
//  Created by Alex_Wu on 9/29/20.
//

#import "MVVM_ViewController.h"
#import "MVVM_Model.h"
#import "MVVM_ViewModel.h"

@interface MVVM_ViewController ()
@property (nonatomic, strong) MVVM_ViewModel *viewModel;
@end

@implementation MVVM_ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    MVVM_Model *model = [[MVVM_Model alloc] init];
    self.viewModel = [[MVVM_ViewModel alloc] initWithModel:model];
}

- (void)bindingViewAndModel
{
    // 此处的实现方式较多, 比如用RAC
    // 这里我使用 KVO
    // 主要目的是去掉 MVP 中需要通过协议来实现通信
    // 这里采用双向绑定以后, 就去掉了 MVP 中协议
    [self.view addObserver:self forKeyPath:@"backgroundColor" options:NSKeyValueObservingOptionNew context:NULL];
    [self.viewModel addObserver:self forKeyPath:@"vm_backgroundColor" options:NSKeyValueObservingOptionNew context:NULL];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"backgroundColor"]) {
        [self.viewModel setVm_backgroundColor:self.view.backgroundColor];
    }else if ([keyPath isEqualToString:@"vm_backgroundColor"]){
        [self.view setBackgroundColor:self.viewModel.vm_backgroundColor];
    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
