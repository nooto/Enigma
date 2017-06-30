//
//  ViewController.m
//  Enigma
//
//  Created by GaoAng on 2017/3/8.
//  Copyright © 2017年 selfWork.cn. All rights reserved.
//

#import "ViewController.h"
#import "SPwdGen.h"
#import "ListViewTableViewCell.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) IBOutlet UITableView *mTableView;
@property (nonatomic, weak) IBOutlet UIImageView *mEmptyImageView;
@property (nonatomic, weak) IBOutlet UILabel *mLabel;
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	[self adjustTableView];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)adjustTableView{
//	self.mTableView.hidden = PwdGenShareInstance.mArrDatas.count >0 ? NO :YES;
//	self.mEmptyImageView.hidden = self.mLabel.hidden = !self.mTableView.hidden;
	self.mTableView.hidden = NO;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return PwdGenShareInstance.mArrDatas.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	static NSString *identifier = @"ListViewTableViewCell";
	ListViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
	if ([cell isKindOfClass:[ListViewTableViewCell class]]) {
		if (indexPath.row < PwdGenShareInstance.mArrDatas.count) {
			[cell setMCurGenData:PwdGenShareInstance.mArrDatas[indexPath.row]];
		}
	}
	return cell;
}


@end
