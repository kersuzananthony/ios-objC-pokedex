//
//  Pokemon.m
//  ios-objC-pokedex
//
//  Created by Kersuzan on 28/03/16.
//  Copyright © 2016 Kersuzan. All rights reserved.
//

#import "Pokemon.h"

@implementation Pokemon


-(id)initWithName:(NSString *)aName pokedexId:(NSNumber *)aPokedexId {
    
    if (self = [super init]) {
        _name = [aName capitalizedString];
        _pokedexId = aPokedexId;
    }
    
    return self;
}

@end
