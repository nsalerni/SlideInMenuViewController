//
//  ViewController.m
//  SlideInMenuDemo
//
//  Created by Nick Salerni on 2/21/2014.
//  Copyright (c) 2014 Nick Salerni. All rights reserved.
//

#import "ViewController.h"
#import "SlideInMenuViewController.h"

@interface ViewController ()
@property (nonatomic) IBOutlet UIBarButtonItem* revealButtonItem;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *revealButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStyleDone target:nil action:@selector(revealToggle:)];
    
    self.navigationItem.leftBarButtonItem = revealButtonItem;
    
    _revealButtonItem.target = self.revealViewController;
    _revealButtonItem.action = @selector(revealToggle:);
    
    // Set the gesture (swipe from the left edge to reveal the menu)
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
}

@end