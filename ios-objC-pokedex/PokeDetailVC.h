//
//  PokeDetailVC.h
//  ios-objC-pokedex
//
//  Created by Kersuzan on 28/03/16.
//  Copyright © 2016 Kersuzan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pokemon.h"

@interface PokeDetailVC : UIViewController

@property(nonatomic, strong) Pokemon *pokemon;
@property(nonatomic, weak) IBOutlet UILabel *nameLabel;

- (IBAction)backPressed:(UIButton *)sender;

@end
