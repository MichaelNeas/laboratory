//
//  Request+ListExample.swift
//  CupcakeCorner
//
//  Created by Michael Neas on 2/14/20.
//  Copyright © 2020 Neas Lease. All rights reserved.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct TContentView: View {
    @State var results = [Result]()
    
    @State var username = ""
    @State var email = ""
    
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
    
    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName).font(.headline)
                Text(item.collectionName)
                
                Form {
                    Section {
                        TextField("Username", text: self.$username)
                        TextField("Email", text: self.$email)
                    }
                    
                    Section {
                        Button("Create Account") {
                            print("Contain")
                        }
                    }
                    .disabled(self.disableForm)
                }
            }
        }
        .onAppear(perform: loadData)
    }
    
    func loadData() {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("invalid")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                    DispatchQueue.main.async {
                        self.results = decodedResponse.results
                    }
                    return
                }
            }
            
            print("Failed \(error?.localizedDescription ?? "oh noe")")
        }.resume()
    }
}

struct TContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
