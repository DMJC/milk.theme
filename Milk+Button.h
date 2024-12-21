#import "Milk.h"
#include <AppKit/NSAnimation.h>

@interface Milk(MilkButton)
{
}
@end


@interface NSButtonCell(MilkDefaultButtonAnimation)
  @property (nonatomic, copy) NSNumber* isDefaultButton;
  @property (nonatomic, copy) NSNumber* pulseProgress;
@end
