# Notes on iOS

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