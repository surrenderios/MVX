//
//  MVC_ViewController.m
//  MVX
//
//  Created by Alex_Wu on 9/29/20.
//

#import "MVC_ViewController.h"
#import "MVC_Model.h"

@interface MVC_ViewController ()
// Controller 同时持有 model 和 view
@property (nonatomic, strong) MVC_Model *model;
// UIViewController 本身已经持有了 view 了
//@property(null_resettable, nonatomic,strong) UIView *view;
@end

@implementation MVC_ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.model = [[MVC_Model alloc] init];
    
    // Model 和 Controller 的交互方式
    // 1 Controller 直接 update model
    [self.model setBackgroundColor:[UIColor redColor]];
    // 2 model 变化以后发送通知给 Controller
    // 此处使用观察者来接收 model 的变化通知
    [self.model addObserver:self forKeyPath:@"backgroundColor" options:NSKeyValueObservingOptionNew context:NULL];
    
    // View 和 Controller 的交互
    // 1. Controller 直接 update
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    // 2. View 通过 target-action 的形式发送事件给 ViewController
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    // 3. 其他例如通过 delegate 的形式,发送事件给 ViewController
    // 常见的例如 UITableView 的 delegate 中 didSelectedRow
}

- (void)btnClicked:(id)sender
{
    NSLog(@"view 通过 target-action 的形式接受 view 的事件");
}

// model 的 name 属性变化以后会调用该方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqual:@"name"]) {
        // Controller 直接 update
        [self.view setBackgroundColor:self.model.backgroundColor];
    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self forKeyPath:@"name"];
}
@end
