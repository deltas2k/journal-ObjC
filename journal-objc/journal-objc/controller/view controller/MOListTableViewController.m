//
//  MOListTableViewController.m
//  journal-objc
//
//  Created by Matthew O'Connor on 10/7/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

#import "MOListTableViewController.h"
#import "MOEntryController.h"
#import "MODetailViewController.h"

@interface MOListTableViewController ()

@end

@implementation MOListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [[[MOEntryController sharedController] entries] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    
    MOEntryController *entryController = [MOEntryController sharedController];
    MOEntry *entry = entryController.entries[indexPath.row];
    
    cell.textLabel.text = entry.title;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toViewEntry"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        MOEntry *entry = [MOEntryController sharedController].entries[indexPath.row];
        
        MODetailViewController *detailViewController = segue.destinationViewController;
        detailViewController.entry = entry;
    }
}

@end
