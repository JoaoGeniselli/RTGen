//
//  OptionTableViewCell.m
//  RTGen
//
//  Created by João Guilherme on 21/08/16.
//  Copyright © 2016 João Guilherme Geniselli. All rights reserved.
//

#import "OptionTableViewCell.h"
#import "OptionModel.h"

@implementation OptionTableViewCell

-(void)configureFromModel:(OptionModel *)model {
    _nameLabel.text = [model name];
    _on = [model.active boolValue];
    _optionSwitch.on = _on;
}

-(IBAction)valueChanged:(UISwitch *)sender {
    _on = sender.on;
    if (self.delegate && [self.delegate respondsToSelector:@selector(optionTableViewCellValueChanged:)]) {
        [self.delegate performSelector:@selector(optionTableViewCellValueChanged:) withObject:self];
    }
}

@end
