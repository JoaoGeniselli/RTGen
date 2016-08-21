//
//  OptionModel.m
//  RTGen
//
//  Created by João Guilherme on 21/08/16.
//  Copyright © 2016 João Guilherme Geniselli. All rights reserved.
//

#import "OptionModel.h"

@implementation OptionModel

- (instancetype)initWithDictionary:(NSDictionary *)infoDic
{
    self = [super init];
    if (self) {
        [self applyKeyPaths:infoDic];
    }
    return self;
}

-(void)applyKeyPaths:(NSDictionary *)dic {
    for (NSString * key in dic) {
        @try {
            if (![dic[key] isKindOfClass:[NSNull class]]) {
                [self setValue:dic[key] forKey:key];
            }
        } @catch (NSException *exception) {
            // -- I DON`T HAVE THIS PROPERTY! :[ ---
        }
    }
}

-(NSDictionary *)toDictionary {
    NSDictionary * dic = @{ @"ID"     : self.ID,
                            @"name"   : self.name,
                            @"chars"  : self.chars,
                            @"active" : self.active};
    return dic;
}

@end
