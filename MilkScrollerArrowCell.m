#include <AppKit/AppKit.h>
#include "MilkScrollerArrowCell.h"
#include "Milk.h"

@implementation MilkScrollerArrowCell

- (GSThemeControlState) themeControlState
{
  unsigned mask;
  GSThemeControlState buttonState = GSThemeNormalState;

  // set the mask
  if (_cell.is_highlighted)
    {
      mask = _highlightsByMask;
      if (_cell.state)
        {
          mask &= ~_showAltStateMask;
        }
    }
  else if (_cell.state)
    mask = _showAltStateMask;
  else
    mask = NSNoCellMask;

  /* Determine the background color. 
     We draw when there is a border or when highlightsByMask
     is NSChangeBackgroundCellMask or NSChangeGrayCellMask,
     as required by our nextstep-like look and feel.  */
  if (mask & (NSChangeGrayCellMask | NSChangeBackgroundCellMask))
    {
      buttonState = GSThemeHighlightedState;
    }

  /* Pushed in buttons contents are displaced to the bottom right 1px.  */
  if (mask & NSPushInCellMask)
    {
      buttonState = GSThemeSelectedState;
    }

  if (_cell.is_disabled && buttonState != GSThemeHighlightedState)
    {
      buttonState = GSThemeDisabledState;
    }

  /* If we are first responder, change to the corresponding
     first responder state. Note that GSThemeDisabledState
     doesn't have a first responder variant, currently. */
  if (_cell.shows_first_responder
      && [[[self controlView] window] firstResponder] == [self controlView]
      && [self controlView] != nil)
    {
      if (buttonState == GSThemeSelectedState)
	buttonState = GSThemeSelectedFirstResponderState;
      else if (buttonState == GSThemeHighlightedState)
	buttonState = GSThemeHighlightedFirstResponderState;
      else if (buttonState == GSThemeNormalState)
	buttonState = GSThemeFirstResponderState;
    }

  return buttonState;
}

- (void) setArrowType: (MilkScrollerArrowType) t
{
  scroller_arrow_type = t;
}
- (void) drawBezelWithFrame: (NSRect)cellFrame inView: (NSView *)controlView
{
  GSThemeControlState buttonState = [self themeControlState];
  NSBezierPath * path = [self pathForFrame: cellFrame];
  [(Milk*)[GSTheme theme] drawPathButton: path
                               in: self
                            state: buttonState];
}
- (NSBezierPath*) pathForFrame: (NSRect)cellFrame
{

  CGFloat r = 3;
  cellFrame = NSInsetRect(cellFrame, 1, 1);
  cellFrame.origin.x += 0.5;
  cellFrame.origin.y += 0.5;
  NSRect innerRect = NSInsetRect(cellFrame, r, r);
  NSBezierPath* path = [NSBezierPath bezierPath];
  switch(scroller_arrow_type)
    {
      case MilkScrollerArrowLeft:
        cellFrame.origin.x += 1.0;
        [path appendBezierPathWithArcWithCenter: NSMakePoint(NSMinX(innerRect), NSMinY(innerRect))
                                         radius: r
                                     startAngle: 180
                                       endAngle: 270];
        [path lineToPoint: NSMakePoint(NSMaxX(cellFrame), NSMinY(cellFrame))];
        [path lineToPoint: NSMakePoint(NSMaxX(cellFrame), NSMaxY(cellFrame))];
        [path appendBezierPathWithArcWithCenter: NSMakePoint(NSMinX(innerRect), NSMaxY(innerRect))
                                         radius: r
                                     startAngle: 90
                                       endAngle: 180];
        [path closePath];
        break;
      case MilkScrollerArrowRight:
        cellFrame.origin.x -= 1.0;
        [path moveToPoint: NSMakePoint(NSMinX(cellFrame), NSMinY(cellFrame))];
        [path appendBezierPathWithArcWithCenter: NSMakePoint(NSMaxX(innerRect), NSMinY(innerRect))
                                         radius: r
                                     startAngle: 270
                                       endAngle: 360];
        [path appendBezierPathWithArcWithCenter: NSMakePoint(NSMaxX(innerRect), NSMaxY(innerRect))
                                         radius: r
                                     startAngle: 0
                                       endAngle: 90];
        [path lineToPoint: NSMakePoint(NSMinX(cellFrame), NSMaxY(cellFrame))];
        break;
      case MilkScrollerArrowDown:
        cellFrame.origin.y -= 1.0;
        [path moveToPoint: NSMakePoint(NSMinX(cellFrame), NSMinY(cellFrame))];
        [path moveToPoint: NSMakePoint(NSMaxX(cellFrame), NSMinY(cellFrame))];
        [path appendBezierPathWithArcWithCenter: NSMakePoint(NSMaxX(innerRect), NSMaxY(innerRect))
                                         radius: r
                                     startAngle: 0
                                       endAngle: 90];
        [path appendBezierPathWithArcWithCenter: NSMakePoint(NSMinX(innerRect), NSMaxY(innerRect))
                                         radius: r
                                     startAngle: 90
                                       endAngle: 180];
        [path lineToPoint: NSMakePoint(NSMinX(cellFrame), NSMinY(cellFrame))];
        break;
      case MilkScrollerArrowUp:
        cellFrame.origin.y += 1.0;
        [path appendBezierPathWithArcWithCenter: NSMakePoint(NSMinX(innerRect), NSMinY(innerRect))
                                         radius: r
                                     startAngle: 180
                                       endAngle: 270];
        [path appendBezierPathWithArcWithCenter: NSMakePoint(NSMaxX(innerRect), NSMinY(innerRect))
                                         radius: r
                                     startAngle: 270
                                       endAngle: 360];
        [path lineToPoint: NSMakePoint(NSMaxX(cellFrame), NSMaxY(cellFrame))];
        [path lineToPoint: NSMakePoint(NSMinX(cellFrame), NSMaxY(cellFrame))];
        [path closePath];
        break;
    }
    return path;
}
@end
