#import <AppKit/AppKit.h>
#import <Foundation/NSUserDefaults.h>
#import <GNUstepGUI/GSTheme.h>

@interface Milk: GSTheme
+ (NSColor *) controlStrokeColor;
- (void) drawPathButton: (NSBezierPath*) path
                     in: (NSCell*)cell
			            state: (GSThemeControlState) state;
@end


#import "Milk+Drawings.h"
