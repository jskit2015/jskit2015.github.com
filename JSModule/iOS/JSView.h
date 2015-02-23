#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JSView : NSObject

#pragma mark 工具属性.
@property (strong, nonatomic) UIView * delegate; //!< JSView 代理对像.
@property (strong, nonatomic) NSArray * propsInfo; //!< 数组,存储支持的属性名称.

#pragma mark 实例属性.
@property (strong, nonatomic) NSDictionary * frame; //!< 边框.
@property (strong, nonatomic) NSString * bgColor; //!< 背景色.
@property (assign, nonatomic) BOOL hidden; //!< 是否隐藏.
@property (assign, nonatomic) CGFloat alpha; //!< 透明度.
@property (strong, nonatomic, readonly) NSString * superId; //!< 父视图id.
@property (strong, nonatomic, readonly) NSArray * subIds; //!< 子视图id数组.


#pragma mark 方法.
/**
 *  初始化.
 *
 *  @param params 初始化时的参数.可选参数如果是给定的属性,也应合理处理.
 *
 *  @return 实例对象.
 */
- (instancetype)init: (NSDictionary *) params;

@end
