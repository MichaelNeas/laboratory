//
//  NativeWebSocket.swift
//  AllTheNetworks
//
//  Created by Michael Neas on 9/30/19.
//  Copyright © 2019 Neas Lease. All rights reserved.
//

import Foundation
import Combine
import Network

protocol WebSocketConnection {
    func send(text: String)
    func send(data: Data)
    func connect()
    func disconnect()
    var delegate: WebSocketConnectionDelegate? {
        get
        set
    }
}

protocol WebSocketConnectionDelegate {
    func onConnected(connection: WebSocketConnection)
    func onDisconnected(connection: WebSocketConnection, error: Error?)
    func onError(connection: WebSocketConnection, error: Error)
    func onMessage(connection: WebSocketConnection, text: String)
    func onMessage(connection: WebSocketConnection, data: Data)
}

class NativeWebSocket: NSObject, WebSocketConnection, URLSessionWebSocketDelegate {
    var delegate: WebSocketConnectionDelegate?
    var webSocketTask: URLSessionWebSocketTask!
    var urlSession: URLSession!
    let delegateQueue = OperationQueue()
    var sid = ""
    //var components: URLComponents!
    
    init(url: URL) {
        super.init()
//        components = URLComponents(url: url, resolvingAgainstBaseURL: false)
//        components!.queryItems = [
//            URLQueryItem(name: "EIO", value: "3"),
//            URLQueryItem(name: "transport", value: "websocket"),
//        ]
        urlSession = URLSession(configuration: .default, delegate: self, delegateQueue: delegateQueue)
        webSocketTask = urlSession.webSocketTask(with: url)
        connect()
        
    }
    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didOpenWithProtocol protocol: String?) {
        self.delegate?.onConnected(connection: self)
        //sendPing()
    }
    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didCloseWith closeCode: URLSessionWebSocketTask.CloseCode, reason: Data?) {
        self.delegate?.onDisconnected(connection: self, error: nil)
    }
    
    func connect() {
        // required to open socket
        webSocketTask.resume()
        listen()
    }
    
    func disconnect() {
        webSocketTask.cancel(with: .goingAway, reason: nil)
    }
    
    func listen()  {
        webSocketTask.receive { result in
            switch result {
            case .failure(let error):
                self.delegate?.onError(connection: self, error: error)
            case .success(let message):
                switch message {
                case .string(let text):
//                    if text.first == "0" {
//                        self.handleHandShake(response: text)
//                    }
                    self.delegate?.onMessage(connection: self, text: text)
                case .data(let data):
                    self.delegate?.onMessage(connection: self, data: data)
                @unknown default:
                    fatalError()
                }
                
                self.listen()
            }
        }
    }
    
    func handleHandShake(response: String) {
        var response = response
        response.removeFirst()
        let websocketHandShake = try? JSONDecoder().decode(WebsocketHandShake.self, from: response.data(using: .utf8)!)
        sid = String(websocketHandShake!.sid)
        print("Received string: \(sid)")
        //components.queryItems?.append(URLQueryItem(name: "sid", value: sid))
        //webSocketTask = urlSession.webSocketTask(with: components!.url!)
        //webSocketTask.currentRequest?.url?.appendPathComponent("&sid=\(sid)")
        //webSocketTask.currentRequest?.httpBody?.append("&sid=\(sid)".data(using: .utf8))
        //connect()
        //sendPing()
    }
    
    func sendPing() {
        webSocketTask.sendPing { (error) in
          if let error = error {
            print("Sending PING failed: \(error)")
          }

          DispatchQueue.main.asyncAfter(deadline: .now() + 1.0 ) {
            self.sendPing()
          }
        }
    }
    
    func send(text: String) {
        webSocketTask.send(URLSessionWebSocketTask.Message.string(text)) { error in
            if let error = error {
                self.delegate?.onError(connection: self, error: error)
            }
            print("sent: \(text)")
        }
    }
    
    func send(data: Data) {
        webSocketTask.send(URLSessionWebSocketTask.Message.data(data)) { error in
            if let error = error {
                self.delegate?.onError(connection: self, error: error)
            }
        }
    }
}

// MARK: - WebsocketHandShake
struct WebsocketHandShake: Codable {
    let sid: String
    let pingInterval: Int
    let pingTimeout: Int
}
