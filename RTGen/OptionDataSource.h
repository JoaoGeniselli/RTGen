//
//  OptionDataSource.h
//  RTGen
//
//  Created by João Guilherme on 21/08/16.
//  Copyright © 2016 João Guilherme Geniselli. All rights reserved.
//

#import <Foundation/Foundation.h>
@class OptionModel;

@interface OptionDataSource : NSObject

@property (nonatomic) NSArray<OptionModel *> * items;

-(void)updateActiveStates;

@end
