## 概述

视图基类.所有UI相关的 JSKit 类的基类. 提供视图必须的基本属性和操作.

项目基于最流行的混合应用开发平台: [APICloud](http://www.apicloud.com)

## 初始化参数

无.

注意:

- 此处仅需列出初始化必须传的参数.
- 任何属性均可在初始化时传入,并会被正确处理.

## 属性

frame:

- 类型: JSON对象.
- 描述: 边框, 相对于父视图的位置.
- 读写: 可读可写.
- 默认: {x:0, y:0, w:0, h:0}
- 细节:

```js
{
      x:  0, // 数字,横坐标.
      y:  0, // 数字,纵坐标.
      w:  0, // 数字,视图宽度.
      h:  0  // 数字,视图高度.
}
```

bgColor:

- 类型: 字符串.
- 描述: 背景色.支持 # rgb, rgba
- 读写: 可读可写.
- 默认: 无.此时背景色和父视图背景色相同.

hidden:

- 类型: 布尔值.
- 描述: 是否隐藏.true, 隐藏; false, 显示.
- 读写: 可读可写.
- 默认: false.

alpha:

- 类型: 数字.
- 描述: 透明度. 可选: 0.0(完全透明) ~ 1.0 (完全不透明).
- 读写: 可读可写.
- 默认: 1.0.

superId:

- 类型: 字符串.
- 描述: 父视图的id.
- 读写: 只读.
- 默认: 无.

subIds:

- 类型: 数组.
- 描述: 所有子视图id组成的数组.
- 读写: 只读.
- 默认: 无.


## 方法
addSubview 
bringSubviewToFront
sendSubviewToBack
removeFromSuperview

insertSubview:atIndex:

insertSubview:aboveSubview:

insertSubview:belowSubview:

exchangeSubviewAtIndex:withSubviewAtIndex:

addGestureRecognizer:

removeGestureRecognizer:

gestureRecognizers


convertPoint:toView:

convertPoint:fromView:
convertRect:toView:

convertRect:fromView:

endEditing:


事件


### addSubview

添加子视图.

init(params);

#### params

无必须初始化参数.

### return

ret:

- 类型:JSON对象.
- 描述: 创建对象成功时返回.失败时,  ret 值为 null.

- 内部字段:

```js
{
       id:    "jskit001"   // 字符串, 对象 id.
}
```
err:

- 类型:JSON对象.
- 描述: 创建对象失败时返回.成功时,  err 值为 null.

- 内部字段:

```js
{
      code:   -1  // 数字,错误码.可选: -1, 未知错误; 1, 对象不存在; 2, 缺乏必须的初始化信息
}
```

#### 补充说明

无

#### 可用性

iOS系统，Android系统

可提供的 0.0.1 及更高版本
