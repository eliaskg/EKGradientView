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
    gradient = CGGradientCreateWithColorComponents(CGColorSpaceCreateDeviceRGB(), [[color1 redComponent],[color1 greenComponent],[color1 blueComponent],[color1 alphaComponent],[color2 redComponent],[color2 greenComponent],[color2 blueComponent],[color2 alphaComponent]], [0,1], 2);
}

- (void)drawRect:(CGRect)rect 
{
    if (gradient) {
        var targetPoint;
        if (orientation)
            targetPoint = (orientation == "vertical") ? CGPointMake(CGRectGetWidth(rect), 0) : CGPointMake(0, CGRectGetHeight(rect));
        else
            targetPoint = CGPointMake(0, CGRectGetHeight(rect));

        var context = [[CPGraphicsContext currentContext] graphicsPort];
        CGContextAddRect(context, rect);
        CGContextDrawLinearGradient(context, gradient, CGPointMake(0,0), targetPoint);
    }
}

@end