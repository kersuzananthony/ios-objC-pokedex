//
//  Pokemon.h
//  ios-objC-pokedex
//
//  Created by Kersuzan on 28/03/16.
//  Copyright © 2016 Kersuzan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pokemon : NSObject

@property(nonatomic, strong, readonly) NSString *name;
@property(nonatomic, strong, readonly) NSString *pokedexId;
@property(nonatomic, strong, readonly) NSString *type;
@property(nonatomic, strong, readonly) NSString *weight;
@property(nonatomic, strong, readonly) NSString *height;
@property(nonatomic, strong, readonly) NSString *attack;
@property(nonatomic, strong, readonly) NSString *defense;
@property(nonatomic, strong, readonly) NSString *nextEvoId;
@property(nonatomic, strong, readonly) NSString *nextEvoLvl;
@property(nonatomic, strong, readonly) NSString *nextEvoName;

- (id)initWithName:(NSString *)aName pokedexId:(NSString *)aPokedexId;

@end
