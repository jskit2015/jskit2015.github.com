#import <UIKit/UIKit.h>
#import "UZModule.h"

/**
 *  JSKit 是各个类的入口,它是一个单例类.
 */
@interface JSKit : UZModule

#pragma mark 单例方法.

/**
 *  获取单例类.
 *
 *  @return 单例对象.
 */
+(id)sharedKit;

#pragma mark 实例方法.
/**
 *  创建对象.

 *  @param params 参数.对象的id将通过回调函数传出.
 */
- (void) create: (NSDictionary *) params;

/**
 *  获取或设置属性.
 *
 *  @param params 参数.执行结果将通过传入的回调函数返回.
 */
- (void) config: (NSDictionary *) params;

/**
 *  调用某一方法.
 *
 *  @param params 参数.方法的返回值将通过传入的回调函数返回.
 */
- (void) action: (NSDictionary *) params;

/**
 *  设置某一个事件的回调函数.
 *
 *  @param params 参数.事件的回调函数通过此参数传入.
 */
- (void) on: (NSDictionary *) params;

/**
 *  删除对象.
 *
 *  @param params 参数.事件的回调函数通过此参数传入.
 */
- (void) destroy: (NSDictionary *) params;


#pragma mark 工具方法

/**
 *  获取对像的id.
 *
 *
 *  @param obj 对象.
 *
 *  @return 对像的id.
 */
- (NSString *) idOfObj: (id) obj;

/**
 *  获取指定id对应的对象.
 *
 *  @param objId 对象id.
 *
 *  @return id对应的原生对象.不存在返回nil, 存在但已删除返回 null.
 */
- (id) objOfId: (NSString *) objId;

/**
 *  删除指定id对应的对象.
 *
 *  对象删除后,可能不会立即从内存中消失,但无法再通过id操作此对象.
 *
 *  @param objId 对象id.
 *
 *  @return 删除成功,返回 YES; 删除失败,返回 NO.
 */
- (BOOL) deleteObjOfId: (NSString *) objId;

@end
