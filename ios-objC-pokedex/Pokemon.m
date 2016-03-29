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
                NSLog(@"Number of types %lu", (unsigned long)types.count);
                NSString *firstType = [types[0] valueForKey:@"name"];
                if (firstType) {
                    _type = [firstType capitalizedString];
                } else {
                    NSLog(@"No first type");
                }
                
                if (types.count > 1) {
                    for (int i = 1; i < types.count; i++) {
                        NSString *name = [[types[i] valueForKey:@"name"] capitalizedString];
                        NSLog(@"Name!!! : %@", name);
                        if (name) {
                            
                            _type = [_type stringByAppendingString: [NSString stringWithFormat:@"/%@", name]];
                        }
                    }
                }
            } else {
                _type = @"";
            }
            
            NSLog(@"Height %@", self.height);
            NSLog(@"Weight %@", self.weight);
            NSLog(@"Attack %@", self.attack);
            NSLog(@"Defense %@", self.defense);
            NSLog(@"Type %@", self.type);
            
            completionHandler();
        }
    }];
    
    
    [dataTask resume];
}


//    +
//    +                if let types = dict["types"] as? Array<Dictionary<String, String>> where types.count > 0 {
//        +                    if let type = types[0]["name"] {
//            +                        self._type = type.capitalizedString
//            +                    }
//        +
//        +                    if types.count > 1 {
//            +                        for x in 1 ..< types.count {
//                +                            if let name = types[x]["name"] {
//                    +                                self._type! += "/\(name.capitalizedString)"
//                    +                            }
//                +                        }
//            +                    }
//        +                } else {
//            +                    self._type = ""
//            +                }
//    +                
//    +                print(self._type)
//    +            }
//+        }

@end
