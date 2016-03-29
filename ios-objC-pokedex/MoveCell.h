//
//  MoveCell.h
//  ios-objC-pokedex
//
//  Created by Kersuzan on 29/03/16.
//  Copyright © 2016 Kersuzan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Move.h"

@interface MoveCell : UITableViewCell

@property(nonatomic, weak) IBOutlet UILabel *moveNameLabel;
@property(nonatomic, weak) IBOutlet UILabel *moveDescriptionLabel;
@property(nonatomic, weak) IBOutlet UILabel *movePowerLabel;
@property(nonatomic, weak) IBOutlet UILabel *moveAccuracyLabel;

- (void)configureCellWithMove:(Move *)aMove;

@end
