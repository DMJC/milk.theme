#include "Milk.h"
#include "MilkScrollerKnobCell.h"
#include "MilkScrollerKnobSlotCell.h"
#include "MilkScrollerArrowCell.h"

@interface Milk(MilkScroller)

@end

@implementation Milk(MilkScroller)

/* NSScroller themeing. */

- (NSButtonCell*) cellForScrollerArrow: (NSScrollerArrow)arrow
			    horizontal: (BOOL)horizontal
{
  MilkScrollerArrowCell	*cell;
  NSString	*name;

  cell = [MilkScrollerArrowCell new];
  [cell setBezelStyle: NSRoundRectBezelStyle];
  if (horizontal)
    {
      if (arrow == NSScrollerDecrementArrow)
	{
	  [cell setHighlightsBy:
	    NSChangeBackgroundCellMask | NSContentsCellMask];
	  [cell setImage: [NSImage imageNamed: @"common_ArrowLeft"]];
	  [cell setImagePosition: NSImageOnly];
          name = GSScrollerLeftArrow;
    [cell setArrowType: MilkScrollerArrowLeft];
	}
      else
	{
	  [cell setHighlightsBy:
	    NSChangeBackgroundCellMask | NSContentsCellMask];
      [cell setImage: [NSImage imageNamed: @"common_ArrowRight"]];
      [cell setImagePosition: NSImageOnly];
      name = GSScrollerRightArrow;
    [cell setArrowType: MilkScrollerArrowRight];
	}
    }
  else
    {
      if (arrow == NSScrollerDecrementArrow)
	{
	  [cell setHighlightsBy:
	    NSChangeBackgroundCellMask | NSContentsCellMask];
      [cell setImage: [NSImage imageNamed: @"common_ArrowUp"]];
      [cell setImagePosition: NSImageOnly];
      name = GSScrollerUpArrow;
    [cell setArrowType: MilkScrollerArrowUp];
	}
      else
	{
	  [cell setHighlightsBy:
	    NSChangeBackgroundCellMask | NSContentsCellMask];
	  [cell setImage: [NSImage imageNamed: @"common_ArrowDown"]];
	  [cell setImagePosition: NSImageOnly];
          name = GSScrollerDownArrow;
    [cell setArrowType: MilkScrollerArrowDown];
	}
    }
  [self setName: name forElement: cell temporary: YES];
  RELEASE(cell);
  return cell;
}

- (NSCell*) cellForScrollerKnob: (BOOL)horizontal
{
  NSButtonCell	*cell;

  cell = [MilkScrollerKnobCell new];
  [cell setButtonType: NSMomentaryChangeButton];
  [cell setBezelStyle: NSRoundedBezelStyle];
  [cell setImagePosition: NSImageOnly];

  [cell setTitle: @""];
  if (horizontal)
    {
      [self setName: GSScrollerHorizontalKnob forElement: cell temporary: YES];
    }
  else
    {
      [self setName: GSScrollerVerticalKnob forElement: cell temporary: YES];
    }
  RELEASE(cell);
  return cell;
}

- (NSCell*) cellForScrollerKnobSlot: (BOOL)horizontal
{
  // TS: unused
  // GSDrawTiles   		*tiles;
  MilkScrollerKnobSlotCell	*cell;
  NSColor			*color;
  NSString      		*name;

  if (horizontal)
    {
      name = GSScrollerHorizontalSlot;
    }
  else
    {
      name = GSScrollerVerticalSlot;
    }

  // TS: unused
  // tiles = [self tilesNamed: name state: GSThemeNormalState];
  color = [self colorNamed: name state: GSThemeNormalState];

  cell = [MilkScrollerKnobSlotCell new];
  [cell setBordered: false];
  [cell setTitle: nil];
  [cell setHorizontal: horizontal];
  [self setName: name forElement: cell temporary: YES];

  if (color == nil)
    {
      color = [NSColor scrollBarColor];
    }
  [cell setBackgroundColor: color];
  RELEASE(cell);
  return cell;
}
// REMEMBER THIS SETTING
- (float) defaultScrollerWidth
{
  return 16.0;
}

- (BOOL) scrollViewUseBottomCorner
{
  return YES;
}

- (BOOL) scrollViewScrollersOverlapBorders
{
  return NO;
}

@end
