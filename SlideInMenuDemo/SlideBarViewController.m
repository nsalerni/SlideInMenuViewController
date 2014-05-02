//
//  SlideBarViewController.m
//  SlideInMenuDemo
//
//  Created by Nick Salerni on 2/21/2014.
//  Copyright (c) 2014 Nick Salerni. All rights reserved.
//

#import "SlidebarViewController.h"
#import "SlideInMenuViewController.h"

@interface SlideBarViewController ()

@property (nonatomic, strong) NSArray *menuItems;
@end

@implementation SlideBarViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    
    if (self)
    {
        // Custom initialization
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Changes the background color to a dark grey.
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    // Changes the color of the table cell seperator line.
    self.tableView.separatorColor = [UIColor groupTableViewBackgroundColor];
    
    _menuItems = @[@"title", @"notes", @"settings"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.menuItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = [self.menuItems objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Changes the color of the cell to match the background color of the table view
    cell.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    // Changes the color of the UITableViewCell to match the same shade of blue used throughout.
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.bounds];
    cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:0.2 green:0.682 blue:0.957 alpha:0.85];
    
    return cell;
}

- (void) prepareForSegue: (UIStoryboardSegue *) segue sender: (id) sender
{
    // configure the destination view controller:
    if ( [segue.destinationViewController isKindOfClass: [UIViewController class]] &&
        [sender isKindOfClass:[UITableViewCell class]] )
    {

    }
    
    // configure the segue.
    if ( [segue isKindOfClass: [SWRevealViewControllerSegue class]] )
    {
        SWRevealViewControllerSegue* rvcs = (SWRevealViewControllerSegue*) segue;
        
        SWRevealViewController* rvc = self.revealViewController;
        NSAssert( rvc != nil, @"oops! must have a revealViewController" );
        
        NSAssert( [rvc.frontViewController isKindOfClass: [UINavigationController class]], @"oops!  for this segue we want a permanent navigation controller in the front!" );
        
        rvcs.performBlock = ^(SWRevealViewControllerSegue* rvc_segue, UIViewController* svc, UIViewController* dvc)
        {
            UINavigationController* nc = [[UINavigationController alloc] initWithRootViewController:dvc];
            [rvc setFrontViewController:nc animated:YES];
        };
    }
}

@end