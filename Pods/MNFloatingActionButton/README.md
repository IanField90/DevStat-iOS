# MNFloatingActionButton

A little iOS experiment, a Floating Action Button.

![button gif](https://raw.github.com/mattnydam/MNFloatingActionButton/master/button.gif)

###Installation

As Cocoapod https://cocoapods.org

	pod 'MNFloatingActionButton', '~> 0.1'

Alternatively, add the images and .h &.m files to your project.

###General Usage
Just like a normal button, you instantiate with a frame and add as a subview.
	
	MNFloatingActonButton *button = [MNFloatingActionButton alloc] initWithFrame:CGRect(0,0,50,50))];
	[self.view addSubview:button];
	
As it is a subclass of UIControl, you can add a target to listen to touch events. The touch events that are sent are:

* UIControlEventTouchUpInside
* UIControlEventTouchCancel

	[button addTarget:self action:@selector(createButtonPressed:) forControlEvents:UIControlEventTouchUpInside];


You can also use MNFloatingActionButton in Storyboards and xibs by creating a UIView object and changing it's custom class to MNFloatingActionButton.
	
###Customisation

There are currently 7 properties that you can modify to customise your button. They are:

* centerImageView - Set to nil if you don't want an image
* backgroundColor - Defaults to some kinda blue
* shadowColor - Defaults to the background color.
* shadowOpacity - Default is 0.6f
* shadowRadius - Default is 1.5f
* animationScale - Set's the end size of button when pressed. Defaults to 0.85f
* animationDuration - Defaults to 0.05f


###Thanks

I did this because I thought it might be fun for people to play around with. If you like, or you don't like it, then help make it better with a PR!
