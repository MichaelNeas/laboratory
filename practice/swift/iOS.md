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
- Apple's symbols icon collection is called SF Symbols.
- UserDefaults is stringly typed, key names are strings
- `dateFormat` allows us to specify a precise format for our dates, whereas `dateStyle` has a selection of built-in formats that match the user's settings.

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
- option + cmd + p - resume preview

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

## SwiftUI
- SceneDelegate is used for launching windows in your app, popular for use in iPad where users can have multiple windows of an app open at the same time
- Preview Assets you'd like to use when designing a user interface
- View is the basic protocol you have to use to draw anything on the screen, requires `body`
- some: `some`thing that conforms must be returned
- `ContentView_Previews` only affects the way preview shows ui
- `Form` allows a max of 10 fields, then requires `Group` after that, `Section` is another option that provides a visual separation
- `NavigationView` is like a navigation bar
- `@State` allows us to get passed the mutability limitations of structs, automatically watches for changes and will update the body
- `$` allows for read and write of state variables (two way binding)
- `.pickerStyle(SegmentedPickerStyle())` adds a segmented control to pickers 
- `Spacer()` fills the rest of the space of the device, `Spacer(minLength:)` works for both width and height depending on the containing view
- `.edgesIgnoringSafeArea(.all)` goes outside safe area
- `LinearGradient` is a neat type of view that gives us gradients
- `onDelete()` modifier exists only on ForEach
- modifiers are the primary driver behind changing up views
- cannot call mutating function on constant struct instance
- draw borders with a custom shape by using the overlay() modifier.
- Structs are used for swiftUI for performance and isolation of state
- opaque return type: one specific type that conforms to the return protocol
- environment modifier is like css, where modifiers cascade to children.  On the other hand regular modifiers are added and do not do replacement
- The wheel picker style is available only on iOS. 
- Placing two views in a List row will create an implicit HStack
- `blur()` modifier applies a Gaussian blur to a view
- `onChanged()` and `onEnded()` modifiers are on DragGesture
- `Asymmetric transitions` let us specify one transition for insertion and another for removal.
- every time a struct is modified a new struct is made and the old is tossed, which is how `@State` works, it listens to the reassignment
- `@ObservedObject` can only be used with classes that conform to `ObservableObject`
- `@Published` more or less the same as `@State`, for properties in observed objects. It announces changes from a property; `@ObservedObject` watches an observed object for changes.
- `@Environment` property wrappers let you read what's going on in the current environment
- `Identifiable` gives a promise that the block has an id property and it is unique
- `EditButton()` will automatically switch between Edit and Done when tapped. 
- `list` will instantiate new structs that are out of screen bounds lazily, where `ScrollView` loads up all of them
- `NavigationLink` gives us the ability to navigate to a new view, requires a `NavigationView` to work
- `GeometryReader` provides dynamic sizes for general content in a view, it lets us read the size of a view's container
- `layoutPriority` gives views more priority over other views, Higher layout priority values mean views are more likely to be allocated space in their container. 0 default
- `buttonStyle()` controls the way SwiftUI highlights navigation links
- `frame(maxWidth: .infinity)` will fill the complete width of available screen
- Sheets are presented above the current screen
- `Shape` uses paths to draw, `InsettableShape` builds on top to allow us the ability to inset shapes with respect to their bounds
- `ImagePaint` can be used for shape backgrounds, strokes and borders
- `drawingGroup` enables metal rendering, for when performance in CoreAnimation is being choked up
- `animatableData` for shapes allows swiftui to interpolate changes smoothly in animations
- `saturation` & `blur` adjust the color saturation & blur of any view in real-time
- `CGAffineTransform` can be used to store rotation and translation data and store shearing and scaling.
- `AnimatablePair` can only animate values that are animatable, which excludes integers.
- The `@Published` property wrapper places our properties inside a `Published` struct. 
- `@Binding` lets us share one value in 2 places
- SwiftUI gives us `AnyView` as a Type erasure to let us hide the underlying type of an object, which conforms to `View`
- Views presented as sheets have their own environment, so if you want to share values you need to pass them in.
- Constant bindings cannot have their value changed by the user

## Core Data
- We can create a testing managed object context for the purpose of SwiftUI previews, they just require a concurrency type
- Managed objects must be created inside a managed object context.
- Core Data is available on all of Apple's platforms.
- We need to call `save()` on managed object context.
- `[C]` makes an NSPredicate case-insensitive.
- If you want more complex predicates you can combine multiple instances of `NSPredicate` using `NSCompoundPredicate`.
- We need to convert the `NSSet` to something more useful before we can use it with SwiftUI.
- We can dynamically replace an `NSPredicate` string with an attribute name using `%K`
- Fetch requests work on single entities.
- `NSManagedObject` subclasses automatically conform to the `Hashable` protocol
- All managed objects have a unique object ID
- `hasChanges` property to check whether a managed object context has changes before we try to save it
- Fetch requests take an array of sort descriptors, and they are applied in order.
- We can add as many constraints as we want by separating them using commas
- `BEGINSWITH` and `CONTAINS` predicate is case-sensitive.

## CoreML
- linear regression: draw one straight line through the data points, where average between line and points are as minimal as possible
- decision tree: natural tree structure based on a series of choices
- boosted tree: series of decision trees, each tree corrects errors in previous tree, access to all available data
- random forest: similar to boosted trees, each tree has access to only a subset of data that's different from other trees
- Root Mean Square Error: on average there is only an error of a given amount of seconds
- output is the best algorithm to use