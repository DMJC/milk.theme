#import <AppKit/NSButtonCell.h>



@interface MilkWindowButtonCell : NSButtonCell
{
  NSColor * baseColor;
}
- (void) drawBallWithRect: (NSRect)frame;
- (void) drawWithFrame: (NSRect)cellFrame inView: (NSView*)controlView;
@property (retain) NSColor * baseColor;
@end
