#SlideInMenu For iOS#

A UIViewController subclass for revealing a menu behind a front view controller (similar to the menu in apps like Facebook).

![](Images/SlideInMenu.png?raw=true)
##Features##

* A Reveal view controller implemented using view controller containment.
* Support for custom viewController transition animations through UIViewControllerAnimatedTransitioning protocol
API easier than a UINavigationController.
* Support for any combination of left/right rear controllers. Correct handling of appearance methods on its child controllers that you can rely on.
* Correct handling of rotations.
* Can be embedded as a child view controller of other controllers or deployed as the rootViewController.
* Plays nicely with any child view controllers or parent controllers.
* Can be deployed as a child of itself to create cascade-like, hierarchical interfaces.
* Seamless integration of pan gesture recognizer, behaving as smooth as silk.
* A category method on UIViewController, revealViewController, to get the parent SWRevealViewController of any child controller, similar to the UIViewController's property navigationController.
* Comprehensive set of delegate methods for getting full state of the controller and implementing your own code hooks for customizing behavior.
* Lightweight, clean, easy-to-read, self-documenting code that you will enjoy using in your projects.

##Usage##

To get started copy the following into your project:

    SlideInMenuViewController.m
    SlideInMenuViewController.h

Then, in your project:

* Initialize an instance of a SlideInMenuViewController passing in a "rear" and a "front" view controllers.

* Use the SlideInMenuViewController instance as you would any view controller.

* Deploy as the application window rootViewController, or as a child of other containment controllers.

* Get the panGestureRecognized and tapGestureRecognizer provided by the SWRevealViewController. You can leave them as they are for the default behavior or you can add them to a suitable view on your "front" view controller. For example add the panGestureRecognizer to a navigationBar on the viewDidLoad method of your front controller. This may look something like this:

        _revealButtonItem.target = self.revealViewController;
        _revealButtonItem.action = @selector(revealToggle:);
    
        // Set the gesture (swipe from the left edge to reveal the menu)
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];

At any time, you can reveal, conceal the "rear" or "right" views or replace any of the view controllers, programmatically or based on user actions, with or without animations enabled

##Basic API Documentation##

Initializing a SWRevealViewController:

        - (id)initWithRearViewController:(UIViewController *)rearViewController frontViewController:(UIViewController *)frontViewController;
Setting a right view controller:

        @property (strong, nonatomic) UIViewController *rightViewController;
Animated setting of the front view controller:

        - (void)pushFrontViewController:(UIViewController *)frontViewController animated:(BOOL)animated;
Animating the position of the front view controller. Position can be: FrontViewPositionLeftSideMostRemoved, FrontViewPositionLeftSideMost, FrontViewPositionLeftSide, FrontViewPositionLeft, FrontViewPositionRight, FrontViewPositionRightMost or FrontViewPositionRightMostRemoved

        - (void)setFrontViewPosition:(FrontViewPosition)frontViewPosition animated:(BOOL)animated;
Creating and obtaining a pan gesture recognizer:

        - (UIPanGestureRecognizer*)panGestureRecognizer;
Creating and obtaining a tap gesture recognizer:

        - (UITapGestureRecognizer*)tapGestureRecognizer;
Other methods are documented in the SWRevealViewController.h header file.

##Licence##

Copyright (c) 2014 Nick Salerni

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
