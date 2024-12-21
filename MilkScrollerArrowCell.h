#import <AppKit/NSButtonCell.h>

typedef enum {
  MilkScrollerArrowLeft,
  MilkScrollerArrowRight,
  MilkScrollerArrowUp,
  MilkScrollerArrowDown
} MilkScrollerArrowType;

@interface MilkScrollerArrowCell : NSButtonCell
{
  MilkScrollerArrowType scroller_arrow_type;
}
-(void) setArrowType: (MilkScrollerArrowType) t;
@end

