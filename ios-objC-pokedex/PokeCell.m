//
//  PokeCell.m
//  ios-objC-pokedex
//
//  Created by Kersuzan on 28/03/16.
//  Copyright © 2016 Kersuzan. All rights reserved.
//

#import "PokeCell.h"

@implementation PokeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)configureCellWithPokemon:(Pokemon *)aPokemon {
    self.pokemon = aPokemon;
    
    self.nameLabel.text = [NSString stringWithFormat:@"%@", self.pokemon.name];
    self.imageView.image = [UIImage imageNamed: [NSString stringWithFormat:@"%@", self.pokemon.pokedexId]];
}

@end
