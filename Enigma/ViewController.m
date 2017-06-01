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

	NSLog(@"%@", [[SPwdGen shareInstance] generationRandomPassword:@"jianshe"]);
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
