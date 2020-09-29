//
//  MVVM_ViewModel.h
//  MVX
//
//  Created by Alex_Wu on 9/29/20.
//

#import <Foundation/Foundation.h>
#import "MVVM_Model.h"

NS_ASSUME_NONNULL_BEGIN

@interface MVVM_ViewModel : NSObject
- (instancetype)initWithModel:(MVVM_Model *)model;

@property (nonatomic, strong) UIColor *vm_backgroundColor;
@end

NS_ASSUME_NONNULL_END
