EKShakeAnimation
==========

EKGradientView is a class for displaying linear gradients without having to write any CG code. It's made for the [Cappuccino](http://www.cappuccino.org) framework.


## Installation

Simply import the file in your application's AppController or any other class:

	@import "EKGradientView.j"


## Usage

Init your gradientView:

	gradientView = [[EKGradientView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
	
Set the orientation (default is horizontal)
	
    [gradientView setOrientation:@"vertical"];

Set your colors

    [gradientView setColor1:[CPColor whiteColor]];
    [gradientView setColor2:[CPColor blackColor]];
