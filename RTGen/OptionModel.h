//
//  OptionModel.h
//  RTGen
//
//  Created by João Guilherme on 21/08/16.
//  Copyright © 2016 João Guilherme Geniselli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OptionModel : NSObject

@property (nonatomic) NSNumber * ID;
@property (nonatomic) NSString * name;
@property (nonatomic) NSString * chars;
@property (nonatomic) NSNumber * active;

-(instancetype)initWithDictionary:(NSDictionary *)infoDic;
-(NSDictionary *)toDictionary;

@end
