import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    @State var showing = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                
                if self.showing {
                    Image(systemName: "viewfinder")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .thin))
                        .frame(width: 100, height: 100, alignment: .center)
                        .position(x: geo.size.width / 2, y: (geo.size.height / 2) - 140)
                        .transition(.scale)
                }
                
                VStack {
                    Spacer()
                    VStack(spacing: 20) {
                        Text("Title")
                            .font(.title)
                        Text("body")
                            .font(.subheadline)
                        Button(action: {}) {
                            Text("BUTTON")
                                .foregroundColor(.black)
                                .padding(12)
                                .overlay(
                                    Capsule()
                                        .stroke(Color.black, lineWidth: 1.5)
                                )
                        }
                    }
                    .padding(EdgeInsets(top: 20, leading: 50, bottom: 20, trailing: 50))
                    .frame(width: geo.size.width, height: geo.size.height/2.5, alignment: .top)
                    .background(Color.white)
                    .cornerRadius(10, corners: [.topLeft, .topRight])
                    .offset(x: 0, y: self.showing ? 0 : geo.size.height/2.5)
                    .animation(.spring())
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color.black)
        .onAppear() {
            withAnimation {
                self.showing = true
            }
        }
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

PlaygroundSupport.PlaygroundPage.current.setLiveView(ContentView())