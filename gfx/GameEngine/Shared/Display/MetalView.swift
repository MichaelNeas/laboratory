import MetalKit
import SwiftUI

struct MetalView: NSViewRepresentable {
    init () {
        Engine.Ignite(device: MTLCreateSystemDefaultDevice()!)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeNSView(context: NSViewRepresentableContext<MetalView>) -> MTKView {
        let gameView = MTKView()
        gameView.device = Engine.Device
        gameView.delegate = context.coordinator
        gameView.clearColor = Preferences.ClearColor
        gameView.colorPixelFormat = Preferences.MainPixelFormat
        gameView.depthStencilPixelFormat = Preferences.MainDepthPixelFormat
        context.coordinator.updateScreenSize(view: gameView)
        return gameView
    }
    
    func updateNSView(_ nsView: MTKView, context: NSViewRepresentableContext<MetalView>) {}
    
    class Coordinator: Renderer {
        var parent: MetalView

        init(_ parent: MetalView) {
            self.parent = parent
            super.init()
        }
    }
}

// MARK: Key Input
extension MTKView {
    open override func keyUp(with event: NSEvent) {
        Keyboard.setKeyPressed(event.keyCode, isOn: false)
    }
    
    open override func keyDown(with event: NSEvent) {
        Keyboard.setKeyPressed(event.keyCode, isOn: true)
    }
    
    open override var acceptsFirstResponder: Bool { return true }
}

// MARK: Mouse Input
extension MTKView {
    open override func mouseDown(with event: NSEvent) {
        Mouse.SetMouseButtonPressed(button: event.buttonNumber, isOn: true)
    }
    
    open override func mouseUp(with event: NSEvent) {
        Mouse.SetMouseButtonPressed(button: event.buttonNumber, isOn: false)
    }
    
    open override func rightMouseDown(with event: NSEvent) {
        Mouse.SetMouseButtonPressed(button: event.buttonNumber, isOn: true)
    }
    
    open override func rightMouseUp(with event: NSEvent) {
        Mouse.SetMouseButtonPressed(button: event.buttonNumber, isOn: false)
    }
    
    open override func otherMouseDown(with event: NSEvent) {
        Mouse.SetMouseButtonPressed(button: event.buttonNumber, isOn: true)
    }
    
    open override func otherMouseUp(with event: NSEvent) {
        Mouse.SetMouseButtonPressed(button: event.buttonNumber, isOn: false)
    }
}

// MARK: Mouse Movement
extension MTKView {
    open override func mouseMoved(with event: NSEvent) {
        setMousePositionChanged(event: event)
    }
    
    open override func scrollWheel(with event: NSEvent) {
        Mouse.ScrollMouse(deltaY: Float(event.deltaY))
    }
    
    open override func mouseDragged(with event: NSEvent) {
        setMousePositionChanged(event: event)
    }
    
    open override func rightMouseDragged(with event: NSEvent) {
        setMousePositionChanged(event: event)
    }
    
    open override func otherMouseDragged(with event: NSEvent) {
        setMousePositionChanged(event: event)
    }
    
    private func setMousePositionChanged(event: NSEvent) {
        let overallLocation = SIMD2<Float>(Float(event.locationInWindow.x), Float(event.locationInWindow.y))
        let deltaChange = SIMD2<Float>(Float(event.deltaX), Float(event.deltaY))
        Mouse.SetMousePositionChange(overallPosition: overallLocation, deltaPosition: deltaChange)
    }
    
    open override func updateTrackingAreas() {
        let area = NSTrackingArea(rect: self.bounds,
                                  options: [
            NSTrackingArea.Options.activeAlways,
            NSTrackingArea.Options.mouseMoved,
            NSTrackingArea.Options.enabledDuringMouseDrag
                                  ],
                                  owner: self,
                                  userInfo: nil)
        addTrackingArea(area)
    }
}
