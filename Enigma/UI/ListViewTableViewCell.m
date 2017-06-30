//
//  ListViewTableViewCell.m
//  Enigma
//
//  Created by GaoAng on 2017/6/30.
//  Copyright © 2017年 selfWork.cn. All rights reserved.
//

#import "ListViewTableViewCell.h"

@interface ListViewTableViewCell ()
@property (nonatomic, strong) IBOutlet UILabel *mNameLabel;

@end
@implementation ListViewTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setMCurGenData:(NSDictionary *)mCurGenData{
	_mCurGenData = mCurGenData;
	[self.mNameLabel setText:mCurGenData[KDescrp]];
}

@end
