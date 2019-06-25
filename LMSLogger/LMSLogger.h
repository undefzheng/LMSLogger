//
//  LMSLogger.h
//
//  Created by 不才 on 2019/6/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

void LMSVerboss(NSString *msg);
void LMSInfo(NSString *msg);
void LMSWarn(NSString *msg);
void LMSError(NSString *msg);

#define LMSLog(fmt, ...) LMSVerboss([NSString stringWithFormat:fmt, ##__VA_ARGS__])
#define LMSLogInfo(fmt, ...) LMSInfo([NSString stringWithFormat:fmt, ##__VA_ARGS__])
#define LMSLogWarn(fmt, ...) LMSWarn([NSString stringWithFormat:fmt, ##__VA_ARGS__])
#define LMSLogError(fmt, ...) LMSError([NSString stringWithFormat:fmt, ##__VA_ARGS__])

@interface LMSLogger : NSObject

+(LMSLogger *)instance;

//是否打开日志  默认打开
@property (nonatomic, assign)BOOL on;

@end

NS_ASSUME_NONNULL_END
