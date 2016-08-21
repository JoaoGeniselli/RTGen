//
//  OptionTableViewCell.h
//  RTGen
//
//  Created by João Guilherme on 21/08/16.
//  Copyright © 2016 João Guilherme Geniselli. All rights reserved.
//

#import <UIKit/UIKit.h>
@class OptionModel;
@class OptionTableViewCell;

@protocol OptionTableViewCellDelegate <NSObject>

-(void)optionTableViewCellValueChanged:(OptionTableViewCell *)cell;

@end

@interface OptionTableViewCell : UITableViewCell

@property (nonatomic, weak) id<OptionTableViewCellDelegate> delegate;

@property (nonatomic) BOOL on;
@property (nonatomic, weak) IBOutlet UILabel  * nameLabel;
@property (nonatomic, weak) IBOutlet UISwitch * optionSwitch;

-(void)configureFromModel:(OptionModel *)model;

@end
