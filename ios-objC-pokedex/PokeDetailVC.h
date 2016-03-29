//
//  PokeDetailVC.h
//  ios-objC-pokedex
//
//  Created by Kersuzan on 28/03/16.
//  Copyright © 2016 Kersuzan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pokemon.h"

@interface PokeDetailVC : UIViewController

@property(nonatomic, strong) Pokemon *pokemon;
@property(nonatomic, weak) IBOutlet UILabel *nameLabel;
@property(weak, nonatomic) IBOutlet UIImageView *thumbImage;
@property(weak, nonatomic) IBOutlet UILabel *typeLabel;
@property(weak, nonatomic) IBOutlet UILabel *pokedexIdLabel;
@property(weak, nonatomic) IBOutlet UILabel *heightLabel;
@property(weak, nonatomic) IBOutlet UILabel *weightLabel;
@property(weak, nonatomic) IBOutlet UILabel *attackLabel;
@property(weak, nonatomic) IBOutlet UILabel *defenseLabel;
@property(weak, nonatomic) IBOutlet UIImageView *currentEvoImage;
@property(weak, nonatomic) IBOutlet UIImageView *nextEvoImage;
@property(weak, nonatomic) IBOutlet UILabel *nextEvoLabel;

- (IBAction)backPressed:(UIButton *)sender;

@end
