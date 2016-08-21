//
//  RandomTextGenerator.h
//  RTGen
//
//  Created by João Guilherme on 21/08/16.
//  Copyright © 2016 João Guilherme Geniselli. All rights reserved.
//

#import <Foundation/Foundation.h>
@class OptionModel;

@interface RandomTextGenerator : NSObject

@property (nonatomic) NSMutableArray<NSString *> * charGroups;

-(NSString *)randomTextWithLength:(NSInteger)length;

@end
