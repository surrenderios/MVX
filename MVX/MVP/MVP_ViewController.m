//
//  MVP_ViewController.m
//  MVX
//
//  Created by Alex_Wu on 9/29/20.
//

#import "MVP_ViewController.h"
#import "MVP_Presenter.h"

@interface MVP_ViewController ()<MVPPresenterProtocol>
@property (nonatomic, strong) MVP_Model *model;
@property (nonatomic, strong) MVP_Presenter *presenter;
@end

@implementation MVP_ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // presenter 持有 model
    self.model = [[MVP_Model alloc] init];
    self.presenter = [[MVP_Presenter alloc] initWithModel:self.model viewController:self];
    
    // 1. View 通过 target-action 的形式发送事件给 controller
    // controller 再发送给 presenter
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    // 2. 其他例如通过 delegate 的形式,发送事件给 ViewController
    // 常见的例如 UITableView 的 delegate 中 didSelectedRow
}

- (void)btnClicked:(id)sender
{
    NSLog(@"view 通过 target-action 的形式接受 view 的事件, 然后传递给 presenter 处理");
    [self.presenter btnClicked:sender];
}


#pragma mark -
- (void)setBackgroundColor:(UIColor *)color;
{
    [self.view setBackgroundColor:color];
}
@end
