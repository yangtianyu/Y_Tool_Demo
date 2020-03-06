#import "Y_DateTool.h"

static NSString * const defaultFormat = @"yyyyMMddHHmmss";

@implementation Y_DateTool

+ (NSString *)currentTimestamp{
    NSDate * date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval time = [date timeIntervalSince1970] * 1000;
    NSString *timeString = [NSString stringWithFormat:@"%.0f", time];
    return timeString;
}

+ (NSString *)currentDateStringWithFormat:(NSString * __nullable)format{
    if(!format){
        format = defaultFormat;
    }
    NSDate * currentDate = [NSDate date];
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSString * dateString = [dateFormatter stringFromDate:currentDate];
    return dateString;
}

+ (NSString *)getDateStringWithTimeStr:(NSString * __nullable)str  format:(NSString * __nullable)format{
    if(!format){
        format = defaultFormat;
    }
    NSTimeInterval time = [str doubleValue] / 1000;
    NSDate *detailDate = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSString *currentDateStr = [dateFormatter stringFromDate:detailDate];
    return currentDateStr;
}

+ (NSString *)getTimeStrWithString:(NSString * __nullable)str format:(NSString * __nullable)format{
    if(!format){
        format = defaultFormat;
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSDate *tempDate = [dateFormatter dateFromString:str];
    NSString *timeStr = [NSString stringWithFormat:@"%ld", (long)[tempDate timeIntervalSince1970]*1000];
    return timeStr;
}

@end

