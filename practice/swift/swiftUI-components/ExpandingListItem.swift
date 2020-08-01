//: A UIKit based Playground for presenting user interface
  
import SwiftUI
import PlaygroundSupport

struct House: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let image: Color
    let description: String
    var expanded = false
}

var houseData = [
    House(name: "Mike", image: .blue, description: "what a nice house"),
    House(name: "John", image: .green, description: "also super dope house"),
    House(name: "Trevor", image: .gray, description: "house fully automated"),
    House(name: "Bill", image: .purple, description: "kinda lame house")
]

struct ContentView: View {
    @State var activeCell = false
    @State var data = houseData
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10) {
                ForEach(0..<data.count){ index in
                    GeometryReader{ geo in
                        VStack {
                            Text(self.data[index].name).font(.title)
                            
                            if self.data[index].expanded {
                                Spacer()
                                Image(systemName: "house.fill").font(.title)
                                Text(self.data[index].description).font(.subheadline)
                            }
                            Spacer()
                        }
                        .frame(width: geo.size.width)
                        .background(self.data[index].image)
                        .offset(y: self.data[index].expanded ? -geo.frame(in: .global).minY : 0)
                        .opacity(self.activeCell ? (self.data[index].expanded ? 1 : 0) : 1)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)) {
                                self.activeCell.toggle()
                                self.data[index].expanded.toggle()
                            }
                        }
                    }.frame(height: self.data[index].expanded ? UIScreen.main.bounds.height : 250)
                }
            }
        }
    }
}
// Present the view controller in the Live View window
PlaygroundSupport.PlaygroundPage.current.setLiveView(ContentView())
