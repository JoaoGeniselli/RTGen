//
//  TextViewController.m
//  RTGen
//
//  Created by João Guilherme on 21/08/16.
//  Copyright © 2016 João Guilherme Geniselli. All rights reserved.
//

#import "TextViewController.h"
#import "RandomTextGenerator.h"

static NSString * last_length_defaults_key = @"rtgen_last_length";

@interface TextViewController ()

@property (nonatomic, weak) IBOutlet UITextField * textLengthField;
@property (nonatomic, weak) IBOutlet UITextView  * textArea;

@end

@implementation TextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    _textLengthField.text     = [defaults objectForKey:last_length_defaults_key];
    
    UIToolbar * doneBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44.0)];
    UIBarButtonItem * doneBtn = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                 style:UIBarButtonItemStyleDone
                                                                target:self
                                                                action:@selector(touchesBegan:withEvent:)];
    [doneBar setItems:@[doneBtn]];
    self.textLengthField.inputAccessoryView = doneBar;
    self.textArea.inputAccessoryView = doneBar;
}

-(IBAction)copyAction:(id)sender {
    UIPasteboard * pasteBoard = [UIPasteboard generalPasteboard];
    pasteBoard.string = self.textArea.text;
}

-(IBAction)generateAction:(id)sender {
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:_textLengthField.text forKey:last_length_defaults_key];
    
    RandomTextGenerator * generator = [[RandomTextGenerator alloc] init];
    
    _textArea.text = [generator randomTextWithLength:_textLengthField.text.integerValue];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end