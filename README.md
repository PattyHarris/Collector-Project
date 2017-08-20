#  Notes

1. This project uses an icon from Camera by Alfa Design from the Noun Project.
    After adding the png to sketch to fill in some colors, we used Aspect Fit to resize the image on the view.
2. Some other notes my future reference:
    a. To add the navigation items to a simple View Controller, first add a navigation item to anywhere on the view controller.
    You can then add bar button items to the view controller.
    
    b. The layout for the image view needs to ensure that when the keypad is shown, it doesn't cover the Add button.
    Instead of forcing the image to be a 1:1 ratio, we changed the ratio to 8:5, keeping the sides at their current spacing.
    
    c. This instructor likes to use vertical spacing.  He uses the Horizontal Spacing layout followed by Vertical Spacing to the
    control that's near the one you're working with.
    
    d. Core Data: when storing images, make sure you use the "store exteranally" option.  Also, for both the title and image, the
    optional feature is "off"

