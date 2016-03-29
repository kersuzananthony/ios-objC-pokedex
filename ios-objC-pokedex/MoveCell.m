//
//  MoveCell.m
//  ios-objC-pokedex
//
//  Created by Kersuzan on 29/03/16.
//  Copyright © 2016 Kersuzan. All rights reserved.
//

#import "MoveCell.h"

@implementation MoveCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.layer.cornerRadius = 5.0;
    self.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)configureCellWithMove:(Move *)aMove {
    self.moveNameLabel.text = [NSString stringWithFormat:@"%@", aMove.name];
    self.moveDescriptionLabel.text = [NSString stringWithFormat:@"%@", aMove.moveDescription];
    self.moveAccuracyLabel.text = [NSString stringWithFormat:@"%@", aMove.accuracy];
    self.movePowerLabel.text = [NSString stringWithFormat:@"%@", aMove.power];
}

@end
