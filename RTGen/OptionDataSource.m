//
//  OptionDataSource.m
//  RTGen
//
//  Created by João Guilherme on 21/08/16.
//  Copyright © 2016 João Guilherme Geniselli. All rights reserved.
//

#import "OptionDataSource.h"
#import "OptionModel.h"

static NSString * plistPath;

@implementation OptionDataSource

- (instancetype)init
{
    self = [super init];
    if (self) {
        plistPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/Options.plist"];
        
        NSArray  * options = [[NSArray alloc] initWithContentsOfFile:plistPath];
        
        NSMutableArray * readyOptions = [NSMutableArray new];
        
        for (NSDictionary * optionInfo in options) {
            OptionModel * model =
            [[OptionModel alloc] initWithDictionary:optionInfo];
            [readyOptions addObject:model];
        }
        self.items = readyOptions;
    }
    return self;
}

-(void)updateActiveStates {
    NSMutableArray * options = [NSMutableArray new];
    for (OptionModel * model in _items) {
        [options addObject: [model toDictionary]];
    }
    [options writeToFile:plistPath atomically:NO];
}

@end
