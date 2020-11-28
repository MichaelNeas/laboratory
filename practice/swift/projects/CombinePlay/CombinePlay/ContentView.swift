//
//  ContentView.swift
//  CombinePlay
//
//  Created by Michael Neas on 11/28/20.
//

import SwiftUI
import Combine

class SomePublisher {
    let myURL = URL(string: "http://placekitten.com/200/300")
    var cancellables: Set<AnyCancellable> = []
    
    let x = PassthroughSubject<String, Never>()
        .flatMap { name in
            return Future<String, Error> { promise in
                promise(.success(""))
                }.catch { _ in
                    Just("No user found")
                }.map { result in
                    return "\(result) foo"
            }
    }.eraseToAnyPublisher()
    
    init() {
        Just(5)
            .map { value -> String in
                // do something with the incoming value here
                // and return a string
                return "a string"
            }
            .sink { receivedValue in
                // sink is the subscriber and terminates the pipeline
                print("The end result was \(receivedValue)")
            }.store(in: &cancellables)
        
        URLSession.shared.dataTaskPublisher(for: myURL!)
            // the dataTaskPublisher output combination is (data: Data, response: URLResponse)
            .map { $0.data }
            .decode(type: PostmanEchoTimeStampCheckResponse.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { completion in
                    print(".sink() received the completion", String(describing: completion))
                    switch completion {
                        case .finished:
                            break
                        case .failure(let anError):
                            print("received error: ", anError)
                    }
            }, receiveValue: { someValue in
                print(".sink() received \(someValue)")
            }).store(in: &cancellables)
    }
    
    // checks the validity of a timestamp - this one returns {"valid":true}
    // matching the data structure returned from https://postman-echo.com/time/valid
    fileprivate struct PostmanEchoTimeStampCheckResponse: Decodable, Hashable {
        let valid: Bool
    }

    func action() {
        print("Submit")
    }
}



class TextEngine:ObservableObject{
    @Published var textInput = ""
    @Published var textOutput = ""
    private var worker:AnyCancellable? = nil
    
    init() {
        worker = $textInput.print("raw input")
            .debounce(for: 2, scheduler: RunLoop.main)
            .removeDuplicates{$0 == $1}
            .print("debounced and duplicates removed")
            .assign(to:\.textOutput, on:self)
    }
}

struct ContentView: View {
    @State var name: String = ""
    @State var username: String = ""
    @State var toggle: Bool = false
    @State var toggleTwo: Bool = false
    let funPub = SomePublisher()
    
    var body: some View {
        VStack(alignment: .center) {
            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Username", text: $username)
                .textFieldStyle(PlainTextFieldStyle())
            Toggle("Required Button", isOn: $toggle)
                .toggleStyle(SwitchToggleStyle(tint: Color.purple))
            Toggle("Required Button 2", isOn: $toggleTwo)
                .toggleStyle(SwitchToggleStyle(tint: Color.pink))
            
            Button("Submit", action: {
                funPub.action()
            })
        }.padding()
    }
}
