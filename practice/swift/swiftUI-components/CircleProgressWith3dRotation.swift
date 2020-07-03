//: A UIKit based Playground for presenting user interface
  
import SwiftUI
import PlaygroundSupport

struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(15.0)
    }
    
    
}


struct CirclularProgressBar: View {
    @Binding var progress: Float
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20.0)
                .opacity(0.3)
                .foregroundColor(Color.red)
            
            Circle()
                .rotation(.degrees(270))
                .trim(from: 0.0, to: CGFloat(self.progress))
                .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.red)
                .animation(Animation.easeInOut(duration: 0.5))
                .rotation3DEffect(.degrees(180), axis: (x: 0, y: self.progress == 0 ? 1 : 0, z: 0))
            
            Text("\(Int(progress * 100.0)) %")
                .font(.system(size: 35, weight: .bold, design: .default))
        }
    }
}


struct ContentView: View {
    
    @State private var progressValue: Float = 0.0
    
    var body: some View {
        ZStack {
            Color.yellow.edgesIgnoringSafeArea(.all).opacity(0.05)
            
            VStack(spacing: 40) {
                CirclularProgressBar(progress: $progressValue)
                    .frame(width: 150, height: 150)
                Button(action: {
                    if self.progressValue < 1.0 {
                        self.progressValue += 0.1
                    } else {
                        self.progressValue = 0.0
                    }
                    print(self.progressValue)
                    
                }, label: {
                    HStack {
                        Image(systemName: "plus")
                            .font(.system(size: 25, weight: .semibold, design: .rounded))
                        Text("Increment")
                            .font(.system(size: 25, weight: .semibold, design: .rounded))
                    }
                })
                .buttonStyle(GradientButtonStyle())
            }
        }
    }
}


PlaygroundPage.current.setLiveView(ContentView())
