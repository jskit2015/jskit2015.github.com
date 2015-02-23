#import "JSKit.h"
#import "JSView.h"


@interface JSKit ()
@property (strong, nonatomic) NSMutableDictionary * objs; //!< 存储原生

@end

@implementation JSKit

# pragma mark 单例实现.

+(instancetype)sharedKit {
    
    static JSKit * sharedKit = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        sharedKit = [[super allocWithZone:NULL] init ];
        
    });
    
    return sharedKit;
}

- (instancetype)init
{
    self = [super init];
    
    if(self){
        /* 一些初始化操作. */
        self.objs = [NSMutableDictionary dictionaryWithCapacity: 42];
    }
    
    return self;
}

+(id)allocWithZone:(NSZone *)zone
{
    return [self sharedKit];
}

-(id)copyWithZone:(NSZone *)zone
{
    return self;
}

-(void)dealloc {
    /* Nothing To Do. */
    
}

#pragma mark 实例方法.

- (void) create: (NSDictionary *) params
{
    /**
     *  回调函数
     *
     *  @param resutl 可以是返回值或错误代码.
     */
    void (^ callback)(id) = ^(id result){
        NSNumber * cbId = [params objectForKey: @"cbId"];
        
        if (nil != cbId) {
            id ret = [NSNull null];
            id err = [NSNull null];
            
            if ([result isKindOfClass: [NSDictionary class]]) {
                ret = result;
            }else{
                err = @{@"code": result};
            }
            
            [self sendResultEventWithCallbackId:[cbId integerValue] dataDict: ret errDict: err doDelete: YES];
        }
    };
    
    NSString * className = [params objectForKey: @"class"];
    
    if(nil == className){
        callback(@1);
        return;
    }
    
    Class  targetClass =  NSClassFromString(className);
    
    if (nil == targetClass) {
        callback(@1);
        return;
    }
    
    NSDictionary * info = [params objectForKey: @"info"];
    
    id obj = [[targetClass alloc] init: info];
    
    if (nil == obj) {
        callback(@3);
        return;
    }
    
    NSString * objId = [self idOfObj: obj];
    
    
    callback(@{@"id": objId});
    
    // !!!: 一个暂时的辅助操作:
    [self.viewController.view addSubview: [(JSView *)obj delegate]];
}

- (void) config: (NSDictionary *) params
{
    
}

- (void) action: (NSDictionary *) params
{
    
}

- (void) on: (NSDictionary *) params
{
    
}

-(void)destroy:(NSDictionary *)params
{
    
}

#pragma mark 工具方法.

- (NSString *) idOfObj: (id) obj
{
    if (nil == obj || [NSNull null] == obj) {
        return nil;
    }
    
    NSString * objId = nil;
    
    NSArray * array = [self.objs allKeysForObject: obj];
    
    if (0 == array.count) {
        for (; ; ) {
            objId = [NSString stringWithFormat: @"%d%d%d%d%d%d", arc4random() % 1000000, arc4random() % 1000000, arc4random() % 1000000, arc4random() % 1000000, arc4random() % 1000000, arc4random() % 1000000];
            
            if (nil == [self.objs objectForKey: objId]) {
                break;
            }
        }
        
        [self.objs setObject: obj forKey: objId];
    }else{
        objId = array[0];
    }
    
    return objId;
}


- (id) objOfId: (NSString *) objId
{
    id obj = [self.objs objectForKey: objId];
    
    return obj;
}


- (BOOL) deleteObjOfId: (NSString *) objId
{
    id obj = [self.objs objectForKey: objId];
    
    if (nil == obj) {
        return NO;
    }else{
        [self.objs setObject:[NSNull null] forKey: objId];
    }
    
    return YES;
}

@end
