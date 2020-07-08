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
    @State var createNewAccount = false
    
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
                    Auth.auth().fetchSignInMethods(forEmail: self.email, completion: { query, error in
                        if error != nil {
                            print("We got a big problem")
                        } else if query != nil || self.createNewAccount == true {
                            let credential = EmailAuthProvider.credential(withEmail: self.email, password: self.password)
                            Auth.auth().currentUser?.link(with: credential, completion: { (authResult, error) in
                                if let error = error {
                                    let authError = error as NSError
                                    if authError.code == AuthErrorCode.emailAlreadyInUse.rawValue {
                                        let prevUser = Auth.auth().currentUser
                                        print("previous user: \(prevUser?.uid)")
                                        // try to sign in with credentials
                                        Auth.auth().signIn(with: credential, completion: { (authResult, error) in
                                            if error == nil {
                                                print("replace all data from \(prevUser?.uid) with \(Auth.auth().currentUser?.uid)")
                                                prevUser?.delete(completion: { err in
                                                    print("error deleting user: \(err)")
                                                })
                                                print("retrieve all data")
                                            } else if let error = error {
                                                let authError = error as NSError
                                                if authError.code == AuthErrorCode.wrongPassword.rawValue {
                                                    print("Wrong password")
                                                }
                                            } else {
                                                print("error signing in with creds: \(error)")
                                            }
                                        })
                                    } else if authError.code == AuthErrorCode.weakPassword.rawValue {
                                        print("WEAK PW: \(authError)")
                                    } else {
                                        print(authError)
                                    }
                                } else {
                                    print("successfully authed and linked: \(authResult)")
                                }
                            })
                        } else {
                            // at this point a user needs to be directed to create an account
                            print("Email doesn't exist in system, create an account")
                        }
                    })
                }) {
                    if self.createNewAccount {
                        Text("Create new account and Link")
                    } else {
                        Text("Sign In and Link")
                    }
                }
                
                Button(action: { self.createNewAccount.toggle() }) {
                    if self.createNewAccount {
                        Text("Will attempt to create new account")
                    } else {
                        Text("Will attempt to sign in normally")
                    }
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
