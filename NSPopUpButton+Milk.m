#import "Milk.h"
#import <AppKit/NSPopUpButton.h>

@implementation NSPopUpButton (MilkTheme)

- (void) mouseDown: (NSEvent*)theEvent
{ 
  [_cell trackMouse: theEvent 
	     inRect: [self bounds] 
	     ofView: self 
       untilMouseUp: NO];
}

@end

