//
//  ViewController.swift
//  AllTheNetworks
//
//  Created by Michael Neas on 9/30/19.
//  Copyright © 2019 Neas Lease. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var messageBox: UITextView!
    
    var starSock: NativeWebSocket?
    var wsurlString = "ws://localhost:3000/socket.io/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //webSocketTask = WebSocket(url: URL(string: wsurlString)!)
        starSock = NativeWebSocket(url: URL(string: wsurlString)!)
    }
    
    @IBAction func sendButton(_ sender: Any) {
        starSock?.send(text: textField.text!)
    }
    
    @IBAction func disconnect(_ sender: Any) {
        starSock?.disconnect()
    }
    
}
