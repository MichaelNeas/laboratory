//
//  GameEngineApp.swift
//  Shared
//
//  Created by Michael Neas on 7/18/22.
//

import SwiftUI

@main
struct GameEngineApp: App {
    var body: some Scene {
        WindowGroup {
            MetalView()
        }
    }
}

// bgra8Unorm is most common
// compute command encoder - computational tasks, no gfx
// blit - memory management tasks
// parallel - multiple things at the same time
// render - render gfx
// cmd buffer 1 computes texture information to be drawn (compute encoder)
// cmd buffer 2 uses texture to render (render encoder)
