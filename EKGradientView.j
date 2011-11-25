/*
Copyright (c) 2011 Elias Klughammer (elias.klughammer [at] me [dot] com)

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
*/

@implementation EKGradientView : CPView
{
    CGGradient  gradient;
    CPColor     color1;
    CPColor     color2;
    CPString    orientation     @accessors;
}

- (void)setColor1:(CPColor)aColor
{
    color1 = aColor;
    if (color2);
        [self createGradient];
}

- (void)setColor2:(CPColor)aColor
{
    color2 = aColor;
    if (color1);
        [self createGradient];
}

- (void)createGradient
{
    gradient = CGGradientCreateWithColorComponents(CGColorSpaceCreateDeviceRGB(), [[color1 redComponent], [color1 greenComponent], [color1 blueComponent], [color1 alphaComponent], [color2 redComponent], [color2 greenComponent], [color2 blueComponent], [color2 alphaComponent]], [0, 1], 2);
}

- (void)drawRect:(CGRect)rect 
{
    if (!gradient)
        return;
    
    var targetPoint;
    if (orientation)
        targetPoint = (orientation == "vertical") ? CGPointMake(CGRectGetWidth(rect), 0) : CGPointMake(0, CGRectGetHeight(rect));
    else
        targetPoint = CGPointMake(0, CGRectGetHeight(rect));
    
    var context = [[CPGraphicsContext currentContext] graphicsPort];
    CGContextAddRect(context, rect);
    CGContextDrawLinearGradient(context, gradient, CGPointMake(0,0), targetPoint);
}

@end