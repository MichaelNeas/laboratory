## Review

### Protocol

A blueprint/pattern of functions that a class can implement.  Whenever the delegate of the protocol is called the function will execute.

### How do you get an app on the app store?

1. You need an individual or company held registered account.  
1. Then you need an app id.  
1. Then create a distribution certificate.  
1. Then you need an app store provisioning profile.  
1. In Xcode, the appID should match the portal, and the build settings need to match. 
1. Then archieve it with a generic device or real device.  
1. Then make an app on the apple web portal with matching app id.  
1. Validate or submit to app store from xcode.
1. Once approved it goes to itunes connect and it needs to process.
1. Update the description and all the other goodies. 
1. Submit it

### ARC

Automatic Reference Counting, garbage collection in swift.  Every time a strong reference is made we increase the retain count and does not throw away the references until dereferenced.  Not necessarily a solve all solution, as you can still experience memory leaks but you don't need to manage memory for everything like in lower level languages or early objC.  Retain cycles are when two objects have strong references to each other, this is where the weak keyword comes into play.

### A Bundle

Apps can have bundles, that store resources like images or plists.  Bundles are not limited to main bundles, external fameworks can be bundled up to allow runtime resolution of resources.

### When to use struct vs class

Structs are passed by value and classes are passed by reference.  Structs contain all value types, and they are lighter weight than classes.  As a rule of thumb you can use structs when you anticipate objects only having value types.

Structs are generally light weight and clean because they do not support inheritence.

### What are value types and what are ref types in swift?

Anything that's a custom object is passed by reference.
Default datatypes are passed by value.

### How can you create a custom view?

You make a subclass of UIView or button or whatever and you can extend those views and modify them as needed. 

### HTTP requests and parsing JSON

NSURLSession for HTTP/S Requests, you can set delegates, base urls and you can tap into api that way.
AFNetworking or Alamofire are wrappers that allow convenient usage of NSURLSession. 
NSJSON serializer or swiftyJSON if you want 3rd party.  Codable is massive from swift 4.

### What do you use to show a list of data on a screen?

UITableView that implements uitableviewdelegate, datasource, and you can tap into delegate methods for cells
UITableViewController can do this automatically
UITableViewCells are dequed when off scren and allows you to reuse on scrolls
UICollectionView is another one.

### What is polymorphism and when would you use it?

In OOP it's the idea of having two different objects in a subclass that can override superclass.  You can pass whatever objects into parent classes as needed.

### UIWindow?

Main window of an application, you can get the UIWindow main bounds, everything you do goes on to that window

### UIApplication?

Singleton, starting point of app, that forwards down events to subviews, works behind the scenes, has delegate methods.

### ViewDidLoad vs ViewDidAppear

ViewDidLoad fires once on initialization in memory, viewdidappear fires every time the view shows.

### NSNotification Center?

The observer pattern that allows you to listen for notifications in the notification center.  If your class is observing the notification you supply a callback to receive messages.  NotificationCenter is one to many, but delegate pattern is one to one.

### How do threads work in iOS?

Your application can have one or more threads, or instances of code running together.  The main thread should be where UI layer is, so you don't want to block the main thread.  When you're doing a separate request on a different thread, you have to make sure you get the data back into the main thread.

### Xibs vs Storyboards

Xibs are layout files, visual layouts in XML tied to code accordingly.  In a storyboard your application can have a flow of views.  Xibs with a clear distinct path.

### Bounds vs Frames

Frame - Position relative to super/parent view, x, y, height, width, the smallest bounding box around the view (container of the content)
Bounds - Position relative to it's own coordinate system, x=0, y=0
They will be pretty similar until rotations or transformation occur 


### Concurrency

Apple's multi core processors allow us to multithread in Swift
Grand central dispatch handles a lot of threading for us

- Serial Queue - Tasks are handled in order, does not move forward to other tasks until previous are finished.  Predictable execution order. Slower than concurrent. Each app gets one, the main.

- Concurrent Queue - Tasks start in order, but certain tasks that are quicker than others finish first.  Unpredictable order, race conditions. Each app gets 4 background concurrent queues.

```
DispatchQueue.main.async { //go back to main thread from background }
DispatchQueue.global(qos: .background).async { //send to background manually }
```

### Web Requests

URLSession is automatically thrown on to the background thread so we don't need to explicitly define that condition.
```
let defaultSession = URLSession(configuration: .default) // Native networking class
var dataTask: URLSessionDataTask? // URL Sessions task that returns data directly to memory
```
Make a URLSession and a URLSessionDataTask for use in your class

Simplest GET
```
dataTask?.cancel() // cancel existing tasks
if var urlComponents = URLComponents(string: urlString) {
    guard let url = urlComponents.url else { return }
    dataTask = defaultSession.dataTask(with: url) { data, response, error in
                defer { self.dataTask = nil }
                // da logics
    }
    dataTask?.resume()
}
```

Simplest DELETE
```
dataTask?.cancel()
if var url = URL(string: urlString) {
    var request = URLRequest(url: url)
    request.httpMethod = "DELETE"
    dataTask = defaultSession.dataTask(with: request) { data, response, error in
        defer { self.dataTask = nil }
    }
    dataTask?.resume()
}
```

URL's are made up of strings, you can grab a URLComponents.url to use in dataTask

For requests using data URL's, and other requests we know do not automatically go to background thread we need to define that.

```
DispatchQueue.global().async {
    do {
        let data = try Data(contentsOf: url) 
        guard let image = UIImage(data: data) else { return }
        DispatchQueue.main.async {
            completion(image)
        }
    } catch {
        print(error.localizedDescription)
    }
}
```

Dispatch.main.async puts everything back on the main thread