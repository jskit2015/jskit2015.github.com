## 概述

JSKit 是一个伟大的项目!  她试图提供一个公共的入口,来简化原生应用的开发! 借助她, web 开发者, 可以直接使用 JavaScript 来操作各种用作原生开发的第三方服务的SDK! 最小的学习成本, 最大的协作收获! 欢迎提供优秀源代码!One For All! All For one!

项目基于最流行的混合应用开发平台: [APICloud](http://www.apicloud.com)

## 方法
### create

创建一个新对象.

create(params, callback);

#### params

class：

- 类型：字符串.
- 默认值：无.
- 描述：类名.

info：

- 类型：JSON 对象.
- 默认值：无.
- 描述：用于初始化新对象的信息.

### callback(ret, err)

ret：

- 类型：JSON对象.
- 描述: 创建对象成功时返回.失败时,  ret 值为 null.

- 内部字段：

```js
{
       id:    "jskit001"   // 字符串, 对象 id.
}
```
err：

- 类型：JSON对象.
- 描述: 创建对象失败时返回.成功时,  err 值为 null.

- 内部字段：

```js
{
      code:   -1  // 数字,错误码.可选: -1, 未知错误; 1,类不存在; 2, 对象不存在; 3, 缺乏必须的初始化信息; 4, 对象已删除; 11, 属性不存在; 12, 属性值不合适; 13,属性只读;31,方法名不存在;32, 缺少必须的参数; 41, 事件不支持;
}
```

#### 示例代码

```js
var kit = api.require("JSKit");

kit.create({
	class: "JSView"
},function(ret,err){
	alert("ret: " + JSON.stringify(ret) + "\nerr: " + JSON.stringify(err));
});
```

#### 补充说明

无

#### 可用性

iOS系统，Android系统

可提供的 0.0.1 及更高版本

### config

设置或获取属性.

config(params, callback);

#### params

id：

- 类型：字符串.
- 默认值：无.
- 描述：对象唯一id.

name:

- 类型: 字符串.
- 默认值：无.
- 描述：属性名称.

value:

- 类型: 字符串.
- 默认值：无.
- 描述：属性的值.若为获取属性的值,请不要传这个字段.

### callback(ret, err)

ret：

- 类型：JSON对象.
- 描述:  设置或获取属性成功时返回.失败时,  ret 值为 null.

- 内部字段：

```js
{
       value:    "#FF0000"   // mixed,  属性的值.
}
```
err：

- 类型：JSON对象.
- 描述: 设置或获取属性失败时返回.成功时,  err 值为 null.

- 内部字段：

```js
{
      code:   -1  // 数字,错误码.可选: -1, 未知错误; 1,类不存在; 2, 对象不存在; 3, 缺乏必须的初始化信息; 4, 对象已删除; 11, 属性不存在; 12, 属性值不合适; 13,属性只读;31,方法名不存在;32, 缺少必须的参数; 41, 事件不支持;
}
```

#### 示例代码

```js
var kit = api.require("JSKit");

kit.create({
	class: "JSView"
},function(ret,err){
       if(ret){
         kit.config({
          id: ret.id,
          name: "bg",
          value: "#FF0000"}, function(ret, err){
                 alert("ret: " + JSON.stringify(ret) + "\nerr: " + JSON.stringify(err));
            });
       }
});
```

#### 补充说明

无

#### 可用性

iOS系统，Android系统

可提供的 0.0.1 及更高版本

### action

调用对象的方法.

action(params, callback);

#### params

id：

- 类型：字符串.
- 默认值：无.
- 描述：对象唯一id.

name:

- 类型: 字符串.
- 默认值：无.
- 描述：方法名称.

### callback(ret, err)

ret：

- 类型：JSON对象.
- 描述:  方法成功执行时返回.失败时,  ret 值为 null.

err：

- 类型：JSON对象.
- 描述: 方法执行失败时返回.成功时,  err 值为 null.

- 内部字段：

```js
{
      code:   -1  // 数字,错误码.可选: -1, 未知错误; 1,类不存在; 2, 对象不存在; 3, 缺乏必须的初始化信息; 4, 对象已删除; 11, 属性不存在; 12, 属性值不合适; 13,属性只读;31,方法名不存在;32, 缺少必须的参数; 41, 事件不支持;
}
```

#### 示例代码

```js
var kit = api.require("JSKit");

kit.create({
	class: "JSView"
},function(ret,err){
       if(ret){
         kit.action({
          id: ret.id,
         name: "setBg",
         value: "#FF0000"}, function(ret, err){
                 alert("ret: " + JSON.stringify(ret) + "\nerr: " + JSON.stringify(err));
            });
       }
});
```

#### 补充说明

无

#### 可用性

iOS系统，Android系统

可提供的 0.0.1 及更高版本

### on

给事件添加响应函数.

on(params, callback);

#### params

id：

- 类型：字符串.
- 默认值：无.
- 描述：对象唯一id.

name:

- 类型: 字符串.
- 默认值：无.
- 描述：事件名称.

### callback(ret, err)

ret：

- 类型：JSON对象.
- 描述:  添加成功后, 事件触发时传递给响应方法的参数.添加失败,ret 为 null.

err：

- 类型：JSON对象.
- 描述: 添加失败失败时返回.成功时,  err 值为 null.

- 内部字段：

```js
{
      code:   -1  // 数字,错误码.可选: -1, 未知错误; 1,类不存在; 2, 对象不存在; 3, 缺乏必须的初始化信息; 4, 对象已删除; 11, 属性不存在; 12, 属性值不合适; 13,属性只读;31,方法名不存在;32, 缺少必须的参数; 41, 事件不支持;
}
```

#### 示例代码

```js
var kit = api.require("JSKit");

kit.create({
	class: "JSView"
},function(ret,err){
       if(ret){
         kit.on({
          id: ret.id,
         name: "appear"}, function(ret, err){
                 alert("ret: " + JSON.stringify(ret) + "\nerr: " + JSON.stringify(err));
            });
       }
});
```

#### 补充说明

无

#### 可用性

iOS系统，Android系统

可提供的 0.0.1 及更高版本

### destory

删除一个对象.

destory(params, callback);

#### params

id：

- 类型：字符串.
- 默认值：无.
- 描述：对象id.

### callback(ret, err)

ret：

- 类型：JSON对象.
- 描述: 删除对象成功时返回.失败时,  ret 值为 null.

- 内部字段：

```js
{
       id:    "jskit001"   // 字符串, 对象 id.
}
```
err：

- 类型：JSON对象.
- 描述: 删除对象失败时返回.成功时,  err 值为 null.

- 内部字段：

```js
{
      code:   -1  // 数字,错误码.可选: -1, 未知错误; 1,类不存在; 2, 对象不存在; 3, 缺乏必须的初始化信息; 4, 对象已删除; 11, 属性不存在; 12, 属性值不合适; 13,属性只读;31,方法名不存在;32, 缺少必须的参数; 41, 事件不支持;
}
```

#### 示例代码

```js
var kit = api.require("JSKit");

kit.create({
	class: "JSView"
},function(ret,err){
   kit.destory({
      id: ret.id
   }, function(){
	alert("ret: " + JSON.stringify(ret) + "\nerr: " + JSON.stringify(err));
   });
});
```

#### 补充说明

删除对象后,对象可能不会立即从内存中消失,但将无法通过id使用该对象.

#### 可用性

iOS系统，Android系统

可提供的 0.0.1 及更高版本
