//
//  MODetailViewController.m
//  journal-objc
//
//  Created by Matthew O'Connor on 10/7/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

#import "MODetailViewController.h"
#import "MOEntryController.h"

@interface MODetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@end

@implementation MODetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

- (void)updateViews
{
    if (!self.entry) return;
    self.textField.text = self.entry.title;
    self.textView.text  = self.entry.text;
    
}
- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
    {
        if (self.entry) {
            
            self.entry.title = self.textField.text;
            self.entry.text = self.textView.text;
            self.entry.timestamp = [NSDate date];
            
        } else {
            
            MOEntry *entry = [[MOEntry alloc] initWithTitle:self.textField.text text:self.textView.text timeStamp:[NSDate date]];
            
            [[MOEntryController sharedController] addEntry:entry];
            
            self.entry = entry;
        }
        
        [self.navigationController popViewControllerAnimated:true];
    }
}

- (IBAction)clearEntryTapped:(UIButton *)sender {
    self.textField.text = @"";
    self.textView.text = @"";
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)setEntry:(MOEntry *)entry
{
    if (entry != _entry) {
        _entry = entry;
        [self updateViews];
    }
}

@end
