
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, AdSourceType) {
    AdSourceBaidu,
    AdSourceTencent,
    AdSourceInmmobi,
};


typedef NS_ENUM(NSInteger, AdDisplayStyleType) {
    AdDisplayStyleLittle,       ///< 小图模式
    AdDisplayStyleBig,          ///< 大图模式
    AdDisplayStyleOriention,    ///< 横幅模式
    AdDisplayStyleMutiple,      ///< 多图模式
    AdDisplayStyleContinuePlay,  ///< 联播模式
    AdDisplayStyleCollection,
    AdDisplayStyleCollectionH5
};

typedef NS_ENUM(NSInteger, SSPAdType) {
    SSPSplash,
    SSPDataFlow,
    SSPDataPre,
    SSPDataPause
};

#if DEBUG
#define MCLog(fmt, ...) NSLog((@"%s %d " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define MCLog(fmt, ...)
#endif

extern NSString *const ERROR_DOMAIM;
extern NSString *const ERROR_MESSAGE;

@interface MCAdDef : NSObject

@end