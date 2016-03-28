//
//  CSV.m
//  ios-objC-pokedex
//
//  Created by Kersuzan on 28/03/16.
//  Copyright © 2016 Kersuzan. All rights reserved.
//

#import "CSV.h"
#import "NSArray.h"


@implementation CSV

- (id)initWithContent:(NSString *)aContent delemiter:(NSCharacterSet *)aDelimiter encoding:(NSUInteger)aEncoding {
    if (self = [super init]) {
        self.delimiter = aDelimiter;
        
        NSCharacterSet *newLine = [NSCharacterSet newlineCharacterSet];
        NSMutableArray<NSString *> *lines = [[NSMutableArray alloc]init];
        [[aContent stringByTrimmingCharactersInSet:newLine] enumerateLinesUsingBlock:^(NSString * _Nonnull line, BOOL * _Nonnull stop) {
            [lines addObject:line];
        }];
        
        
        self.headers = [self parseHeadersFromLines:lines];
        self.rows = [self parseRowsFromLines:lines];
        self.columns = [self parseColumnsFromLines:lines];
    }
    
    return self;
}

- (id)initWithContentsOfUrl:(NSString *)aUrl {
    if (self = [super init]) {
        self.delimiter = [NSCharacterSet characterSetWithCharactersInString:@","];
    }
    
    NSString *csvString = @"";
    csvString = [NSString stringWithContentsOfFile:aUrl encoding:NSUTF8StringEncoding error:nil];
    
    return [self initWithContent:csvString delemiter:self.delimiter encoding:NSUTF8StringEncoding];
}

- (NSDictionary<NSString *,NSString *> *)parseColumnsFromLines:(NSMutableArray<NSString *> *)lines {
    NSMutableDictionary<NSString *, NSString *> *columns = [[NSMutableDictionary alloc]init];
    
    [self.headers enumerateObjectsUsingBlock:^(NSString * _Nonnull header, NSUInteger index, BOOL * _Nonnull stop) {
        NSString *column = (NSString *) [self.rows mapObjectsUsingBlock:^id(id row, NSUInteger idx) {
            return row[header] != nil ? row[header] : @"";
        }];
        
        [columns setValue:column forKey:header];
    }];
    
    return columns;
}

- (NSMutableArray<NSDictionary<NSString *,NSString *> *> *)parseRowsFromLines:(NSMutableArray<NSString *> *)lines {
    NSMutableArray<NSDictionary<NSString *, NSString *> *> *rows = [[NSMutableArray alloc]init];
    
    [lines enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx != 0) {
            NSMutableDictionary<NSString *, NSString *> *row = [[NSMutableDictionary alloc]init];
            NSArray *values = [obj componentsSeparatedByCharactersInSet:self.delimiter];
            
            [self.headers enumerateObjectsUsingBlock:^(NSString * _Nonnull header, NSUInteger index, BOOL * _Nonnull stop) {
                if (index < [values count]) {
                    [row setValue:values[index] forKey:header];
                } else {
                    [row setValue:@"" forKey:header];
                }
            }];
            
            [rows addObject:row];
        }
    }];
    
    return rows;
}

- (NSArray<NSString *> *)parseHeadersFromLines:(NSMutableArray<NSString *> *)lines {
    NSString *firstLine = lines[0];
    
    return [firstLine componentsSeparatedByCharactersInSet:self.delimiter];
}

@end
