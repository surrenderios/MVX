//
//  MVVM_ViewModel.m
//  MVX
//
//  Created by Alex_Wu on 9/29/20.
//

#import "MVVM_ViewModel.h"
@interface MVVM_ViewModel()
@property (nonatomic, strong) MVVM_Model *model;
@end

@implementation MVVM_ViewModel
- (instancetype)initWithModel:(MVVM_Model *)model;
{
    if (self = [super init]) {
        _model = model;
    }
    return self;
}

- (void)setVm_backgroundColor:(UIColor *)vm_backgroundColor
{
    // FIX ME 此处逻辑不严谨, 只做示例说明
    //  避免双向绑定循环调用
    if (self.model.backgroundColor == vm_backgroundColor) {
        return;
    }
    
    [self willChangeValueForKey:@"vm_backgroundColor"];
    [self.model setBackgroundColor:vm_backgroundColor];
    [self didChangeValueForKey:@"vm_backgroundColor"];
}
@end
