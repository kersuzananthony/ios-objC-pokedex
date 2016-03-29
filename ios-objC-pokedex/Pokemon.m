//
//  Pokemon.m
//  ios-objC-pokedex
//
//  Created by Kersuzan on 28/03/16.
//  Copyright © 2016 Kersuzan. All rights reserved.
//

#import "Pokemon.h"

@implementation Pokemon


-(id)initWithName:(NSString *)aName pokedexId:(NSString *)aPokedexId {
    
    if (self = [super init]) {
        _name = [aName capitalizedString];
        _pokedexId = aPokedexId;
        
        _pokemonURL = [NSString stringWithFormat:@"%s%s%@/", URL_BASE, URL_POKEMON, _pokedexId];
    }

    return self;
}

- (void)downloadPokemonDetails:(onComplete)completionHandler {
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:self.pokemonURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSDictionary<NSString *, id> *result = (NSDictionary<NSString *, id> *) responseObject;
            
            // Weight
            NSString *weight = (NSString *) [result valueForKey:@"weight"];
            if (weight) {
                _weight = weight;
            } else {
                _weight = @"";
            }
            
            // Height
            NSString *height = (NSString *) [result valueForKey:@"height"];
            if (height) {
                _height = height;
            } else {
                _height = @"";
            }
            
            // Attack
            NSString *attack = (NSString *) [result valueForKey:@"attack"];
            if (attack) {
                _attack = attack;
            } else {
                _attack = @"";
            }
            
            // Defense
            NSString *defense = (NSString *) [result valueForKey:@"defense"];
            if (defense) {
                _defense = defense;
            } else {
                _defense = @"";
            }
            
            // Types
            NSArray<NSDictionary<NSString *, NSString *> *> *types = (NSArray<NSDictionary<NSString *, NSString *> *> *) [result valueForKey:@"types"];
            if (types && types.count > 0) {
                NSString *firstType = [types[0] valueForKey:@"name"];
                if (firstType) {
                    _type = [firstType capitalizedString];
                } else {
                    NSLog(@"No first type");
                }
                
                if (types.count > 1) {
                    for (int i = 1; i < types.count; i++) {
                        NSString *name = [[types[i] valueForKey:@"name"] capitalizedString];
                        if (name) {
                            _type = [_type stringByAppendingString: [NSString stringWithFormat:@"/%@", name]];
                        }
                    }
                }
            } else {
                _type = @"";
            }
            
            // Evolutions
            NSArray<NSDictionary<NSString *, id> *> *evolutionsArray = (NSArray<NSDictionary<NSString *, id> *> *) [result valueForKey:@"evolutions"];
            
            if (evolutionsArray && evolutionsArray.count > 0) {
                NSString *toEvolution = [(NSString *) evolutionsArray[0] valueForKey:@"to"];
                if (toEvolution) {
                    NSRange megaLocation = [toEvolution rangeOfString:@"mega"];
                    if (megaLocation.location == NSNotFound) {
                        NSString *uri = [(NSString *) evolutionsArray[0] valueForKey:@"resource_uri"];
                        NSString *evolutionId = [uri stringByReplacingOccurrencesOfString:@"api/v1/pokemon" withString:@""];
                        _nextEvoId = [evolutionId stringByReplacingOccurrencesOfString:@"/" withString:@""];
                        _nextEvoName = toEvolution;
                        _nextEvoLvl = (NSString *) [evolutionsArray[0] valueForKey:@"level"];
                    }
                } else {
                    _nextEvoId = @"";
                    _nextEvoName = @"";
                    _nextEvoLvl = @"";
                }
            }
            
            // Descriptions
            NSArray<NSDictionary<NSString *, NSString *> *> *descriptionsArray = (NSArray<NSDictionary<NSString *, NSString *> *> *) [result valueForKey:@"descriptions"];
            
            if (descriptionsArray && descriptionsArray.count > 0) {
                NSString *url = [NSString stringWithFormat:@"%s%@", URL_BASE, [descriptionsArray[0] valueForKey:@"resource_uri"]];
                NSURL *descriptionUrl = [NSURL URLWithString:url];
                NSURLRequest *descriptionRequest = [NSURLRequest requestWithURL:descriptionUrl];
                
                NSURLSessionDataTask *descriptionDataTask = [manager dataTaskWithRequest:descriptionRequest completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                    
                    NSDictionary<NSString *, id> *result = (NSDictionary<NSString *, id> *) responseObject;
                    if (responseObject) {
                        NSString *pokeDescription = [(NSString *) result valueForKey:@"description"];
                        if (pokeDescription) {
                            _pokeDescription = pokeDescription;
                        } else {
                            _pokeDescription = @"";
                        }
                    } else {
                        _pokeDescription = @"";
                    }
                    
                    completionHandler();
                }];
                
                [descriptionDataTask resume];
            }
        }
    
    }];
    
    
    
    [dataTask resume];
}

@end
