//
//  ViewController.m
//  Enigma
//
//  Created by GaoAng on 2017/3/8.
//  Copyright © 2017年 selfWork.cn. All rights reserved.
//

#import "ViewController.h"
#import "SPwdGen.h"
@interface ViewController ()
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

	[self.mDescrpTextField setKeyboardType:UIKeyboardTypeASCIICapable];
	    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)craetButtonAction:(id)sender{
	NSDictionary *dict = [[SPwdGen shareInstance] generationRandomPassword:self.mDescrpTextField.text];

	[self.mPublicKeyLabel setText:dict[KPublicKey]];
	[self.mKeyLabel setText:dict[KKey]];
	[self.mPwdLabel setText:dict[KPWD]];

	[PwdGenShareInstance savePasswordDataWithName:@"JIANSHEN" data:dict];


}

@end
