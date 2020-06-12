
import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    @State private var showMenu = false
    @State private var rayScanner = false
    @State private var scale: CGFloat = 0
    @State private var showScanner = true
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottom){
                Circle()
                    .stroke(Color.white, lineWidth: 2.0)
                    .scaleEffect(self.scale)
                    .frame(width: 30, height: 30)
                    .position(x: 120.0, y: 140.0)
                Circle()
                    .stroke(Color.white, lineWidth: 2.0)
                    .scaleEffect(self.scale)
                    .frame(width: 30, height: 30)
                    .position(x: 220.0, y: 470.0)
                Circle()
                    .stroke(Color.white, lineWidth: 2.0)
                    .scaleEffect(self.scale)
                    .frame(width: 30, height: 30)
                    .position(x: 340.0, y: 300.0)
                
                if self.showScanner {
                    ZStack {
                        Path { path in
                            path.move(to: CGPoint(x: 0, y: 0))
                            path.addLine(to: CGPoint(x: geo.size.width / 2, y: 0))
                        }
                        .stroke(Color.green, lineWidth: 5.0)
                        .clipped()
                        .offset(x: 0, y: self.rayScanner ? geo.size.width / 2 : 0.0)
                    }
                    .frame(width: geo.size.width / 2, height: geo.size.width / 2)
                    .cornerRadius(20.0)
                    .overlay(RoundedRectangle(cornerRadius: 20.0)
                    .stroke(Color.white, lineWidth: 1.5))
                    .position(x: geo.size.width / 2, y: geo.size.width / 2)
                    .transition(.opacity)
                }
                
                if self.showMenu {
                    HStack {
                        ForEach(0..<4) { _ in
                            Circle()
                                .fill(Color.gray)
                                .frame(width: 44, height: 44)
                                .padding()
                        }
                    }
                    .frame(width: geo.size.width, height: 80.0, alignment: .bottom)
                    .transition(.move(edge: .bottom))
                    .background(Color.white)
                    .cornerRadius(radius: 20.0, corners: [.topLeft, .topRight])
                    .shadow(radius: 10.0)
                }
            }
        }.edgesIgnoringSafeArea(.all)
        .background(Color(red: 9/255, green: 102/255, blue: 250/255))
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(.spring()) {
                    self.showMenu = true
                }
                
                withAnimation(.spring(dampingFraction: 0.45)) {
                    self.scale += 1
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                withAnimation() {
                    self.showScanner = false
                }
            }
            
            withAnimation(Animation.linear(duration: 3.0).repeatForever(autoreverses: false)) {
                self.rayScanner.toggle()
            }
            
            
        }
    }
}

struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner

    struct CornerRadiusShape: Shape {

        var radius = CGFloat.infinity
        var corners = UIRectCorner.allCorners

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }

    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}

extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}

PlaygroundPage.current.setLiveView(ContentView())
