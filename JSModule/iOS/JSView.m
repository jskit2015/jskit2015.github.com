#import "JSView.h"
#import "UZAppUtils.h"
#import "JSKit.h"

@interface JSView ()
@end

@implementation JSView
- (instancetype)init: (NSDictionary *) params
{
    self = [super init];
    
    if (self) {
        self.propsInfo = @[@"frame", @"bgColor", @"hidden", @"alpha", @"superId", @"subIds"];
        self.delegate = [[UIView alloc] init];
        
        /* 设置实例属性. */
        NSArray * keys = [params allKeys];
        
        [keys enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if ([self.propsInfo containsObject: obj]) {
                id value = [params objectForKey: obj];
                if (nil != value) {
                    [self setValue: value forKey: obj];
                }
            }
        }];
    }
    
    return self;
}

- (void) setFrame:(NSDictionary *)frame
{
    CGRect delegateFrame = self.delegate.frame;
    
    NSNumber * x = [frame objectForKey: @"x"];
    NSNumber * y = [frame objectForKey: @"y"];
    NSNumber * w = [frame objectForKey: @"w"];
    NSNumber * h = [frame objectForKey: @"h"];
    
    if(x){
        delegateFrame.origin.x = [x floatValue];
    }
    
    if(y){
        delegateFrame.origin.y = [y floatValue];
    }
    
    if(w){
        delegateFrame.size.width = [w floatValue];
    }
    
    if(h){
        delegateFrame.size.height = [h floatValue];
    }
    
    self.delegate.frame = delegateFrame;
}

- (NSDictionary *)frame
{
    CGRect delegateFrame = self.delegate.frame;
    NSDictionary * frame = @{@"x": [NSNumber numberWithFloat: delegateFrame.origin.x],
                             @"y": [NSNumber numberWithFloat: delegateFrame.origin.y],
                             @"w": [NSNumber numberWithFloat: delegateFrame.size.width],
                             @"h": [NSNumber numberWithFloat: delegateFrame.size.height]};
    return frame;
}


- (void)setBgColor:(NSString *)bgColor
{
    UIColor * color = [UZAppUtils colorFromNSString: bgColor];
    
    self.delegate.backgroundColor = color;
}

- (NSString *)bgColor
{
    UIColor * color = self.delegate.backgroundColor;
    
    CGFloat red, green, blue, alpha;
    
    NSString * colorStr;
    
    if([color getRed: &red green: &green blue: &blue alpha: &alpha]){
        colorStr = [NSString stringWithFormat: @"rgba(%g, %g, %g, %g)", red * 255,
                           green * 255, blue * 255, alpha];
    }else{
        colorStr = @"rgba(0, 0, 0, 0)";
    }
    
    
    return colorStr;
}

- (void)setHidden:(BOOL)hidden
{
    [self.delegate setHidden: hidden];
}

- (BOOL)hidden
{
    return [self.delegate isHidden];
}

- (void)setAlpha:(CGFloat)alpha
{
    [self.delegate setAlpha: alpha];
}

- (CGFloat)alpha
{
    return self.delegate.alpha;
}

- (NSString *)superId
{
    JSKit * kit = [JSKit sharedKit];
    
    NSString * objId = [kit idOfObj: self.delegate.superview];
    
    return objId;
}

- (NSArray *)subIds
{
    NSArray * viewArray = self.delegate.subviews;
    
    JSKit * kit = [JSKit sharedKit];
    
    NSMutableArray * objIds = [NSMutableArray arrayWithCapacity: 42];
    [viewArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [objIds addObject: [kit idOfObj: obj]];
    }];
    
    return objIds;
}

@end
