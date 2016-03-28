//
//  CSV.h
//  ios-objC-pokedex
//
//  Created by Kersuzan on 28/03/16.
//  Copyright © 2016 Kersuzan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSV : NSObject

@property(nonatomic, strong) NSArray<NSString *> *headers;
@property(nonatomic, strong) NSMutableArray<NSDictionary<NSString *, NSString *> *> *rows;
@property(nonatomic, strong) NSDictionary<NSString *, NSString *> *columns;
@property(nonatomic, strong) NSCharacterSet *delimiter;

- (id)initWithContent:(NSString *)aContent delemiter:(NSCharacterSet *)aDelimiter encoding:(NSUInteger)aEncoding;
- (id)initWithContentsOfUrl:(NSString *)aUrl;
- (NSArray<NSString *> *)parseHeadersFromLines:(NSMutableArray<NSString *> *)lines;
- (NSMutableArray<NSDictionary<NSString *, NSString *> *> *)parseRowsFromLines:(NSMutableArray<NSString *> *)lines;
- (NSDictionary<NSString *, NSString *> *)parseColumnsFromLines:(NSMutableArray<NSString *> *)lines;

@end
