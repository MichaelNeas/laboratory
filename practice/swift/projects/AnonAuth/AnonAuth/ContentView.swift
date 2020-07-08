//
//  ContentView.swift
//  AnonAuth
//
//  Created by Michael Neas on 7/7/20.
//  Copyright © 2020 neas.lease.anonauth. All rights reserved.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        VStack {
            Text("Testin out anonymous users")
            if Auth.auth().currentUser != nil && Auth.auth().currentUser?.isAnonymous == false {
                Button(action: {
                    do {
                        try Auth.auth().signOut()
                    } catch {
                        print("err auth signout")
                    }
                }) {
                    Text("Sign Out")
                }
            } else {
                TextField("Email", text: $email)
                TextField("Password", text: $password)
                Button(action: {
                    let credential = EmailAuthProvider.credential(withEmail: self.email, password: self.password)
                    Auth.auth().currentUser?.link(with: credential, completion: { (authResult, error) in
                        if let error = error {
                            let authError = error as NSError
                            if authError.code == AuthErrorCode.emailAlreadyInUse.rawValue {
                                print(authError)
                                let prevUser = Auth.auth().currentUser
                                print("previous user: \(prevUser?.uid)")
                                Auth.auth().signIn(with: credential, completion: { (authResult, error) in
                                    print("error signing in with creds: \(error)")
                                    if error == nil {
                                        print("replace all data from \(prevUser?.uid) with \(Auth.auth().currentUser?.uid)")
                                        prevUser?.delete(completion: { err in
                                            print("error deleting user: \(err)")
                                        })
                                    }
                                })
                            }
                        } else {
                            print("successfully authed: \(authResult)")
                        }
                    })

                }) {
                    Text("Sign In, Link")
                }
            }
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
