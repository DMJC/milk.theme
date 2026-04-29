#include <AppKit/AppKit.h>
#include "MilkScrollerKnobCell.h"

@implementation MilkScrollerKnobCell

@synthesize horizontal;

- (void) drawWithFrame: (NSRect)cellFrame inView: (NSView*)controlView
{
  if (NSIsEmptyRect(cellFrame))
    return;

  NSColor *knobColor = [NSColor colorWithCalibratedRed: 1.0
                                                  green: 1.0
                                                   blue: 1.0
                                                  alpha: 1.0];
  NSColor *borderColor = [NSColor colorWithCalibratedRed: 0.8
                                                    green: 0.8
                                                     blue: 0.8
                                                    alpha: 1.0];

  cellFrame = NSInsetRect(cellFrame, 1, 1);
  CGFloat radius = 5;

  NSBezierPath *knobPath = [NSBezierPath bezierPathWithRoundedRect: cellFrame
                                                          xRadius: radius
                                                          yRadius: radius];
  [borderColor setStroke];
  [knobPath setLineWidth: 2.0];
  [knobPath stroke];

  NSRect innerRect;
  if (horizontal)
    {
      innerRect = NSMakeRect(cellFrame.origin.x,
                             -cellFrame.origin.y + cellFrame.size.height / 2.0,
                             cellFrame.size.width - 2,
                             cellFrame.size.height / 3.0);
    }
  else
    {
      innerRect = NSMakeRect(-cellFrame.origin.x + cellFrame.size.width / 2.0,
                             cellFrame.origin.y,
                             cellFrame.size.width / 3.0,
                             cellFrame.size.height - 2);
    }
  NSBezierPath *innerPath = [NSBezierPath bezierPathWithRoundedRect: innerRect
                                                         xRadius: radius
                                                         yRadius: radius];
  [knobColor setFill];
  [innerPath fill];
}
@end
