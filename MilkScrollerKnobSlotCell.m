
#include <AppKit/AppKit.h>
#include "MilkScrollerKnobSlotCell.h"

@implementation MilkScrollerKnobSlotCell


@synthesize horizontal;

- (void) drawWithFrame: (NSRect)cellFrame inView: (NSView*)controlView
{
  if (NSIsEmptyRect(cellFrame))
    return;
//  cellFrame = NSInsetRect(cellFrame, 1, 1);
  NSColor * baseColor = [NSColor colorWithCalibratedRed: 0.75
                                                  green: 0.75
                                                   blue: 0.75
                                                  alpha: 1.0];
  NSColor *shadowColor = [baseColor shadowWithLevel: 0.25];
  NSGradient* gr = [[NSGradient alloc] initWithColorsAndLocations:
      shadowColor, 1.0,
      baseColor, 0.8,
      baseColor, 0.7,
      baseColor, 0.6,
      shadowColor, 0.0,
      nil];
  int a = 0;
  if(horizontal)
    a = 90;
  [gr drawInRect: cellFrame angle: a];
  [shadowColor set];
  NSFrameRect(cellFrame);
}
@end
