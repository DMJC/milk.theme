/**
* Copyright (C) 2013 Alessandro Sangiuliano
* Author: Alessandro Sangiuliano <alex22_7@hotmail.com>
* Date: 31 December 2013
*/

#import "Milk.h"
#import "NSTextFieldCell+Milk.h"

/* Problems just with the first click in the textbox
 * then all works as should works.
 * The Cell and the text box are not aligned on the first click.
 */

@implementation NSTextFieldCell (MilkTheme)

- (void) drawInteriorWithFrame: (NSRect)cellFrame inView: (NSView*)controlView
{
	NSRect titleRect;
	cellFrame.origin.y -= 1;
	cellFrame.size.height += 2;
	//cellFrame.size.width -= 1;
	[self _drawEditorWithFrame: cellFrame inView: controlView];
  if (_cell.in_editing)
  {
	cellFrame.origin.y -= 1;
	cellFrame.size.height += 2;
	//cellFrame.size.width -=10 ;

	[self _drawEditorWithFrame: cellFrame inView: controlView];
	//titleRect = [self titleRectForBounds: cellFrame];
	//titleRect.origin.y -= 10;
  }
  else
    {
      //NSRect titleRect;
	cellFrame.origin.y-= 1;
	cellFrame.size.height += 2;
	//cellFrame.size.width -= 10;
	//[self _drawEditorWithFrame: cellFrame inView: controlView];

       /*Make sure we are a text cell; titleRect might return an incorrect
         rectangle otherwise. Note that the type could be different if the
         user has set an image on us, which we just ignore (OS X does so as
         well).*/ 
      _cell.type = NSTextCellType;
      titleRect = [self titleRectForBounds: cellFrame];
	//titleRect.origin.y -= 1;
	//titleRect.size.height += 2;
      [[self _drawAttributedString] drawInRect: titleRect];
	//[self _drawEditorWithFrame: cellFrame inView: controlView];

    }
/*_cell.type = NSTextCellType;
      titleRect = [self titleRectForBounds: cellFrame];
titleRect.origin.y -= 1;
titleRect.size.height += 2;
 [[self _drawAttributedString] drawInRect: titleRect];*/

}

// The cell needs to be asjusted also when is selected or edited


- (void) selectWithFrame: (NSRect)aRect

                  inView: (NSView*)controlView
                  editor: (NSText*)textObject
                delegate: (id)anObject
                   start: (NSInteger)selStart
                  length: (NSInteger)selLength
{
	if (![self isMemberOfClass:[NSSearchFieldCell class]])
	{
		NSRect drawingRect = [self drawingRectForBounds: aRect];
		drawingRect.origin.x -= 4;
		drawingRect.size.width -= 0;
		drawingRect.origin.y -= 6;
		drawingRect.size.height += 11;
		[super selectWithFrame:drawingRect inView:controlView editor:textObject delegate:anObject start:selStart length:selLength];
	}
	else
	{
		[super selectWithFrame:aRect inView:controlView editor:textObject delegate:anObject start:selStart length:selLength];
	}
}

- (void) editWithFrame: (NSRect)aRect
                inView: (NSView*)controlView
                editor: (NSText*)textObject
              delegate: (id)anObject
                 event: (NSEvent*)theEvent
{
	if (![self isMemberOfClass:[NSSearchFieldCell class]])
	{
		NSRect drawingRect = [self drawingRectForBounds: aRect];
		drawingRect.origin.x += 4;
		drawingRect.size.width -= 0; //it was 6. Same in the selectWithFrame:::::: method
		drawingRect.origin.y -= 6;
		drawingRect.size.height += 11;
		[super editWithFrame:drawingRect inView:controlView editor:textObject delegate:anObject event:theEvent];
	}
	else
	{
		[super editWithFrame:aRect inView:controlView editor:textObject delegate:anObject event:theEvent];
	}



}

@end


