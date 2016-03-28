//
//  ViewController.h
//  ios-objC-pokedex
//
//  Created by Kersuzan on 28/03/16.
//  Copyright © 2016 Kersuzan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AVFoundation/AVFoundation.h"
#import "Pokemon.h"

@interface ViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate>

@property(nonatomic, strong) NSMutableArray<Pokemon *> *pokemons;
@property(nonatomic, strong) NSMutableArray<Pokemon *> *filteredPokemons;
@property(nonatomic) BOOL isInSearchMode;
@property(nonatomic, strong) AVAudioPlayer *musicPlayer;
@property(nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property(nonatomic, weak) IBOutlet UISearchBar *searchBar;

- (IBAction)musicButtonPressed:(UIButton *)sender;

@end

