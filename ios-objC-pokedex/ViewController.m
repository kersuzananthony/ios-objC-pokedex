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

@interface ViewController ()

@end

@implementation ViewController

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PokeCell *pokeCell = (PokeCell *) [self.collectionView dequeueReusableCellWithReuseIdentifier:@"PokeCell" forIndexPath:indexPath];
    
    if (!pokeCell) {
        pokeCell = [[PokeCell alloc]init];
    }
    
    Pokemon *pokemon = [[Pokemon alloc]initWithName:@"Test" pokedexId:[NSNumber numberWithInteger:455]];
    [pokeCell configureCellWithPokemon:pokemon];
    
    return pokeCell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 718;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(105.0, 105.0);
}

@end
