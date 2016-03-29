//
//  Move.m
//  ios-objC-pokedex
//
//  Created by Kersuzan on 29/03/16.
//  Copyright © 2016 Kersuzan. All rights reserved.
//

#import "Move.h"

@implementation Move

- (id)initWithName:(NSString *)aName description:(NSString *)aDescription power:(NSString *)aPower accuracy:(NSString *)anAccuracy {
    
    if (self = [super init]) {
        _name = [aName capitalizedString];
        _moveDescription = aDescription;
        _power = aPower;
        _accuracy = anAccuracy;
    }
    
    return self;
}


@end
