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
    
    self.movesTableView.delegate = self;
    self.movesTableView.dataSource = self;
    self.movesTableView.hidden = YES;
    
    self.nameLabel.text = self.pokemon.name;
    self.thumbImage.image = [UIImage imageNamed:self.pokemon.pokedexId];
    self.currentEvoImage.image = [UIImage imageNamed:self.pokemon.pokedexId];
    self.pokedexIdLabel.text = self.pokemon.pokedexId;
    
    [self.pokemon downloadPokemonDetails:^{
        [self updateUserInterface];
    } moveCompletion:^{
        [self.movesTableView reloadData];
    }];
}

- (void)updateUserInterface {    
    self.defenseLabel.text = [NSString stringWithFormat:@"%@", self.pokemon.defense];
    self.attackLabel.text = [NSString stringWithFormat:@"%@", self.pokemon.attack];
    self.heightLabel.text = [NSString stringWithFormat:@"%@", self.pokemon.height];
    self.weightLabel.text = [NSString stringWithFormat:@"%@", self.pokemon.weight];
    self.typeLabel.text = [NSString stringWithFormat:@"%@", self.pokemon.type];
    self.pokeDescriptionLabel.text = [NSString stringWithFormat:@"%@", self.pokemon.pokeDescription];
    
    if (self.pokemon.nextEvoId && ![self.pokemon.nextEvoId isEqual:@""]) {
        self.nextEvoImage.image = [UIImage imageNamed: [NSString stringWithFormat:@"%@", self.pokemon.nextEvoId]];
        self.nextEvoImage.hidden = NO;
        NSString *nextEvolutionText = [NSString stringWithFormat:@"Next Evolution: %@", self.pokemon.nextEvoName];
        
        if (self.pokemon.nextEvoLvl && ![self.pokemon.nextEvoLvl isEqual:@""]) {
            nextEvolutionText = [nextEvolutionText stringByAppendingString:[NSString stringWithFormat:@"%@", self.pokemon.nextEvoLvl]];
        }
        
        self.nextEvoLabel.text = nextEvolutionText;
    } else {
        self.nextEvoLabel.text = @"No Evolution";
        self.nextEvoImage.hidden = YES;
    }
}

- (IBAction)backPressed:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)segmentControlPressed:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        self.movesTableView.hidden = YES;
        self.bioStackView.hidden = NO;
        self.evoIntroView.hidden = NO;
        self.evoStackView.hidden = NO;
    } else if (sender.selectedSegmentIndex == 1) {
        self.movesTableView.hidden = NO;
        self.bioStackView.hidden = YES;
        self.evoIntroView.hidden = YES;
        self.evoStackView.hidden = YES;
        [self.movesTableView reloadData];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.pokemon.moves.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MoveCell *moveCell = (MoveCell *) [self.movesTableView dequeueReusableCellWithIdentifier:@"MoveCell" forIndexPath:indexPath];
    
    if (!moveCell) {
        moveCell = [[MoveCell alloc]init];
    }
    
    [moveCell configureCellWithMove:self.pokemon.moves[indexPath.row]];
    
    return moveCell;
}

@end
