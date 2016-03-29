//
//  PokeDetailVC.h
//  ios-objC-pokedex
//
//  Created by Kersuzan on 28/03/16.
//  Copyright © 2016 Kersuzan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pokemon.h"
#import "MoveCell.h"

@interface PokeDetailVC : UIViewController <UITableViewDelegate, UITableViewDataSource>

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
@property (weak, nonatomic) IBOutlet UILabel *pokeDescriptionLabel;
@property(weak, nonatomic) IBOutlet UITableView *movesTableView;
@property (weak, nonatomic) IBOutlet UIStackView *bioStackView;
@property (weak, nonatomic) IBOutlet UIStackView *evoStackView;
@property (weak, nonatomic) IBOutlet UIView *evoIntroView;

- (IBAction)backPressed:(UIButton *)sender;
- (IBAction)segmentControlPressed:(UISegmentedControl *)sender;

@end
