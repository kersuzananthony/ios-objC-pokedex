//
//  PokeCell.h
//  ios-objC-pokedex
//
//  Created by Kersuzan on 28/03/16.
//  Copyright © 2016 Kersuzan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pokemon.h"

@interface PokeCell : UICollectionViewCell

@property(nonatomic, strong, nonnull) Pokemon *pokemon;
@property(nonatomic, weak, nullable) IBOutlet UILabel *nameLabel;
@property(nonatomic, weak, nullable) IBOutlet UIImageView *thumbImage;

- (void)configureCellWithPokemon:(nonnull Pokemon *)aPokemon;

@end
