//
//  ViewController.m
//  Contacts
//
//  Created by Navid Rojiani on 8/25/16.
//  Copyright © 2016 Navid Rojiani. All rights reserved.
//

#import "ContactsViewController.h"
#import "Contacts-Swift.h"

// syntax for importing swift files: ProductModuleName-Swift.h


@interface ContactsViewController ()

@property (nonatomic, readonly, strong) NSMutableArray *contacts;

@end

@implementation ContactsViewController



- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        Contact *c1 = [[Contact alloc] initWithContactName: @"Johnny Appleseed"];
        Contact *c2 = [[Contact alloc] initWithContactName: @"Paul Bunyan"];
        Contact *c3 = [[Contact alloc] initWithContactName: @"Calamity Jane"];
        _contacts = [NSMutableArray arrayWithArray:@[c1, c2, c3]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Register UITableViewCell class with the table view controller's tableView property
    // so that the table view knows how to create new cells & reuse existing ones
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                                            forIndexPath:indexPath];
    Contact *contact = self.contacts[indexPath.row];
    cell.textLabel.text = contact.name;
    
    return cell;
}

- (IBAction)cancelToContactsViewController:(UIStoryboardSegue *)segue
{
    // No action to take if user cancels
}

- (IBAction)createNewContact:(UIStoryboardSegue *)segue
{
    NewContactViewController *newContactVC = segue.sourceViewController;
    NSString *firstName = newContactVC.firstNameTextField.text;
    NSString *lastName = newContactVC.lastNameTextField.text;
    if (firstName.length != 0 || lastName.length != 0) {
        NSString *contactName = [NSString stringWithFormat:@"%@ %@", firstName, lastName];
        Contact *newContact = [[Contact alloc] initWithContactName:contactName];
        [self.contacts addObject:newContact];
        [self.tableView reloadData];
    }
}

@end
