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
@property(nonatomic, strong, readonly) NSNumber *pokedexId;

- (id)initWithName:(NSString *)aName pokedexId:(NSNumber *)aPokedexId;

@end
