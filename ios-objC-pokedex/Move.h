//
//  Move.h
//  ios-objC-pokedex
//
//  Created by Kersuzan on 29/03/16.
//  Copyright © 2016 Kersuzan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Move : NSObject

@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *moveDescription;
@property(nonatomic, strong) NSString *power;
@property(nonatomic, strong) NSString *accuracy;

- (id)initWithName:(NSString *)aName description:(NSString *)aDescription power:(NSString *)aPower accuracy:(NSString *)anAccuracy;

@end
