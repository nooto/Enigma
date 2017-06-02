//
//  SPwdGen.h
//  Enigma
//
//  Created by GaoAng on 2017/6/1.
//  Copyright © 2017年 selfWork.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#define  KName        @"name"
#define  KDescrp      @"descrp"
#define  KPublicKey   @"publicKey"
#define  KKey         @"key"
#define  KPWD         @"pwd"

#define  PwdGenShareInstance [SPwdGen shareInstance]


@interface SPwdGen : NSObject

@property (nonatomic, strong) NSMutableArray *mArrDatas;
+(SPwdGen*)shareInstance;
-(NSDictionary*)generationRandomPassword:(NSString*)inputKey;

-(BOOL)isExistName:(NSString*)name;
-(BOOL)savePasswordDataWithName:(NSString*)name data:(NSDictionary*)dict;
-(BOOL)removePwdDatasWithName:(NSString*)name;
@end
