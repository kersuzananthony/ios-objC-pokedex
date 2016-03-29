//
//  Pokemon.h
//  ios-objC-pokedex
//
//  Created by Kersuzan on 28/03/16.
//  Copyright © 2016 Kersuzan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

#define URL_BASE "http://pokeapi.co"
#define URL_POKEMON "/api/v1/pokemon/"

typedef void (^onComplete)();

@interface Pokemon : NSObject

@property(nonatomic, strong, readonly) NSString *name;
@property(nonatomic, strong, readonly) NSString *pokedexId;
@property(nonatomic, strong, readonly) NSString *type;
@property(nonatomic, strong, readonly) NSString *weight;
@property(nonatomic, strong, readonly) NSString *height;
@property(nonatomic, strong, readonly) NSString *attack;
@property(nonatomic, strong, readonly) NSString *defense;
@property(nonatomic, strong, readonly) NSString *pokeDescription;
@property(nonatomic, strong, readonly) NSString *nextEvoId;
@property(nonatomic, strong, readonly) NSString *nextEvoLvl;
@property(nonatomic, strong, readonly) NSString *nextEvoName;
@property(nonatomic, strong) NSString *pokemonURL;

- (id)initWithName:(NSString *)aName pokedexId:(NSString *)aPokedexId;
- (void)downloadPokemonDetails:(onComplete)completionHandler;

@end
