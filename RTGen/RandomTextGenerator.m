//
//  RandomTextGenerator.m
//  RTGen
//
//  Created by João Guilherme on 21/08/16.
//  Copyright © 2016 João Guilherme Geniselli. All rights reserved.
//

#import "RandomTextGenerator.h"
#import "OptionModel.h"
#import "OptionDataSource.h"

@implementation RandomTextGenerator

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self defineEnableOptions];
    }
    return self;
}

-(void)defineEnableOptions {
    _charGroups = [NSMutableArray new];
    OptionDataSource * optionDS = [[OptionDataSource alloc] init];
    for (OptionModel * model in optionDS.items) {
        if ([model.active boolValue] == YES) {
            [_charGroups addObject:model.chars];
        }
    }
}

-(NSString *)randomTextWithLength:(NSInteger)length {
    NSMutableString * phrase = [NSMutableString stringWithCapacity:length];
    
    if (_charGroups.count == 0) return @"";
    
    int i, group;
    for (i = group = 0; i < length; i++, group++) {
        if (group == self.charGroups.count) {
            group = 0;
        }
        NSString * charGroup = _charGroups[group];
        char chosenCharacter = [charGroup characterAtIndex:arc4random_uniform((unsigned)charGroup.length)];
        [phrase appendString:[NSString stringWithFormat:@"%c", chosenCharacter]];
    }
    return phrase;
}

@end
