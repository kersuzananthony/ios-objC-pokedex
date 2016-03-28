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
    
    self.layer.cornerRadius = 10.0;
    self.clipsToBounds = YES;
}

- (void)configureCellWithPokemon:(Pokemon *)aPokemon {
    self.pokemon = aPokemon;
    
    self.nameLabel.text = [NSString stringWithFormat:@"%@", self.pokemon.name];
    self.thumbImage.image = [UIImage imageNamed: [NSString stringWithFormat:@"%@", self.pokemon.pokedexId]];
}

@end
