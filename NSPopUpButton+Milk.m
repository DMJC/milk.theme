#import "Milk.h"
#import <AppKit/NSPopUpButton.h>

@interface NSPopUpButton (MilkTheme)
- (void) MILKmouseDown: (NSEvent*)theEvent;
@end

@implementation Milk (NSPopUpButton)
- (void) _overrideNSPopUpButtonMethod_mouseDown: (NSEvent*)theEvent {
  MILKLOG(@"_overrideNSPopUpButtonMethod_mouseDown:");
  NSPopUpButton *xself = (NSPopUpButton*)self;
  [xself MILKmouseDown:theEvent];
}
@end

@implementation NSPopUpButton (MilkTheme)

- (void) MILKmouseDown: (NSEvent*)theEvent
{ 
  [_cell trackMouse: theEvent 
	     inRect: [self bounds] 
	     ofView: self 
       untilMouseUp: NO];
}

@end

