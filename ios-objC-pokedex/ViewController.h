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

@interface ViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property(nonatomic, strong) NSMutableArray<Pokemon *> *pokemons;
@property(nonatomic, strong) AVAudioPlayer *musicPlayer;
@property(nonatomic, weak) IBOutlet UICollectionView *collectionView;

- (IBAction)musicButtonPressed:(UIButton *)sender;

@end

