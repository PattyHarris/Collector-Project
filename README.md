#  Notes

    1. This project uses an icon from Camera by Alfa Design from the Noun Project.
    After adding the png to sketch to fill in some colors, we used Aspect Fit to
    resize the image on the view.

    2. Some other notes my future reference:

        a. To add the navigation items to a simple View Controller, first add a navigation item to
        anywhere on the view controller.  You can then add bar button items to the view controller.
    
        b. The layout for the image view needs to ensure that when the keypad is shown, it doesn't
        cover the Add button.  Instead of forcing the image to be a 1:1 ratio, we changed
        the ratio to 8:5, keeping the sides at their current spacing.  To get this reatio,
        control drag inside the ImageView and select Aspect Ratio.  So, for this
        image view, layouts were 20 (left), 20 (right), and 20 (top) with the
        aspect ratio (which we later changed to 8:5)
        
        c. This instructor likes to use vertical spacing.  He uses the Horizontal
        Spacing layout followed by Vertical Spacing to the control what is near the
        one you're working with.
    
        d. Core Data: when storing images, make sure you use the "store externally" option.
        Also, for both the title and image, the optional feature is "off"

## Installing on your phone

    Here's general notes on installing the app on your phone.  This lecture followed uploading
    the TalkBoy app to the store (at least to the point where we couldn't go further due to the
    iOS 11 restriction).
    
    1. Nick uses the USB method for installing on the phone.
    
    2. I had to change the deployment version to 10.3
    
    3. We also had to add permission to use the camera - in the plist, hit the + and
    add add the Privacy - Camera Usage Description where you add a message as to why
    you need to use the camera.
    
    4. Add permission for the photo library - Privacy - Photo Library Usage with an
    appropriate message.
    
    5. 
    


