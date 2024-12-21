include $(GNUSTEP_MAKEFILES)/common.make

PACKAGE_NAME = Milk
BUNDLE_NAME = Milk
BUNDLE_EXTENSION = .theme
VERSION = 1

Milk_INSTALL_DIR=$(GNUSTEP_LIBRARY)/Themes
Milk_PRINCIPAL_CLASS = Milk

Milk_OBJC_FILES = \
		Milk.m\
		Milk+Drawings.m\
		Milk+Button.m\
		Milk+FocusFrame.m\
		Milk+WindowDecoration.m\
		Milk+Menu.m\
		Milk+Slider.m\
		Milk+ProgressIndicator.m\
		Milk+Scroller.m\
		Milk+ColorWell.m\
		Milk+Stepper.m\
		Milk+Segmented.m\
		Milk+Browser.m\
		Milk+Table.m\
		GSStandardDecorationView+Milk.m\
		NSWindow+Milk.m\
		NSSegmentedCell+Milk.m\
		MilkWindowButton.m\
		MilkWindowButtonCell.m\
		MilkScrollerKnobCell.m\
		MilkScrollerKnobSlotCell.m\
		MilkScrollerArrowCell.m\
		NSBrowserCell+Milk.m\
		NSSearchFieldCell+Milk.m\
		NSCell+Milk.m\
		NSTextFieldCell+Milk.m\
		NSBox+Milk.m\
		NSPopUpButton+Milk.m
ADDITIONAL_OBJC_LIBS = -lobjc
ADDITIONAL_TOOL_LIBS =
$(BUNDLE_NAME)_RESOURCE_FILES = \
	./Resources/ThemeImages\
	./Resources/ThemeTiles\
	./Resources/*.clr
include $(GNUSTEP_MAKEFILES)/bundle.make

-include GNUmakefile.postamble

