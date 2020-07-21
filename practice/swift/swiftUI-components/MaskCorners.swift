import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    var mask: some View {
        Rectangle().frame(width: 50, height: 50)
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.red)
                .frame(width: 200, height: 400)
                .overlay(
                    RoundedRectangle(cornerRadius: 20.0)
                        .stroke(Color.white, lineWidth: 4.0)
                        .padding(8)
                        .mask(ZStack {
                            VStack {
                                HStack {
                                    mask
                                    Spacer()
                                    mask
                                }
                                Spacer()
                                HStack {
                                    mask
                                    Spacer()
                                    mask
                                }
                            }
                        })
                )
        }
    }
}

PlaygroundSupport.PlaygroundPage.current.setLiveView(ContentView())
