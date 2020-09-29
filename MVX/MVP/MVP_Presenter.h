//
//  MVP_Presenter.h
//  MVX
//
//  Created by Alex_Wu on 9/29/20.
//

#import <Foundation/Foundation.h>
#import "MVP_Model.h"

NS_ASSUME_NONNULL_BEGIN

@protocol MVPPresenterProtocol <NSObject>
- (void)setBackgroundColor:(UIColor *)color;
@end

@interface MVP_Presenter : NSObject
- (instancetype)initWithModel:(MVP_Model *)model viewController:(id<MVPPresenterProtocol>)protocol;

- (void)btnClicked:(id)sender;
@end

NS_ASSUME_NONNULL_END
