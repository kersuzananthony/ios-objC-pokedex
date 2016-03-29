//
//  PokeDetailVC.m
//  ios-objC-pokedex
//
//  Created by Kersuzan on 28/03/16.
//  Copyright © 2016 Kersuzan. All rights reserved.
//

#import "PokeDetailVC.h"


@interface PokeDetailVC ()

@end

@implementation PokeDetailVC

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nameLabel.text = self.pokemon.name;
    self.thumbImage.image = [UIImage imageNamed:self.pokemon.pokedexId];
    self.currentEvoImage.image = [UIImage imageNamed:self.pokemon.pokedexId];
    self.pokedexIdLabel.text = self.pokemon.pokedexId;
    [self.pokemon downloadPokemonDetails:^{
        [self updateUserInterface];
    }];
}

- (void)updateUserInterface {    
    self.defenseLabel.text = [NSString stringWithFormat:@"%@", self.pokemon.defense];
    self.attackLabel.text = [NSString stringWithFormat:@"%@", self.pokemon.attack];
    self.heightLabel.text = [NSString stringWithFormat:@"%@", self.pokemon.height];
    self.weightLabel.text = [NSString stringWithFormat:@"%@", self.pokemon.weight];
    self.typeLabel.text = [NSString stringWithFormat:@"%@", self.pokemon.type];

}

- (IBAction)backPressed:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
