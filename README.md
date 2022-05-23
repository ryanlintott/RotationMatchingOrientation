# RotationMatchingOrientation

Rotates any view so that it matches the device orientation if it's in an array of allowed orientations.

*Submission for SwiftUISeries - Workarounds & Hacks event*

# Why did I make this workaround?
When building [Old English Wordhord](https://oldenglishwordhord.com/app/) I wanted the app to be portrait-only but the image view to rotate with the phone. Although this can be done in UIKit, SwiftUI doesn't have a way to control allowed orientations per view.

# Example
The app only allows portrait and landscapeLeft orientations but the content can be set to rotate to any number of orientations using the toggles.

[![Example Video](https://img.youtube.com/vi/Ae4hbOIU9jc/0.jpg)](https://www.youtube.com/watch?v=Ae4hbOIU9jc)

# How does it work?
- Device orientation is taken from `UIDevice.current.orientation`
- `supportedInterfaceOrientations` is taken from `UISupportedInterfaceOrientations` in the app bundle
- `interfaceOrientation` is determined from `deviceOrientation` and `supportedInterfaceOrientations`
- `contentOrientation` is determined from `deviceOrientation` and `allowedOrientations`
- Rotation between `interfaceOrientation` and `contentOrientation` is used to rotate the content view
- GeometryReader is used to calculate the size of the space
- Height and width of the content are swapped if there's a 90 degree different between `interfaceOrientation` and `contentOrientation`
- `.position()` modifier is used to center the view
- Orientations are updated whenever:
  - `.onAppear`
  - `allowedOrientations` are changed
  - `.orientationDidChangeNotification` fires
  - `.willEnterForegroundNotification` fires

# Use it in your app
This component is available in my Swift package:

<a href="https://github.com/ryanlintott/FrameUp">
  <img width="456" alt="FrameUp Logo" src="https://user-images.githubusercontent.com/2143656/149010960-2b0e1200-b6d4-40a5-bbe7-4aabc5ce6b09.png">
</a>

