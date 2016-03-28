//
//  ViewController.m
//  ios-objC-pokedex
//
//  Created by Kersuzan on 28/03/16.
//  Copyright © 2016 Kersuzan. All rights reserved.
//

#import "ViewController.h"
#import "PokeCell.h"
#import "Pokemon.h"
#import "CSV.h"

@interface ViewController ()

@end

@implementation ViewController

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pokemons = [[NSMutableArray alloc]init];
    self.filteredPokemons = [[NSMutableArray alloc]init];
    self.isInSearchMode = NO;
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.searchBar.delegate = self;
    
    self.searchBar.returnKeyType = UIReturnKeyDone;
    
    [self parsePokemonCSVFile];
    [self initAudio];
}

- (void)parsePokemonCSVFile {
    NSString *pokemonCSVFilePath = [[NSBundle mainBundle]pathForResource:@"pokemon" ofType:@"csv"];
    
    CSV *csv = [[CSV alloc]initWithContentsOfUrl:pokemonCSVFilePath];
    NSMutableArray<NSDictionary<NSString *,NSString *> *> * rows = [csv rows];
    
    for (NSDictionary<NSString *, NSString *> *row in rows) {
        NSString *pokemonName = [row valueForKey:@"identifier"];
        NSString *pokemonId = (NSString *) [row valueForKey:@"id"];
        
        Pokemon *pokemon = [[Pokemon alloc]initWithName:pokemonName pokedexId:pokemonId];
        [self.pokemons addObject:pokemon];
    }
}

- (void)initAudio {
    NSString *musicPath = [[NSBundle mainBundle]pathForResource:@"music" ofType:@"mp3"];
    
    self.musicPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL URLWithString:musicPath] error:nil];
    [self.musicPlayer prepareToPlay];
    self.musicPlayer.numberOfLoops = -1;
    [self.musicPlayer play];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PokeCell *pokeCell = (PokeCell *) [self.collectionView dequeueReusableCellWithReuseIdentifier:@"PokeCell" forIndexPath:indexPath];
    
    if (!pokeCell) {
        pokeCell = [[PokeCell alloc]init];
    }
    
    Pokemon *pokemon = self.isInSearchMode ? [self.filteredPokemons objectAtIndex:indexPath.row] : [self.pokemons objectAtIndex:indexPath.row];
    [pokeCell configureCellWithPokemon:pokemon];
    
    return pokeCell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.isInSearchMode ? self.filteredPokemons.count : self.pokemons.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(105.0, 105.0);
}

- (IBAction)musicButtonPressed:(UIButton *)sender {
    if ([self.musicPlayer isPlaying]) {
        [self.musicPlayer stop];
        sender.alpha = 0.2;
    } else {
        [self.musicPlayer play];
        sender.alpha = 1.0;
    }
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if (searchText == nil || [searchText  isEqual: @""]) {
        self.isInSearchMode = NO;
        self.filteredPokemons = self.pokemons;
        [searchBar performSelector:@selector(resignFirstResponder) withObject:nil afterDelay:0.1];
    } else {
        self.isInSearchMode = YES;
        NSString *searchString = [searchText lowercaseString];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name CONTAINS %@", searchString];
        self.filteredPokemons = (NSMutableArray *) [self.pokemons filteredArrayUsingPredicate: predicate];
    }
    
    [self.collectionView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.view endEditing:YES];
}

@end
