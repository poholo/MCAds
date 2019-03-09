
#import <UIKit/UIKit.h>

/**
 * 广告来源
 */
typedef NS_ENUM(NSInteger, MCAdSourceType) {
    MCAdSourceBaidu,
    MCAdSourceTencent,
    MCAdSourceInmmobi,
    MCAdSourceCustom,
};


/**
 * 广告样式
 */
typedef NS_ENUM(NSInteger, MCAdStyleType) {
    MCAdStyleLittle,       ///< 小图模式
    MCAdStyleBig,          ///< 大图模式
    MCAdStyleOriention,    ///< 横幅模式
    MCAdStyleMutiple,      ///< 多图模式
    MCAdStyleContinuePlay,  ///< 联播模式
    MCAdStyleCollection,
    MCAdStyleH5
};

/***
 * 广告素材类型
 */
typedef NS_ENUM(NSInteger, MCAdMaterialType) {
    MCAdMaterialTextImage,
    MCAdMaterialVideo,
    MCAdMaterialTemplate,
};

/**
 * 广告类型
 */
typedef NS_ENUM(NSInteger, MCAdCategoryType) {
    MCAdCategorySplash,
    MCAdCategoryDataFlow,
    MCAdCategoryDataPre,
    MCAdCategoryDataPause
};

#if DEBUG
#define MCLog(fmt, ...) NSLog((@"%s %d " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define MCLog(fmt, ...)
#endif

extern NSString *const MC_ERROR_DOMAIM;
extern NSString *const MC_ERROR_MESSAGE;

extern NSString *const MC_DATA_SUCCESS;
extern NSString *const MC_DATA_DICT;

@interface MCAdDef : NSObject

@end