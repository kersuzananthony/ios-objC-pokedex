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
}

- (IBAction)backPressed:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
