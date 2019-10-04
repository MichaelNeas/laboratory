//
//  Model.swift
//  SocketTest
//
//  Created by Michael Neas on 10/4/19.
//  Copyright © 2019 Neas Lease. All rights reserved.
//

import Foundation

class Model: ObservableObject, WebSocketConnectionDelegate {
    @Published var messages = [Message]()
    
    func onConnected(connection: WebSocketConnection) {
        print("connected")
    }
    
    func onDisconnected(connection: WebSocketConnection, error: Error?) {
        print("disconnected")
    }
    
    func onError(connection: WebSocketConnection, error: Error) {
        print(error)
    }
    
    func onMessage(connection: WebSocketConnection, text: String) {
        if messages.last?.message != text {
            DispatchQueue.main.async {
                self.messages.append(Message(message: text, me: false))
            }
        }
    }
}
