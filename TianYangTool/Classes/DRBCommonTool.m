//
//  DRBCommonTool.m
//  LittleBei
//
//  Created by 田洋 on 2018/11/30.
//  Copyright © 2018 田洋. All rights reserved.
//

#import "DRBCommonTool.h"

@implementation DRBCommonTool

+ (int)parseInt:(NSObject *)value
{
	if (value == nil || [value isKindOfClass:[NSNull class]])
	{
		return 0;
	}
	return ((NSNumber *)value).intValue;
}

+ (long long)parseLongLong:(NSObject *)value
{
	if (value == nil || [value isKindOfClass:[NSNull class]])
	{
		return 0;
	}
	return ((NSNumber *)value).longLongValue;
}

+ (NSString *)parseString:(NSObject *)value
{
	if (value == nil || [value isKindOfClass:[NSNull class]] || ![value isKindOfClass:[NSString class]])
	{
		return @"";
	}
	return (NSString *)value;
}
+ (NSString *)parseStringToZero:(NSObject *)value
{
	
	if ([[self parseString:value] isEqualToString:@""]) {
		return @"0";
	}
	return (NSString *)value;
}
/** 如果不是string 转换为string */
+ (NSString *)parseAutoConversionString:(NSObject *)value
{
	if (value == nil || [value isKindOfClass:[NSNull class]])
	{
		return @"";
	}
	
	if (![value isKindOfClass:[NSString class]])
	{
		return [NSString stringWithFormat:@"%@", value];
	}
	return (NSString *)value;
}

+ (double)parseDouble:(NSObject *)value
{
	if (value == nil || [value isKindOfClass:[NSNull class]])
	{
		return 0.0;
	}
	return ((NSNumber *)value).doubleValue;
}

+ (NSArray *)parseArray:(NSObject *)value
{
	if (value == nil || [value isKindOfClass:[NSNull class]] || ![value isKindOfClass:[NSArray class]])
	{
		return nil;
	}
	return (NSArray *)value;
}

+ (NSArray *)parseInitArray:(NSObject *)value
{
	NSArray *array = [self parseArray:value];
	if (!array)
	{
		return @[];
	}
	return array;
}

+ (NSDictionary *)parseDictionary:(NSObject *)value
{
	if (value == nil || [value isKindOfClass:[NSNull class]] || ![value isKindOfClass:[NSDictionary class]])
	{
		return nil;
	}
	return (NSDictionary *)value;
}

+ (NSDictionary *)parseInitDictionary:(NSObject *)value
{
	NSDictionary *dict = [self parseDictionary:value];
	if (!dict)
	{
		return @{};
	}
	return dict;
}

/** 是否是空字符串 */
+ (BOOL)isNullString:(NSString *)string
{
	return [[DRBCommonTool parseString:string] isEqualToString:@""];
}
/** 是否是空数组 */
+ (BOOL)isNullArray:(NSArray *)array
{
	return [DRBCommonTool parseArray:array].count == 0;
}
/** 是否是空字典 */
+ (BOOL)isNullDictionary:(NSDictionary *)dictionary
{
	return [DRBCommonTool parseInitDictionary:dictionary].allKeys.count == 0;
}
#pragma mark - 过滤空数据
/** 过滤空数据数组 */
+ (NSArray *)getFilterNilDataWithArray:(NSArray *)dataArray
{
	return [DRBCommonTool getFilterNilClassWithArray:dataArray objectClass:[NSObject class]];
}

/** 过滤空字符串数组 */
+ (NSArray *)getFilterNilStringWithArray:(NSArray *)stringArray
{
	return [DRBCommonTool getFilterNilClassWithArray:stringArray objectClass:[NSString class]];
}

/** 过滤指定类型空数据数组 */
+ (NSArray *)getFilterNilClassWithArray:(NSArray *)sourceArray objectClass:(Class)aClass
{
	NSMutableArray *filterArray = [NSMutableArray array];
	NSArray *parseArray = [DRBCommonTool parseArray:sourceArray];
	if (!parseArray || parseArray.count == 0)
	{
		return filterArray;
	}
	
	for (int i = 0; i < parseArray.count; i++)
	{
		NSObject *iObject = parseArray[i];
		if (iObject == nil || [iObject isKindOfClass:[NSNull class]] || ![iObject isKindOfClass:aClass])
		{
			continue;
		}
		[filterArray addObject:iObject];
	}
	return filterArray;
}
@end
