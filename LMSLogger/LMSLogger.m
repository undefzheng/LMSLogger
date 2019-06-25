//
//  LMSLogger.m
//
//  Created by 不才 on 2019/6/25.
//

#import "LMSLogger.h"
#import "CocoaLumberjack.h"

#ifdef DEBUG
static const int ddLogLevel = DDLogLevelVerbose;
#else
static const int ddLogLevel = DDLogLevelWarning;
#endif

@implementation LMSLogger

void LMSVerboss(NSString *msg){
    if ([[LMSLogger instance] on]) {
        DDLogVerbose(@"========= %@ =========", msg);
    }
}

void LMSInfo(NSString *msg){
    if ([[LMSLogger instance] on]) {
        DDLogInfo(@"========= %@ =========", msg);
    }
}

void LMSWarn(NSString *msg){
    if ([[LMSLogger instance] on]) {
        DDLogWarn(@"========= %@ =========", msg);
    }
}

void LMSError(NSString *msg){
    if ([[LMSLogger instance] on]) {
        DDLogError(@"========= %@ =========", msg);
    }
}

//单例
+ (LMSLogger *) instance{
    static dispatch_once_t LMSLogger_once_token;
    static LMSLogger *logger = nil;
    dispatch_once(&LMSLogger_once_token, ^{
        logger = [[LMSLogger alloc]init];
    });
    return logger;
}

//创建DDLogger实例
- (void)initDDLogger{
    NSString *documentsPath =  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    DDLogFileManagerDefault *documentsFileManager = [[DDLogFileManagerDefault alloc] initWithLogsDirectory:documentsPath];
    DDTTYLogger *consoleLogger = [DDTTYLogger sharedInstance];
    DDFileLogger *fileLogger = [[DDFileLogger alloc] initWithLogFileManager:documentsFileManager];
    [DDLog addLogger:consoleLogger];
    [DDLog addLogger:fileLogger withLevel:DDLogLevelInfo];
}

-(instancetype)init{
    self = [super init];
    if (self) {
        self.on = YES;
        
    }
    return self;
}

@end
