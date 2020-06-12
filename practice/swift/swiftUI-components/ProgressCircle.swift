
import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    @State private var scale: CGFloat = 0
    @State private var progressValue: Float = 0.0
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottom){
                ProgressCircle(progress: self.$progressValue)
                    .scaleEffect(self.scale)
                    .frame(width: 150.0, height: 150.0)
                    .padding()
            }
        }.edgesIgnoringSafeArea(.all)
        .background(Color(red: 9/255, green: 102/255, blue: 250/255))
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(.spring(dampingFraction: 0.45)) {
                    self.scale += 0.95
                }
                
                self.progressValue = 1.0
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.7) {
                    withAnimation(.spring(dampingFraction: 0.12)) {
                        self.scale += 0.05
                    }
                }
            }
        }
    }
}

struct ProgressCircle: View {
    @Binding var progress: Float
    @State private var tapped = false
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 10.0)
                .opacity(0.3)
                .foregroundColor(Color.white)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.white)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear(duration: 1.8))
                .overlay(Circle().fill(Color.white).opacity(self.tapped ? 1.0 : 0.01))
                .gesture(TapGesture()
                    .onEnded { _ in
                        self.tapped.toggle()
                    }
                )
        }
    }
}


PlaygroundPage.current.setLiveView(ContentView())
