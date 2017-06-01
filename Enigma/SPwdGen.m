//
//  SPwdGen.m
//  Enigma
//
//  Created by GaoAng on 2017/6/1.
//  Copyright © 2017年 selfWork.cn. All rights reserved.
//

#import "SPwdGen.h"

#define  OriginalKey   @"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz~!@#$%^&*()_+<>?,./;'[]{}|"
#define  PublicKey     @"abcdefghijklmnopqrstuvwxyz"

@implementation SPwdGen
+(SPwdGen*)shareInstance{
	static SPwdGen *_instance = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_instance = [[SPwdGen alloc] init];
	});
	return _instance;
}

-(id)init{
	if (self = [super init]) {

	}
	return self;
}

-(NSString*)generationRandomKeyWithkey:(NSString*)key length:(NSInteger)length{

	NSMutableString *wordKey = [[NSMutableString alloc] initWithString:key];
	for (NSInteger i = 0; i < wordKey.length; i++) {
		int number = arc4random() % wordKey.length;
		NSString *tempStr = [wordKey substringWithRange:NSMakeRange(i, 1)];
		NSString *tempStr1 = [wordKey substringWithRange:NSMakeRange(number, 1)];
		[wordKey replaceCharactersInRange:NSMakeRange(i, 1) withString:tempStr1];
		[wordKey replaceCharactersInRange:NSMakeRange(number, 1) withString:tempStr];
	}

	NSMutableString * result = [[NSMutableString alloc]initWithCapacity:length];
		//不会出现重复的key
	if (wordKey.length > length) {
		int number = arc4random() % (wordKey.length - length);
		[result appendString:[wordKey substringWithRange:NSMakeRange(number, length)]];
	}
		//可能会出现重复key
	else{
		for (NSInteger i = 0; i < length; i ++) {
			int number = arc4random() % wordKey.length;
			[result appendString:[wordKey substringWithRange:NSMakeRange(number, 1)]];
		}
	}
	return result;
}

-(NSDictionary*)generationRandomPassword:(NSString*)inputKey{
	if (inputKey.length <= 0) return nil;

	NSString *publicKey = [self generationRandomKeyWithkey:PublicKey length:PublicKey.length];
	NSString *Key = [self generationRandomKeyWithkey:OriginalKey length:publicKey.length];

	NSMutableString * result = [[NSMutableString alloc]initWithCapacity:inputKey.length];
	for (int i = 0; i < inputKey.length; i++){
		NSRange range = [publicKey rangeOfString:[inputKey substringWithRange:NSMakeRange(i, 1)]];
		NSInteger tempindex = 0;
		if (range.location != NSNotFound) {
			tempindex = range.location;
		}
		else{
			tempindex = arc4random() % publicKey.length;
		}

		if (tempindex >= Key.length) {
			tempindex = arc4random() % Key.length;
		}

		[result appendString:[Key substringWithRange:NSMakeRange(tempindex, 1)]];
	}

	NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithCapacity:3];
	[dict setValue:inputKey forKey:KDescrp];
	[dict setValue:result forKey:KPWD];
	[dict setValue:publicKey forKey:KPublicKey];
	[dict setValue:Key forKey:KKey];
	return dict;
}

@end
