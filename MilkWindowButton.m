#import "MilkWindowButton.h"
#import "MilkWindowButtonCell.h"

@implementation MilkWindowButton

+ (Class) cellClass
{
  return [MilkWindowButtonCell class];
}
- (void) setBaseColor: (NSColor*)c
{
  [_cell setBaseColor: c];
}
- (BOOL) isFlipped
{
  return NO;
}

@end
