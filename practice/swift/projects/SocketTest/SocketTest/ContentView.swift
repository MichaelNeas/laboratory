//
//  ContentView.swift
//  SocketTest
//
//  Created by Michael Neas on 10/4/19.
//  Copyright © 2019 Neas Lease. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var message: String = ""
    @ObservedObject private var model = Model()
    @ObservedObject private var keyboard = KeyboardResponder()
    
    var socket: NativeWebSocket?
    
    init() {
        socket = NativeWebSocket(url: URL(string: "ws://localhost:3000")!, autoConnect: true)
        socket?.delegate = model
        UITableView.appearance().separatorColor = .clear
    }
    
    var body: some View {
        VStack {
            List(model.messages, rowContent: MessageRow.init)
            HStack {
                TextField("uMessage", text: $message)
                Button(action: send) {
                    Text("Send")
                }
            }
        }.padding().padding(.bottom, keyboard.currentHeight)
    }
    
    func send() {
        model.messages.append(Message(message: message, me: true))
        socket?.send(text: message)
        message = ""
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
