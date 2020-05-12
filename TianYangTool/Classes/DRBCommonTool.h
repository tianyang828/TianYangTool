//
//  DRBCommonTool.h
//  LittleBei
//
//  Created by 田洋 on 2018/11/30.
//  Copyright © 2018 田洋. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DRBCommonTool : NSObject

+ (int)parseInt:(NSObject *)value;

+ (long long)parseLongLong:(NSObject *)value;

+ (NSString *)parseString:(NSObject *)value;
/** 空字符串 转换为0 */
+ (NSString *)parseStringToZero:(NSObject *)value;
/** 如果不是string 转换为string */
+ (NSString *)parseAutoConversionString:(NSObject *)value;

+ (double)parseDouble:(NSObject *)value;

+ (NSArray *)parseArray:(NSObject *)value;

+ (NSArray *)parseInitArray:(NSObject *)value;

+ (NSDictionary *)parseDictionary:(NSObject *)value;

+ (NSDictionary *)parseInitDictionary:(NSObject *)value;

/** 是否是空字符串 */
+ (BOOL)isNullString:(NSString *)string;
/** 是否是空数组 */
+ (BOOL)isNullArray:(NSArray *)array;
/** 是否是空字典 */
+ (BOOL)isNullDictionary:(NSDictionary *)dictionary;

#pragma mark - 过滤空数据
/** 过滤空数据数组 */
+ (NSArray *)getFilterNilDataWithArray:(NSArray *)dataArray;

/** 过滤空字符串数组 */
+ (NSArray *)getFilterNilStringWithArray:(NSArray *)stringArray;

/** 过滤指定类型空数据数组 */
+ (NSArray *)getFilterNilClassWithArray:(NSArray *)sourceArray objectClass:(Class)aClass;


@end

NS_ASSUME_NONNULL_END
