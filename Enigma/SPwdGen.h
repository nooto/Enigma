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

@interface SPwdGen : NSObject
+(SPwdGen*)shareInstance;
-(NSDictionary*)generationRandomPassword:(NSString*)inputKey;
@end
