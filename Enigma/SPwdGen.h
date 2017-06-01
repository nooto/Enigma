//
//  SPwdGen.h
//  Enigma
//
//  Created by GaoAng on 2017/6/1.
//  Copyright © 2017年 selfWork.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPwdGen : NSObject
+(SPwdGen*)shareInstance;
-(NSString*)generationRandomPassword:(NSString*)inputKey;
@end
