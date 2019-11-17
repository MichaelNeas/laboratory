# Notes on iOS

- 2 or 3 pixels is equal to 1 point.
- https://developer.apple.com/documentation/uikit/uiactivityviewcontroller
- assertions get removed in appstore build
- CTM stands for Current Transformation Matrix.  It stores the current translation, scale, and rotation that will be applied to drawing.
- the introduction of retina screens are why we use points(virtual pixels) instead of pixels
- 2x, 3x images are looked for under the hood and the app store uses app thining to remove unneccessary images based on device
- ios10+ removes non-retina devices so you only need to include 2x,3x
- ActivityViewControllers are an easy way to enable sharing to social media or interacting with iphone sharing services
- Because @IBAction means you're connecting storyboards (Objective-C code) to Swift code, it always implies @objc as well.
- Option click to give zoom in/out on map views
- can move green breakpoint line up or down!
- Swift extensions communicates with iOS, which communicates with Safari.
- Extensions are shipped inside the parent app.
- The contentInset property of a UITextView determines how text is placed inside the view. 
- The .replace blend more ignores transparency, which makes it faster to draw.
- iBeacon detection is powered by the Core Location framework.
- Unreliable networking is usually better for live streaming, where getting the latest data there quickly is more important than ensuring old data arrives.
- Core Graphics can render to PDFs or to screens. 
- NSValue was needed because Objective-C was not able to store CGRect and other structs in arrays and dictionaries.
- When biometric authentication succeeds or fails we might be notified on the main thread, or we might be notified on a background thread.
- add a simple shadow to a UIView by using the shadow properties of its layer.
- `invalidate()` on a timer stops it from working, and frees up any references it was holding. 
- Clipping paths allow us to restrict where drawing takes place in a Core Graphics context.
- dequeueReusableCell(withIdentifier:) returns an optional, whereas dequeueReusableCell(withIdentifier:for:) always returns a table view cell.
- UIImage(named:) keeps images it loads in a special cache which is managed by UIKit and will be cleared automatically.
- if a struct has a private member we can't get a default initializer
- cannot call mutating function on constant struct instance

## Terminologies
xib - XML Interface Builder
nib - NeXT Interface Builder
CA - Core Animation
Bundle - how apple presents code and other resources on your drive
- A xib turns into a nib after it has been compiled, apis all use nib terminology because of this
- nested classes don't work in interface builder, IBInspectables is a solution
- clips to bounds will not let inner views expand past bounds
- awakeFromNib() is similar to viewDidLoad, but for runtime use only - prepareForInterfaceBuilder is used instead
- update frames in editor menu to refresh IB
- you can declare a label outlet in the controller and assign it from the outlets to the view in the nib
- you can use nibs in nibs and reference them from the outside world with files owner
- IBInspectable & IBDesignable lets you use IB to modify runtime properties
- you can add views to nib sceneDock which can be super helpful for modals
- a container view controller manages it's own view and at least 1 other view that represents a part of the screen
- refactor menu on right click
- UIKit is ObjC not swift
- Embed segues are an alternative to loading child view controllers in code, requires container views to use
- Outlet collections can store multiple ui elements to an array
- It's important to think about abstract classes paired with generics
- document outline shows storyboard contents
- A transient allocation is one that was created and subsequently destroyed. 

## IB HotKeys 
- cmd + 0, opt + cmd + 0 to bring in/out side views
- hold shift for multi options when assigning constraints
- shift + cmd + o for menu, option + enter in this view pops open the file in assistant editor
- cmd + d to duplicate
- shift + cntrl on overlapping views gives an option of which to choose 
- shift + cmd + l will bring up view component library

## XCode Text Editor/File Menu Hot Keys
- cntrl + cmd + e multiselection and rename of a given word
- option + drag on files will make a copy
- cmd + . will stop the project
- cmd + r will run the project

## Animations
- A scale transform of X:0.5 Y:0.5 makes a view 50% of its default size.
- Translation transform with negative Y value moves it up the screen
- Clear color => alpha 0
- The identity transform resets views to their default size, position, and rotation.
- Spring animations cause their values to overshoot and bounce. 

## SpriteKit
- A sprite is any one visible image in our game
- `.replace` for background image is faster because it ignores transparency.
- Restitution controls a sprite's bounciness.
- The collision bitmask determines bounces; the contact test bitmask determines which bounces we get told about.
- SpriteKit action sequences are made from arrays and are executed in order
- blend mode ignores transparency
- any part of an SKCropNode mask will not have it's color cropped
- Y:0 is the bottom of the screen in spritekit
- angular damping controls how fast an object's rotation slows down
- Pixel-perfect collision detection is the slowest of all options.
- update() method is called once every frame
- SKTexture lets us change the image of an SKSpriteNode without having to delete and recreate it. 
- A physics body with isDynamic set to false will no longer be affected by gravity. 
- removeAllActions() removes the actions immediately rather than waiting for them to complete.

## Instruments
- Profile your application
- Open an instrument for what you want to look into with your app including: Core Animation, memory leaks, core data, threading, activity monitor, system usage and much more
- See how your app is performing and if any of the phone is being over worked causing issues
- Flags with cmd + down